import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:register/Home_Page/constants/color.dart';
import 'package:register/Home_Page/constants/icons.dart';
import 'package:register/Home_Page/constants/size.dart';
import 'package:register/Home_Page/screens/course_screen.dart';
import 'package:register/Home_Page/screens/payment/donation.dart';
import 'package:register/Home_Page/screens/featuerd_screen.dart';
import 'package:register/Home_Page/screens/DarkMood/settings.dart';
import 'package:register/Home_Page/screens/chat.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const FeaturedScreen(),
    DonationPage(),
    LiveChat(),
    SettingsPage()
  ];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // static const List<Widget> _widgetOptions = <Widget>[
  //   FeaturedScreen(),
  //   FeaturedScreen(),
  //   FeaturedScreen(),
  //   FeaturedScreen(),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              icFeatured,
              height: kBottomNavigationBarItemSize,
            ),
            icon: Image.asset(
              icFeaturedOutlined,
              height: kBottomNavigationBarItemSize,
            ),
            label: "Featured",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.volunteer_activism_outlined,
              color: Colors.blue,
            ),
            icon: Icon(
              Icons.volunteer_activism_outlined,
            ),
            label: "Subscription",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.chat_outlined,
              color: Colors.blue,
            ),
            icon: Icon(
              Icons.chat_outlined,
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              icSetting,
              height: kBottomNavigationBarItemSize,
            ),
            icon: Image.asset(
              icSettingOutlined,
              height: kBottomNavigationBarItemSize,
            ),
            label: "Settings",
          ),
        ],
        // currentIndex: _selectedIndex,
        // onTap: (int index) {
        //   setState(() {
        //     _selectedIndex = index;
        //   });
      ),
    );
  }
}
