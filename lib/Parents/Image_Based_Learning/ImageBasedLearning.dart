import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:register/Admin_Portal/manageactivity.dart';
import 'package:register/Admin_Portal/viewAllUsers.dart';
import 'package:register/Home_Page/screens/DarkMood/settings.dart';
import 'package:register/Home_Page/screens/base_screen.dart';
import 'package:register/editProfile.dart';
import 'package:just_audio/just_audio.dart';

class ImageBasedLearning extends StatefulWidget {
  @override
  _ImageBasedLearningState createState() => _ImageBasedLearningState();
}

// class _ImageBasedLearningState extends State<ImageBasedLearning> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Builder(
//             builder: (context) => Scaffold(
//                   appBar: AppBar(
//                     title: const Text('Image Based Learning'),
//                     backgroundColor: Color.fromARGB(255, 35, 116, 39),
//                     leading: GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => BaseScreen(),
//                             ));
//                       },
//                       child:
//                           const Icon(Icons.arrow_back // add custom icons also
//                               ),
//                     ),
//                   ),
//                   backgroundColor: Color.fromARGB(255, 2, 23, 55),
//                 )));
//   }
// }

class _ImageBasedLearningState extends State<ImageBasedLearning> {
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

    // Scaffold(
    //     appBar: new AppBar(
    //       title: new Text("Settings"),
    //     ),
    //     body: new Center(
    //       child: new Text("This is Settings Add night mode here"),
    //     ));
  }
}

class SettingsPages extends StatefulWidget {
  SettingsPages({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SettingsPagesState createState() => _SettingsPagesState();
}

class _SettingsPagesState extends State<SettingsPages> {
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   darkNotifier.dispose();
  //   super.dispose();
  // }
  // Future<AudioPlayer> playLocalAsset() async {
  //   AudioCache cache = new AudioCache();
  //   //At the next line, DO NOT pass the entire reference such as assets/yes.mp3. This will not work.
  //   //Just pass the file name only.
  //   return await cache.play("assets/pronunciation_en_papa.mp3");
  // }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Based Learning'),
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
                            // await player.setAsset(
                            //     'assets/audio/pronunciation_en_papa.mp3');
                            // player.play();
                          },
                          child: Image.asset(
                            'img/FATHER.png', //1
                            fit: BoxFit.scaleDown,
                            height: 130,
                          ),
                        ),

                        // TextButton(
                        //     child: const Text('All Parents'),
                        //     onPressed: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => ViewAllUser(),
                        //         ),
                        //       );
                        //     }),
                      ],
                    ),
                  ),
                  Card(
                    // shape: RoundedRectangleBorder(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),
                        MaterialButton(
                          onPressed: () async {
                            // await player.setAsset(
                            //     'assets/audio/pronunciation_en_papa.mp3');
                            // player.play();
                          },
                          child: Image.asset(
                            'img/mother.jpg', //2
                            fit: BoxFit.scaleDown,
                            height: 130,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    // shape: RoundedRectangleBorder(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // SvgPicture.network(
                        //   'https://image.flaticon.com/icons/svg/1994/1904425.svg',
                        //   height: 128,
                        // ),

                        MaterialButton(
                          onPressed: () async {
                            // await player.setAsset(
                            //     'assets/audio/pronunciation_en_papa.mp3');
                            // player.play();
                          },
                          child: Image.asset(
                            'img/brother.jpg', //3
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
                            // await player.setAsset(
                            //     'assets/audio/pronunciation_en_papa.mp3');
                            // player.play();
                          },
                          child: Image.asset(
                            'img/sister.jpg', //4
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
                            // await player.setAsset(
                            //     'assets/audio/pronunciation_en_papa.mp3');
                            // player.play();
                          },
                          child: Image.asset(
                            'img/grandma.jpg',
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
                            // await player.setAsset(
                            //     'assets/audio/pronunciation_en_papa.mp3');
                            // player.play();
                          },
                          child: Image.asset(
                            'img/grandpa.png',
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
                            // await player.setAsset(
                            //     'assets/audio/pronunciation_en_papa.mp3');
                            // player.play();
                          },
                          child: Image.asset(
                            'img/banana.jpg',
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
                            // await player.setAsset(
                            //     'assets/audio/pronunciation_en_papa.mp3');
                            // player.play();
                          },
                          child: Image.asset(
                            'img/apple.jpg',
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
                            // await player.setAsset(
                            //     'assets/audio/pronunciation_en_papa.mp3');
                            // player.play();
                          },
                          child: Image.asset(
                            'img/star_1.png',
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
                            // await player.setAsset(
                            //     'assets/audio/pronunciation_en_papa.mp3');
                            // player.play();
                          },
                          child: Image.asset(
                            'img/cat.jpg',
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
                            // await player.setAsset(
                            //     'assets/audio/pronunciation_en_papa.mp3');
                            // player.play();
                          },
                          child: Image.asset(
                            'img/dog.png',
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
                            // await player.setAsset(
                            //     'assets/audio/pronunciation_en_papa.mp3');
                            // player.play();
                          },
                          child: Image.asset(
                            'img/train.jpg',
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
