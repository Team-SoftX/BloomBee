import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:register/Admin_Portal/manageactivity.dart';
import 'package:register/Admin_Portal/viewAllUsers.dart';
import 'package:register/Home_Page/screens/DarkMood/settings.dart';
import 'package:register/Home_Page/screens/base_screen.dart';
import 'package:register/Parents/Video_Based_Learning/video.dart';
import 'package:register/editProfile.dart';
import 'package:just_audio/just_audio.dart';

class mainThumnail extends StatefulWidget {
  @override
  _mainThumnailState createState() => _mainThumnailState();
}

class _mainThumnailState extends State<mainThumnail> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: darkNotifier,
        builder: (BuildContext context, bool isDark, Widget? child) {
          return MaterialApp(
            title: 'Dark Theme',
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(primaryColor: Colors.green),
            darkTheme: ThemeData.dark(),
            home: SettingsPages(
              title: 'Theme',
            ),
          );
        });
  }
}

class SettingsPages extends StatefulWidget {
  SettingsPages({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SettingsPagesState createState() => _SettingsPagesState();
}

class _SettingsPagesState extends State<SettingsPages> {
  String url1 = 'https://youtu.be/C7oebqj3PCY';
  String url2 = 'https://youtu.be/eegWzglBMh0';
  String url3 = 'https://youtu.be/XqZsoesa55w';
  String url4 = 'https://youtu.be/e_04ZrNroTo';
  String url5 = 'https://youtu.be/pZw9veQ76fo';
  String url6 = 'https://youtu.be/M3WvViAUgyg';
  String url7 = 'https://youtu.be/PcWvsNbEeq8';
  String url8 = 'https://youtu.be/OuaG-iBDpts';

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Based Learning'),
        backgroundColor: Color.fromARGB(255, 35, 116, 39),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BaseScreen(),
                ));
          },
          child: const Icon(Icons.arrow_back // add custom icons also
              ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                primary: false,
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    //shape: RoundedRectangleBorder(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoPlayerScreen(valueurl: url1),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/thumnail/1.jpg', //1
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoPlayerScreen(valueurl: url2),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/thumnail/2.jpg', //2
                            fit: BoxFit.scaleDown,
                            height: 130,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // SvgPicture.network(
                        //   'https://image.flaticon.com/icons/svg/1994/1904425.svg',
                        //   height: 128,
                        // ),

                        MaterialButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoPlayerScreen(valueurl: url3),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/thumnail/3.jpg', //3
                            fit: BoxFit.scaleDown,
                            height: 130,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    //shape: RoundedRectangleBorder(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),

                        MaterialButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoPlayerScreen(valueurl: url4),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/thumnail/4.jpg', //4
                            fit: BoxFit.scaleDown,
                            height: 130,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    //shape: RoundedRectangleBorder(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),

                        MaterialButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoPlayerScreen(valueurl: url5),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/thumnail/5.jpg',
                            fit: BoxFit.scaleDown,
                            height: 130,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    //shape: RoundedRectangleBorder(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),

                        MaterialButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoPlayerScreen(valueurl: url6),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/thumnail/6.jpg',
                            fit: BoxFit.scaleDown,
                            height: 130,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    //shape: RoundedRectangleBorder(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),

                        MaterialButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoPlayerScreen(valueurl: url7),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/thumnail/7.jpg',
                            fit: BoxFit.scaleDown,
                            height: 130,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    //shape: RoundedRectangleBorder(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),

                        MaterialButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoPlayerScreen(valueurl: url8),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/thumnail/8.jpg',
                            fit: BoxFit.scaleDown,
                            height: 130,
                          ),
                        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isDark = !isDark;
          darkNotifier.value = isDark;
        },
        tooltip: 'Increment',
        child: Icon(isDark ? Icons.wb_sunny_outlined : Icons.bubble_chart),
      ),
    );
  }
}
