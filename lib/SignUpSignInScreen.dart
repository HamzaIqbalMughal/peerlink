import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class SignUpSignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpSignInScreen();
}

class _SignUpSignInScreen extends State<SignUpSignInScreen> {
  String themeColorCodeHexa = "#fff1a443";

  bool isLogIn = true;

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
    Fluttertoast.showToast(msg: "LogIn Button Clicked!");
  }

  void btnSignUpPressed() {
    // Implement SignUp Functionality here
    Fluttertoast.showToast(msg: "SignUp Button Clicked!");
  }

  void forgetPasswordPressed() {
    Fluttertoast.showToast(msg: "Forget Password is Clicked!");
  }

  @override
  Widget build(BuildContext context) {
    Color themeColor =
        Color(int.parse(themeColorCodeHexa.replaceAll('#', '0x')));
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
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            // offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
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
          // -------------------------------------------------------
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 20,
            child: TextField(
              decoration: InputDecoration(
                // filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your Id',
                hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3), fontSize: 12),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 20,
            child: TextField(
              decoration: InputDecoration(
                  // filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your Password',
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3), fontSize: 12)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 20,
            child: TextField(
              decoration: InputDecoration(
                  // filled: true,
                  fillColor: Colors.white,
                  hintText: 'Confirm your Password',
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3), fontSize: 12)),
            ),
          ),
          const SizedBox(
            height: 54,
          ),
          GestureDetector(
            onTap: () {
              btnSignUpPressed();
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  color: themeColor, borderRadius: BorderRadius.circular(25)),
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
          const SizedBox(
            height: 40,
          ),
          Container(
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
    );
  }

  Container logInCard(Color themeColor) {
    return Container(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      height: 450,
      width: MediaQuery.of(context).size.width * 0.82,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            // offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
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
// -------------------------------------------------------
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 20,
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Enter your Id',
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3), fontSize: 12)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 20,
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Enter your Password',
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3), fontSize: 12)),
            ),
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
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              btnLogInPressed();
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  color: themeColor, borderRadius: BorderRadius.circular(25)),
              child: const Center(
                child: Text(
                  'Log In',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
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
          )
        ],
      ),
    );
  }
}
