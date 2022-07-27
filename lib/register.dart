import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'editProfile.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _RegisterState();
  FirebaseFirestore db = FirebaseFirestore.instance;

  bool showProgress = false;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
      new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Color.fromARGB(255, 2, 62, 151),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/loginimg.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const SizedBox(
                        //   height: 20,
                        // ),

                        Text(
                          "BloomBee",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue),
                        ),
                        Text(
                          "Sign up into your account",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[500]),
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 7,
                                    offset: const Offset(1, 1),
                                    color: Colors.grey.withOpacity(0.2))
                              ]),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: 'Email',
                              enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(20),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              if (value!.length == 0) {
                                return "Email cannot be empty";
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please enter a valid email");
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {},
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 7,
                                    offset: const Offset(1, 1),
                                    color: Colors.grey.withOpacity(0.2))
                              ]),
                          child: TextFormField(
                            obscureText: _isObscure,
                            controller: passwordController,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                              fillColor: Colors.white,
                              hintText: 'Password',
                              enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 15.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(20),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              RegExp regex = new RegExp(r'^.{6,}$');
                              if (value!.isEmpty) {
                                return "Password cannot be empty";
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter valid password minimum 6 character");
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {},
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 7,
                                    offset: const Offset(1, 1),
                                    color: Colors.grey.withOpacity(0.2))
                              ]),
                          child: TextFormField(
                            obscureText: _isObscure2,
                            controller: confirmpassController,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure2
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure2 = !_isObscure2;
                                    });
                                  }),
                              fillColor: Colors.white,
                              hintText: 'Confirm Password',
                              enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 15.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(20),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(20),
                              ),
                            ),
                            validator: (value) {
                              if (confirmpassController.text !=
                                  passwordController.text) {
                                return "Password not matched";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {},
                          ),
                        ),

                        SizedBox(
                          height: 50,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MaterialButton(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              height: 40,
                              onPressed: () {
                                const CircularProgressIndicator();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              color: Colors.green,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              height: 40,
                              onPressed: () {
                                setState(() {
                                  showProgress = true;
                                });
                                signUp(
                                  emailController.text,
                                  passwordController.text,
                                );
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: email,
              password: password,
            )
            .whenComplete(() => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditProfilePage(),
                    ),
                  )
                });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('Password too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('Account already exists for this email.');
        }
      } catch (e) {
        print(e);
      }
    }

    CircularProgressIndicator();
  }
}
