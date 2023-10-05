import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peerlink/SignUpSignInScreen.dart';
import 'constants.dart';

class SignUpCard extends StatefulWidget {
  // const SignUpCard({super.key});
  // Function toggleCard;
  SignUpSignInScreenState signUpSignInScreenInstance;

  // SignUpSignInScreen signUpSignInScreenInstance;
  SignUpCard({
    Key? key,
    required this.signUpSignInScreenInstance,
  }) : super(key: key);

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  // late final Function toggleCard = widget.toggleCard;
  // SignUpSignInScreenState signUpSignInScreenInstance = widget.signUpSignInScreenInstance;
  final _signUpFormKey = GlobalKey<FormState>();

  late SignUpSignInScreenState signUpSignInScreenStateInstance;

  @override
  void initState() {
    super.initState();
    signUpSignInScreenStateInstance = widget.signUpSignInScreenInstance;
  }

  @override
  Widget build(BuildContext context) {
    // return
    return Container(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        top: 20,
        bottom: 20,
      ),
      height: 450,
      width: MediaQuery.of(context).size.width * 0.82,
      // width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: _signUpFormKey,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.center,
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
                    border: Border.all(color: themeColor1),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          // toggleBetweenSignInAndSignUp();
                          // toggleCard();
                          signUpSignInScreenStateInstance
                              .toggleBetweenSignInAndSignUp();
                        },
                        child: Container(
                          // height: 30,
                          // width: 110,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: themeColor1,
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
                          Fluttertoast.showToast(msg: "Already on SignUp");
                        },
                        child: Container(
                          // height: 30,
                          // width: 110,
                          decoration: BoxDecoration(
                              color: themeColor1,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
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
                      // _id = int.parse(value!);
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.red,
                      icon: Container(
                        padding: EdgeInsets.only(top: 25),
                        child: Icon(
                          Icons.password_sharp,
                        ),
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
                      // _id = int.parse(value!);
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.red,
                      icon: Container(
                        padding: EdgeInsets.only(top: 25),
                        child: Icon(
                          Icons.password_sharp,
                        ),
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
                      hintText: 'Confirm your password',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 12,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password';
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text('Please Enter your Id')),
                        // );
                      }
                      return null;
                    },
                    onSaved: (value) {
                      // _id = int.parse(value!);
                    },
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
                  if (_signUpFormKey.currentState!.validate()) {
                    // _signUpFormKey.currentState!.save();
                    // btnSignUpPressed();
                  }
                  // btnSignUpPressed();
                },
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                      color: themeColor1,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 380,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account? ",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  GestureDetector(
                    onTap: () {
                      // toggleCard();
                      signUpSignInScreenStateInstance
                          .toggleBetweenSignInAndSignUp();
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
