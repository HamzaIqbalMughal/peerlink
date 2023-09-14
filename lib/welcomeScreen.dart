import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              'assets/icons/cake.svg',
              height: 200,
              width: 200,
            ),
            Text(
              'Peerlink',
              style: TextStyle(
                color: Colors.red,
              ),
            )
            // Container(
            //   // height: MediaQuery.of(context).size.width * 0.9,
            //   // width: MediaQuery.of(context).size.width * 0.9,
            //   decoration: BoxDecoration(
            //     color: Colors.amber.withOpacity(0.2),
            //   ),
            //   child: SvgPicture.asset(
            //     'assets/icons/logo.svg',
            //     height: 200,
            //     width: 200,
            //   ),
            // ),
          ],
        ),
      ),
    );
    // throw UnimplementedError();
  }
}
