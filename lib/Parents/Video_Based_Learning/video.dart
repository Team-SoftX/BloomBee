import 'dart:async';

import 'package:flutter/material.dart';
import 'package:register/Home_Page/screens/DarkMood/settings.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  String valueurl;
  VideoPlayerScreen({Key? key, required this.valueurl}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState(valueurl);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  String valueurl;
  _VideoPlayerScreenState(this.valueurl);
  late Future<void> _initializeVideoPlayerFuture;

  late YoutubePlayerController controller;

  @override
  void deactivate() {
    // TODO: implement deactivate
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(valueurl)!);
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kids Video'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: controller,
              ),
              builder: (context, player) {
                return Scaffold(
                    body: ListView(
                  children: [
                    player,
                  ],
                ));
              },
            ),
          ),
        ],
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
