import 'package:flutter/material.dart';
import 'package:peerlink/SignUpSignInScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants.dart';
import 'index.dart';

class LogInCard extends StatefulWidget {
  // const SignInCard({super.key});

  SignUpSignInScreenState signUpSignInScreenInstance;

  LogInCard({
    Key? key,
    required this.signUpSignInScreenInstance,
  }) : super(key: key);

  @override
  State<LogInCard> createState() => _LogInCardState();
}

class _LogInCardState extends State<LogInCard> {
  late SignUpSignInScreenState signUpSignInScreenStateInstance;

  @override
  void initState() {
    super.initState();
    signUpSignInScreenStateInstance = widget.signUpSignInScreenInstance;
  }

  final _logInFormKey = GlobalKey<FormState>();
  String id = '';
  String password = '';

  void getIdValueFromTextField(String id) {
    this.id = id;
  }

  void getPasswordValueFromTextField(String password) {
    this.password = password;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        top: 20,
        bottom: 20,
      ),
      height: 450,
      width: MediaQuery.of(context).size.width * 0.82,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: _logInFormKey,
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: double.infinity,
              // color: Colors.pink.shade100,
              width: double.infinity,
            ),
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: themeColor1,
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(msg: "Already on LogIn");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: themeColor1,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          signUpSignInScreenStateInstance
                              .toggleBetweenSignInAndSignUp();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: themeColor1,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // -------------------------------------------------------
            Positioned(
              top: 90,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  TextFormFieldId(
                      hinttext: hintTextEnterId,
                      sendTextFieldValue: getIdValueFromTextField),
                  TextFormFieldPassword(
                      hinttext: hintTextEnterPassword,
                      sendTextFieldValue: getPasswordValueFromTextField),

                  /*
                  TextFormField(
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.red,
                      icon: Container(
                        padding: EdgeInsets.only(top: 25),
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                      // prefixIcon: Icon(Icons.person),
                      // prefixIconConstraints: const BoxConstraints(
                      //   // minHeight: 0,
                      //   maxHeight: 8,
                      // ),
                      errorStyle: TextStyle(
                        fontSize: 10,
                      ),
                      contentPadding: EdgeInsets.only(
                        // bottom: 20,
                        top: 20,
                      ),
                      hintText: 'Enter your Id',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 12,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Id';
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text('Please Enter your Id')),
                        // );
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _id = int.parse(value!);
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.red,
                      icon: Container(
                        padding: EdgeInsets.only(top: 25),
                        child: Icon(Icons.password_sharp),
                      ),
                      // prefixIcon: Icon(
                      //   Icons.password_sharp,
                      // ),
                      // prefixIconConstraints: const BoxConstraints(
                      //   // minHeight: 0,
                      //   maxHeight: 8,
                      // ),
                      errorStyle: TextStyle(
                        fontSize: 10,
                      ),
                      contentPadding: EdgeInsets.only(
                        // bottom: 20,
                        top: 20,
                      ),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 12,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password';
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text('Please Enter your Id')),
                        // );
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _id = int.parse(value!);
                    },
                  ),
                  */

                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          signUpSignInScreenStateInstance
                              .forgetPasswordPressed();
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 310,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  if (_logInFormKey.currentState!.validate()) {
                    _logInFormKey.currentState!.save();
                    signUpSignInScreenStateInstance.logIn(id, password);
                  }
                  // btnLogInPressed();
                },
                child: MyButton(title: "Log In", btnColor: themeColor1),
              ),
            ),

            Positioned(
              top: 380,
              left: 0,
              right: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: () {
                        signUpSignInScreenStateInstance
                            .toggleBetweenSignInAndSignUp();
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
