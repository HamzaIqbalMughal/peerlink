import 'package:flutter/material.dart';
import 'package:peerlink/constants.dart';

class TextFormFieldPassword extends StatelessWidget {
  final String hinttext;
  final Function sendTextFieldValue;
  const TextFormFieldPassword({
    super.key,
    required this.hinttext,
    required this.sendTextFieldValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        icon: Container(
          padding: const EdgeInsets.only(top: 25),
          child: const Icon(
            Icons.password_sharp,
          ),
        ),
        errorStyle: const TextStyle(
          fontSize: 10,
        ),
        contentPadding: const EdgeInsets.only(
          // bottom: 20,
          top: 20,
        ),
        hintText: hinttext,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.3),
          fontSize: 12,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return (hinttext == hintTextEnterPassword)
              ? errorMsgEnterPass
              : errorMsgConfirmPass;
        }
        return null;
      },
      onSaved: (value) {
        // _id = int.parse(value!);
        // Fluttertoast.showToast(msg: "value : $value");
        sendTextFieldValue(value);
      },
    );
  }
}
