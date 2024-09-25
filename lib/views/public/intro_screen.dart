import 'package:drtest/ui/widgets/video_player.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Intro"),
      ),
      body: const VideoApp(
          video: "https://acafib.ir/app/assets/assets/video/intro.mp4"),
    );
  }
}
