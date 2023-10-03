import 'package:flutter/material.dart';
import 'package:peerlink/ChatScreen.dart';
import 'package:peerlink/SignUpSignInScreen.dart';
import 'package:peerlink/Stack-with-Scroll-practice.dart';
import 'package:peerlink/WelcomeScreen.dart';
import 'package:peerlink/HomeScreen.dart';

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
      // home: HomeScreen(),
      // home: ChatScreen(),

      initialRoute: WelcomeScreen.screen_id,
      routes: {
        WelcomeScreen.screen_id : (context) => WelcomeScreen(),
        SignUpSignInScreen.screen_id : (context) => SignUpSignInScreen(),
        HomeScreen.screen_id : (context) => HomeScreen(),
        ChatScreen.screen_id : (context) => ChatScreen(),
      },
    );

  }
}
