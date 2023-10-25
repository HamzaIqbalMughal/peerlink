import 'package:flutter/material.dart';

const String themeColor1CodeHexa = "#fff1a443";
const String themeColor2CodeHexa = "#ff2e4757";
const String appbarColorCodeHexa = "#fff7d2a0";

Color themeColor1 = Color(int.parse(themeColor1CodeHexa.replaceAll('#', '0x')));
Color themeColor2 = Color(int.parse(themeColor2CodeHexa.replaceAll('#', '0x')));
Color appbarColor = Color(int.parse(appbarColorCodeHexa.replaceAll("#", "0x")));

const String hintTextEnterId = "Enter your Id";
const String hintTextEnterPassword = "Enter your password";
const String hintTextConfirmPassword = "Confirm your password";

const String errorMessageEnterId = "Please Enter Id";
const String errorMsgEnterPass = "Please Enter Password";
const String errorMsgConfirmPass = "Confirm Your Password";

BoxShadow cardShadow = BoxShadow(color: Colors.grey.withOpacity(0.6), spreadRadius: 0.5, blurRadius: 2, offset: const Offset(0, 5));

