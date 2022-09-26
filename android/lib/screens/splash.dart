import 'package:dsmp/main.dart';
import 'package:dsmp/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class asplash extends StatefulWidget {
  @override
  State<asplash> createState() => _asplashState();
}

class _asplashState extends State<asplash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(splash: "images/m1.png", screenFunction:() async{
      return auth.currentUser== null ? const MyApp() : home();
    },
      splashTransition: SplashTransition.fadeTransition,
      duration: 500 ,
      splashIconSize: 250.0,
    );
  }
}
