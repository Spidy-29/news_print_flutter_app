import 'package:flutter/material.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:video_player/video_player.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.bgColor,
        body: Column(
          children: <Widget>[
            // video
            Container(
              height: 440,
              color: GlobalVariables.secondaryColor,
              alignment: Alignment.bottomCenter,
              child: VideoPlayer(_controller),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: const Text(
                "A wise man once stated, \"In earlier times, reading the news was great.\"",
                style: TextStyle(
                  color: GlobalVariables.textColor,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: const Text(
                "Which completely made us to rethink the news reading experience.",
                style: TextStyle(
                  color: GlobalVariables.textColor,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('button press');
                _controller.play();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalVariables.primaryColor),
              child: const Text("Text Me"),
            ),
          ],
        ),
      ),
    );
  }
}
