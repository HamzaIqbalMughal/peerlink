import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:peerlink/HomeScreen.dart';

class SignUpSignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpSignInScreen();
}

class _SignUpSignInScreen extends State<SignUpSignInScreen> {
  String themeColorCodeHexa = "#fff1a443";

  bool isLogIn = true;
  late int _id;
  final _signUpFormKey = GlobalKey<FormState>();
  final _logInFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  void toggleBetweenSignInAndSignUp() {
    setState(() {
      isLogIn = !isLogIn;
    });
  }

  void btnLogInPressed() {
    // Implement LogIn Functionality here
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=> HomeScreen(),
        )
    );
    // Fluttertoast.showToast(msg: "LogIn Button Clicked!");
  }

  void btnSignUpPressed() {
    // Implement SignUp Functionality here
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=> HomeScreen(),
        )
    );
    // Fluttertoast.showToast(msg: "SignUp Button Clicked!");
  }

  void forgetPasswordPressed() {
    Fluttertoast.showToast(msg: "Forget Password is Clicked!");
  }

  @override
  Widget build(BuildContext context) {
    Color themeColor = Color(
      int.parse(themeColorCodeHexa.replaceAll('#', '0x')),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                // height: 350,
                height: MediaQuery.of(context).size.height * 0.45,
                // width: MediaQuery.of(context).size.width * 1,
                padding: const EdgeInsets.only(bottom: 120, top: 45),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background1.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(
                    // bottomLeft: Radius.elliptical(200, 160),
                    // bottomRight: Radius.elliptical(200, 160),
                    bottomLeft: Radius.circular(165),
                    bottomRight: Radius.circular(165),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color(0xFFDEE06A), // Use the color code provided
                      Color.fromRGBO(
                          144, 106, 224, 0), // Use the color code provided
                    ],
                    stops: [0.1505, 0.9368],
                    transform: GradientRotation(142.03),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/icons/peerlink_logo.svg',
                        height: MediaQuery.of(context).size.height * 0.14,
                      ),
                    ),
                    const Text(
                      'PeerLink',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 32,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 250,
              right: 0,
              left: 0,
              // bottom: 200,
              child: isLogIn ? logInCard(themeColor) : signUpCard(themeColor),
            ),
          ],
        ),
      ),
    );
  }

  Container signUpCard(Color themeColor) {
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
                    border: Border.all(
                      color: themeColor,
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
                          toggleBetweenSignInAndSignUp();
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
                                color: themeColor,
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
                              color: themeColor,
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
                      prefixIcon: Icon(Icons.person),
                      prefixIconConstraints: const BoxConstraints(
                        // minHeight: 0,
                        maxHeight: 8,
                      ),
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
                      prefixIcon: Icon(
                        Icons.password_sharp,
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        // minHeight: 0,
                        maxHeight: 8,
                      ),
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
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.red,
                      prefixIcon: Icon(
                        Icons.password_sharp,
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        // minHeight: 0,
                        maxHeight: 8,
                      ),
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
                      _id = int.parse(value!);
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
                    // _formKey.currentState!.save();
                    btnSignUpPressed();
                  }
                  // btnSignUpPressed();
                },
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                      color: themeColor,
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
                      toggleBetweenSignInAndSignUp();
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

  Container logInCard(Color themeColor) {
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
            offset: Offset(0, 5),
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
                      color: themeColor,
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
                              color: themeColor,
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
                          toggleBetweenSignInAndSignUp();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: themeColor,
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
                      prefixIcon: Icon(Icons.person),
                      prefixIconConstraints: const BoxConstraints(
                        // minHeight: 0,
                        maxHeight: 8,
                      ),
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
                      prefixIcon: Icon(
                        Icons.password_sharp,
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        // minHeight: 0,
                        maxHeight: 8,
                      ),
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
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          forgetPasswordPressed();
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
                    // _formKey.currentState!.save();
                    btnLogInPressed();
                  }
                  // btnLogInPressed();
                },
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
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
                        toggleBetweenSignInAndSignUp();
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
