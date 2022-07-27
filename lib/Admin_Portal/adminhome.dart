import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:register/Admin_Portal/manageactivity.dart';
import 'package:register/editProfile.dart';
import 'package:register/Admin_Portal/viewAllUsers.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final email = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .7,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img/images02.jpg'),
                  alignment: Alignment.topCenter),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/seed/picsum/200/300'),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Welcome Admin, ',
                              style: TextStyle(
                                  fontFamily: 'Lobster',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 3, 19, 237)),
                            ),
                            Text(
                              '\n        Email: ' + email!,
                              style: const TextStyle(
                                  fontFamily: 'Lobster',
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 21, 2, 121)),
                            ),
                          ],
                        ),
                        // child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //    crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: <Widget>[
                        //   Text('John Rick')
                      ],
                      // )
                    ),
                    // ]
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewAllUser(),
                              ),
                            );
                          },
                          color: Colors.lightBlue.withOpacity(.2),
                          // shape: RoundedRectangleBorder(),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),

                              Text('All Parents'),
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewAllUser(),
                              ),
                            );
                          },

                          color:
                              Color.fromARGB(255, 29, 180, 9).withOpacity(.2),
                          // shape: RoundedRectangleBorder(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),
                              Text('Set Daily Activity'),
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ManageActivity(),
                              ),
                            );
                          },

                          color:
                              Color.fromARGB(255, 38, 240, 247).withOpacity(.1),
                          // shape: RoundedRectangleBorder(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // SvgPicture.network(
                              //   'https://image.flaticon.com/icons/svg/1994/1904425.svg',
                              //   height: 128,
                              // ),

                              Text('Manage Tasks'),
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewAllUser(),
                              ),
                            );
                          },

                          color: Colors.lightBlue.withOpacity(.2),
                          //shape: RoundedRectangleBorder(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),

                              Text('Check Learning Materials'),
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfilePage(),
                              ),
                            );
                          },

                          color: Colors.lightBlue.withOpacity(.2),
                          //shape: RoundedRectangleBorder(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),

                              Text('Profile'),
                            ],
                          ),
                        ),
                      ],

                      // crossAxisCount: 2)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
