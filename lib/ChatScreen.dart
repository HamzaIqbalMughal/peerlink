import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String themeColor1CodeHexa = "#fff1a443";
  String themeColor2CodeHexa = "#ff2e4757";
  String appbarColorCodeHexa = "#fff7d2a0";
  @override
  Widget build(BuildContext context) {
    Color themeColor1 =
    Color(int.parse(themeColor1CodeHexa.replaceAll('#', '0x')));
    Color themeColor2 =
    Color(int.parse(themeColor2CodeHexa.replaceAll('#', '0x')));
    Color appbarColor =
    Color(int.parse(appbarColorCodeHexa.replaceAll("#", "0x")));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        leading: Icon(Icons.arrow_back_ios_sharp),
        title: Text('data'),
      ),
    );
  }
}
