import 'package:drtest/ui/widgets/video_player.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  final videoUrl = "https://acafib.ir/app/assets/assets/video/intro.mp4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Intro"),
      ),
      body: Center(
        child: MyVideoPlayer(url: videoUrl),
      ),
    );
  }
}
