import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:peerlink/HomeScreen.dart';
import 'package:peerlink/components/LogInCard.dart';
import 'package:peerlink/components/SignUpCard.dart';
import 'constants.dart';

class SignUpSignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUpSignInScreenState();

  static const String screen_id = 'SignUpSignInScreen';
}

class SignUpSignInScreenState extends State<SignUpSignInScreen> {
  // String themeColorCodeHexa = "#fff1a443";

  bool isLogIn = true;
  late int _id;
  final _signUpFormKey = GlobalKey<FormState>();
  final _logInFormKey = GlobalKey<FormState>();
  // FocusNode _idTextFieldFocus = FocusNode();
  // FocusNode _passwordTextFieldFocus = FocusNode();

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

  void logIn(String id, String password) {
    Fluttertoast.showToast(
        msg: "On LogIn card - Id : $id ** password: $password");
    Navigator.pushNamed(context, HomeScreen.screen_id);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context)=> HomeScreen(),
    //     )
    // );
  }

  void signUp(String id, String password) {
    // Implement SignUp Functionality here
    Fluttertoast.showToast(msg: "Id : $id ** password: $password");
    Navigator.pushNamed(context, HomeScreen.screen_id);
  }

  void forgetPasswordPressed() {
    Fluttertoast.showToast(msg: "Forget Password is Clicked!");
  }

  @override
  Widget build(BuildContext context) {
    Function toggleCards = toggleBetweenSignInAndSignUp;
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
              // child: isLogIn ? logInCard(themeColor) : signUpCard(themeColor),

              child: isLogIn
                  ? LogInCard(signUpSignInScreenInstance: this)
                  : SignUpCard(signUpSignInScreenInstance: this),
            ),
          ],
        ),
      ),
    );
  }
}
