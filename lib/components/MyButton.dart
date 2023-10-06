import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final String title;
  final Color btnColor;
  const MyButton({Key? key, required this.title, required this.btnColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}