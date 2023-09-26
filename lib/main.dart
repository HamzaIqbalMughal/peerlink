import 'package:flutter/material.dart';
import 'package:peerlink/SignUpSignInScreen.dart';
import 'package:peerlink/Stack-with-Scroll-practice.dart';
import 'package:peerlink/WelcomeScreen.dart';
import 'package:peerlink/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(fontFamily: 'Itim', useMaterial3: true),
      // home: WelcomeScreen(),
      // home: homeScreen(),
      home: HomeScreen(),
    );
  }
}
