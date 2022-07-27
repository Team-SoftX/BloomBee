import 'package:flutter/material.dart';

final darkNotifier = ValueNotifier<bool>(false);

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
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
