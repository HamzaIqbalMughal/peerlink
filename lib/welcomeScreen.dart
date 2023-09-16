import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  String themeColorCodeHexa = "#fff1a443";

  @override
  Widget build(BuildContext context) {
    Color themeColor =
        Color(int.parse(themeColorCodeHexa.replaceAll('#', '0x')));
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      // ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/peerlink_logo.svg',
              height: MediaQuery.of(context).size.width * 0.65,
              width: MediaQuery.of(context).size.width * 0.65,
              // height: 200,
              // width: 200,
            ),
            Text(
              'Welcome to PeerLink',
              style: TextStyle(
                color: themeColor,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
    // throw UnimplementedError();
  }
}
