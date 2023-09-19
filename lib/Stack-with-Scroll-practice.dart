import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StackWithScrollPractice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StackWithScrollPractice();
}

class _StackWithScrollPractice extends State<StackWithScrollPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // body: Container(
      //   // width: double.infinity,
      //   decoration: BoxDecoration(
      //     color: Colors.amber.shade200,
      //   ),
      // margin: EdgeInsets.only(top: 100),
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              // height: 600,
              height: MediaQuery.of(context).size.height * 1,
              color: Colors.yellow,
              child: const Center(
                child: Text(
                  'Overlay Content 1',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                // width: MediaQuery.of(context).size.width * 1,
                height: 200,
                width: 200,
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 300,
              right: 0,
              child: Container(
                // width: MediaQuery.of(context).size.width,
                width: 200,
                height: 200,
                color: Colors.green,
              ),
            ),
            Positioned(
              top: 600,
              // left: 0,
              right: 0,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 1,
                child: TextField(
                  decoration: InputDecoration(
                      // filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your Password',
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3), fontSize: 12)),
                ),
              ),
            ),
            Positioned(
              top: 300,
              right: 0,
              child: Container(
                // width: MediaQuery.of(context).size.width,
                width: 200,
                height: 200,
                color: Colors.green,
              ),
            ),
            Container(
              color: Colors.blue,
              height: 100,
              width: 100,
            ),
            Container(
              color: Colors.purple,
              height: 50,
              width: 50,
            ),
            Positioned(
              top: 600,
              left: 0,
              child: Container(
                // width: MediaQuery.of(context).size.width,
                width: 200,
                height: 200,
                color: Colors.green,
              ),
            ),
            Positioned(
              top: 900,
              right: 0,
              child: Container(
                // width: MediaQuery.of(context).size.width,
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
