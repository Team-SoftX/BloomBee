import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Single());
}

class Single extends StatefulWidget {
  @override
  _SingleState createState() => _SingleState();
}

class _SingleState extends State<Single> {
  final controller = TextEditingController();
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();

  String aa = '';
  String bb = '';

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 130, 7),
      // appBar: AppBar(
      //   title: TextField(controller: controller),
      // ),
      appBar: AppBar(
        title: const Text('All User'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Text("DSFDSFDSFSDF"),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.text_fields),
                hintText: 'Enter Parent name',
                labelText: 'Name',
              ),
            ),
            Container(
              child: FutureBuilder<User?>(
                  future: readUser(),
                  builder: (context, snapshot) {
//1st way
                    String sss = "${snapshot.data?.PName}";
                    if (snapshot.connectionState != ConnectionState.done) {
                      const Center(child: CircularProgressIndicator());
                      return const Text("Loading data ..... Please Wait");
                    }
                    return TextFormField(
                      initialValue: sss,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.text_fields),
                        labelText: 'Name',
                      ),
                    );
//2st way

                    // if (snapshot.hasError) {
                    //   return Text('Something Wrong! ${snapshot.error}');
                    // } else if (snapshot.hasData) {
                    //   final user = snapshot.data;

                    //   return user == null
                    //       ? const Center(child: Text('No User'))
                    //       : buildUser(user);
                    // } else {
                    //   return const Center(child: CircularProgressIndicator());
                    // }
                  }),
            ),
            Container(
              child: FutureBuilder<User?>(
                  future: readUser(),
                  builder: (context, snapshot) {
                    // if (snapshot.connectionState !=
                    //     ConnectionState.done) {
                    //   return const Center(
                    //       child: CircularProgressIndicator());
                    // }

                    return TextFormField(
                      initialValue: "${snapshot.data?.PName}",
                      decoration: InputDecoration(
                        icon: const Icon(Icons.text_fields),
                        labelText: '${snapshot.data?.PName}',
                      ),
                    );
                  }),
            ),
            Container(
              child: FutureBuilder<User?>(
                  future: readUser(),
                  builder: (context, snapshot) {
//1st way

                    if (snapshot.connectionState != ConnectionState.done) {
                      const Center(child: CircularProgressIndicator());
                      return const Text("Loading data ..... Please Wait");
                    }
                    return Text("Parent Name : ${snapshot.data?.PName}");
//2st way

                    // if (snapshot.hasError) {
                    //   return Text('Something Wrong! ${snapshot.error}');
                    // } else if (snapshot.hasData) {
                    //   final user = snapshot.data;

                    //   return user == null
                    //       ? const Center(child: Text('No User'))
                    //       : buildUser(user);
                    // } else {
                    //   return const Center(child: CircularProgressIndicator());
                    // }
                  }),
            )
          ]))
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

  Future<User?> readUser() async {
    final userdata = FirebaseAuth.instance.currentUser?.uid;
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc("SLXW1q5BXogdi5eWSBEN5otcRWo1")
        .get();

    if (snapshot.exists) {
      return User.fromJson(snapshot.data()!);
    }

    // .snapshots().map((snapshot) =>
    // snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
  }

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
