import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hypecoin/routes/app_router.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isdark = false;
  bool isTurkish = true;
  final List<String> items = [
    'Türkçe',
    'English',
  ];
  String? selectedValue;
  late VideoPlayerController _controller;
  bool _visible = false;

  @override
  void initState() {
    new Future.delayed(
        const Duration(seconds: 3),
        () => context.router
            .pushAndPopUntil(LoginRoute(), predicate: (route) => false));

    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset("assets/videos/metaverse.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 1000),
      child: VideoPlayer(_controller),
    );
  }

  _getBackgroundColor() {
    return Container(
      color: Color.fromRGBO(252, 3, 227, 0.3),
    );
  }

  _getContent() {
    return Center(
      child: Text(
        "HIBEMI",
        style: TextStyle(color: Colors.white, fontSize: 70),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _getVideoBackground(),
          _getBackgroundColor(),
          _getContent(),
        ],
      ),
    );
  }
}
