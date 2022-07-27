// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Write());
}

class Write extends StatefulWidget {
  @override
  _WriteState createState() => _WriteState();
}

class _WriteState extends State<Write> {
  final controller = TextEditingController();
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 201, 130, 7),
        // appBar: AppBar(
        //   title: TextField(controller: controller),
        // ),
        appBar: AppBar(
          title: const Text('All User'),
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
                ); // ListView

              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),

        //   padding: const EdgeInsets.all(16),
        //   children: <Widget>[
        //     TextField(
        //       controller: controllerName,
        //       decoration: decoration('Name'),
        //     ),
        //     const SizedBox(
        //       height: 24,
        //     ),
        //     TextField(
        //       controller: controllerAge,
        //       decoration: decoration('Age'),
        //       keyboardType: TextInputType.number,
        //     ),
        //     // const SizedBox(height:24),
        //     // DateTimeField(
        //     //   controller: controllerDate,
        //     //   decoration: decoration('Birthday'),
        //     //   format: dateFormat('yyy-MM-dd'),
        //     //   onShowPicker: (context, currentValue)=>
        //     //   context: context,
        //     //   firstDate: DateTime(1900),
        //     //   lastDate: DateTime(2100),
        //     //   initialDate: currentValue ?? DateTime.n

        //     //    const SizeBox(height:32);
        //     ElevatedButton(
        //       child: const Text('Create'),
        //       onPressed: () {
        //         //      final name = controller.text;
        //         //  createUser(name: name);
        //         final user = User(
        //           name: controllerName.text,
        //           age: int.parse(controllerAge.text),
        //           // birthday: DateTime.parse(controllerDate.text),
        //         );
        //         createUser(user);
        //         Navigator.pop(context);
        //       },
        //     ),
        //   ],
        // ),
        // // actions: [
        // //   IconButton(
        // //     icon: const Icon(Icons.add),
        // //     onPressed: () {
        // //       final name = controller.text;
        // //       createUser(name: name);
        // //     },
        // //   )
        // // ],
        // // ),
      );

  Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(child: Text('${user.PAge}')),
        title: Text(user.PName),
        // subtitle:Text(user.birthday.toIso8601String())
      ); // ListTile

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
  // snapshot.docs.map((doc) => User.fromJson(doc.data()).toList());

  InputDecoration decoration(String label) =>
      InputDecoration(labelText: label, border: const OutlineInputBorder());
  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users');

    final userdata = FirebaseAuth.instance.currentUser?.uid;
    user.id = userdata.toString();
    final json = user.toJson();
    await docUser.doc(userdata).set(json);
  }
}

class User {
  String id;
  String PName;
  double PAge;
  String ChildName;
  double ChildAge;
  String ChildGender;

  User({
    this.id = '',
    required this.PName,
    required this.PAge,
    required this.ChildName,
    required this.ChildAge,
    required this.ChildGender,
  });
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
