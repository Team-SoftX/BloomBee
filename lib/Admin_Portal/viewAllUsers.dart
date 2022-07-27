// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:register/Admin_Portal/adminhome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ViewAllUser());
}

class ViewAllUser extends StatefulWidget {
  @override
  _ViewAllUserState createState() => _ViewAllUserState();
}

class _ViewAllUserState extends State<ViewAllUser> {
  final controller = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerName = TextEditingController();

  Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(child: Text('${user.PAge}')),
        title: Text(user.PName),
      );

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  InputDecoration decoration(String label) =>
      InputDecoration(labelText: label, border: const OutlineInputBorder());

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users');

    final userdata = FirebaseAuth.instance.currentUser?.uid;
    user.id = userdata.toString();
    final json = user.toJson();
    await docUser.doc(userdata).set(json);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 218, 107),
        appBar: AppBar(
          title: Text("All Parents"),
          backgroundColor: Color.fromARGB(248, 2, 123, 16),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            child: Icon(Icons.arrow_back // add custom icons also
                ),
          ),
        ),
        body: StreamBuilder<List<User>>(
            stream: readUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something Wrong! ${snapshot.error}');
              } else if (snapshot.hasData) {
                final users = snapshot.data!;

                return ListView(
                  children: users.map(buildUser).toList(),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      );
}

class User {
  User({
    this.id = '',
    required this.PName,
    required this.PAge,
    required this.ChildName,
    required this.ChildAge,
    required this.ChildGender,
  });

  double ChildAge;
  String ChildGender;
  String ChildName;
  double PAge;
  String PName;
  String id;

  Map<String, dynamic> toJson() => {
        'id': id,
        'Parent Name': PName,
        'Parent Age': PAge,
        'Child Name': ChildName,
        'Child Age': ChildAge,
        'Child Gender': ChildGender,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        PName: json['Parent Name'],
        PAge: json['Parent Age'],
        ChildName: json['Child Name'],
        ChildAge: json['Child Age'],
        ChildGender: json['Child Gender'],
      );
}
