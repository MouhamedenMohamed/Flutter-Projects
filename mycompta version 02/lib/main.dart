import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycompta/ui/widgets/ForgetPassword.dart';
import 'package:mycompta/ui/widgets/shared.dart';
import 'ui/signin.dart';
import 'ui/signup.dart';
import 'ui/splashscreen.dart';
import 'constants/constants.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      theme: ThemeData(primaryColor: color1),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) =>  SplashScreen(),
        SIGN_IN: (BuildContext context) =>  SignInPage(),
        SIGN_UP: (BuildContext context) =>  SignUpScreen(),
       'recover': (BuildContext context) =>RecoverYourPassword(),
       'home': (BuildContext context) =>SignInScren()
      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}



