import 'package:flutter/material.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:news_print_app/features/onboarding/widgets/page1.dart';
import 'package:news_print_app/features/onboarding/widgets/page2.dart';
import 'package:news_print_app/features/onboarding/widgets/page3.dart';
import 'package:video_player/video_player.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late VideoPlayerController _controller;
  int pages = 0;
  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/onboarding_video.mp4');
    _controller.addListener(() {
      if (_controller.value.isPlaying) {
        setState(() {
          pages = 1;
        });
      } else if (!_controller.value.isPlaying &&
          (_controller.value.duration == _controller.value.position)) {
        //checking the duration and position every time
        //Video Completed//
        setState(() {
          pages = 2;
        });
      }
    });
    _controller.initialize();

    OnboardingPage1.controller = _controller;
  }

  List<Widget> listOfPages = [
    const OnboardingPage1(),
    const OnboardingPage2(),
    const OnboardingPage3(),
  ];

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
            // video container
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 360,
                width: double.infinity,
                child: VideoPlayer(_controller),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              flex: 1,
              child: listOfPages[pages],
            ),
          ],
        ),
      ),
    );
  }
}
