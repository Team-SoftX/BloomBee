import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(
  //         "User Profile",
  //       ),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //             "Welcome to your profile",
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 20,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 40,
  //           ),
  //           MaterialButton(
  //             color: Colors.red,
  //             onPressed: () {},
  //             child: Text(
  //               'Logout',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 30,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    final User = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.1,
              0.4,
              0.6,
              0.9,
            ],
            colors: [
              Color.fromARGB(255, 247, 223, 6),
              Colors.red,
              Colors.indigo,
              Colors.teal,
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'The User is',
                style: TextStyle(fontSize: 16),
              ), // Теxt
              SizedBox(height: 8),
              Text(User.email!, style: TextStyle(fontSize: 20)),
              SizedBox(height: 40),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                icon: const Icon(Icons.arrow_back, size: 32),
                label: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
