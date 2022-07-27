// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:register/Admin_Portal/adminhome.dart';
import 'package:register/Home_Page/screens/base_screen.dart';
import 'package:register/home.dart';

import 'forgot.dart';

import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/loginimg.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height * 0.70,
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height * 0.70,
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "BloomBee",
                                style: TextStyle(
                                  fontFamily: 'Lobster',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: Color.fromARGB(255, 21, 137, 0),
                                ),
                              ),
                              const Text(
                                "Login",
                                style: TextStyle(
                                  fontFamily: 'Lobster',
                                  color: Color.fromARGB(255, 113, 43, 43),
                                  fontSize: 30,
                                ),
                              ),
                              const SizedBox(
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
                                          offset: Offset(1, 1),
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
                                      borderSide:
                                          new BorderSide(color: Colors.white),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white),
                                      borderRadius:
                                          new BorderRadius.circular(10),
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
                                  onSaved: (value) {
                                    emailController.text = value!;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              const SizedBox(
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
                                          offset: Offset(1, 1),
                                          color: Colors.grey.withOpacity(0.2))
                                    ]),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: _isObscure3,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        icon: Icon(_isObscure3
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure3 = !_isObscure3;
                                          });
                                        }),
                                    fillColor: Colors.white,
                                    hintText: 'Password',
                                    enabled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 15.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (value) {
                                    RegExp regex = new RegExp(r'^.{6,}$');
                                    if (value!.isEmpty) {
                                      return "Password cannot be empty";
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("please enter valid password min. 6 character");
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    passwordController.text = value!;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                elevation: 5.0,
                                height: 40,
                                onPressed: () {
                                  setState(() {
                                    visible = true;
                                  });
                                  signIn(emailController.text,
                                      passwordController.text);
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                color: Colors.green,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              RaisedButton(
                                color: Colors.white,
                                textColor: Colors.black,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Forgotpass()));
                                },
                                child: const Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.lightGreen,
                    width: MediaQuery.of(context).size.width,

                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            elevation: 5.0,
                            height: 40,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                            color: Colors.white,
                            child: const Text(
                              "SignUp",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )));
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              if (FirebaseAuth.instance.currentUser?.uid ==
                      "uarsqx0DDJalRjLGDTez8Zm32AV2" ||
                  FirebaseAuth.instance.currentUser?.uid ==
                      "TLwI5NLd3GOpAsA25RymuibBB172") return HomeScreen();
              return BaseScreen();
            },
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
