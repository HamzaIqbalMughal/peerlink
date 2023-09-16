import 'package:flutter/material.dart';
import 'package:peerlink/SignUpSignInScreen.dart';
import 'package:peerlink/temp.dart';
import 'package:peerlink/welcomeScreen.dart';

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
      theme: ThemeData(fontFamily: 'Itim'),
      // home: SignUpSignInScreen(),
      // home: TempScreen(),
      home: WelcomeScreen(),
    );
  }
}
