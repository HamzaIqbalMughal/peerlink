import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        // leading: Container(
        //   // margin: const EdgeInsets.all(10),
        //   // margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        //   alignment: Alignment.center,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child: Icon(Icons.arrow_back_ios_sharp),
        // ),
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.arrow_back_ios_sharp,
          ),
        ),
        leadingWidth: 20,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Name',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert_outlined,
              color: themeColor2,
            ),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: '1',
                child: Text('option 1'),
              ),
              PopupMenuItem(
                value: '2',
                child: Text('option 2'),
              ),
              PopupMenuItem(
                value: '2',
                child: Text('option 3'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
