import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_print_app/router.dart';
import 'package:news_print_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'NEWS PRINT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      onGenerateRoute: (settings) => generateRoute(settings),
      //First screen appear is Splash Screen
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
