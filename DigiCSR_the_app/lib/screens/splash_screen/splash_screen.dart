import 'package:digicsr/constants/constants.dart';
import 'package:digicsr/screens/Homescreen/drawer.dart';
import 'package:digicsr/screens/login/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changeScreen() {
    Future.delayed(Duration(seconds: 70), () {
      // Get.to(()=>ButtonToLoginAs());
      Navigator.pushNamed(context, '/auth');
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Material(
        //backgroundColor:  Color.fromRGBO(38, 191, 104, 1),
        // backgroundColor: Color.fromARGB(255, 160, 229, 162),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [primary, white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Center(
              child: AnimatedSplashScreen(
              // backgroundColor: ,
              nextScreen: Login_Screen(),
              splash: Card(
          elevation: 60,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          child: Image.asset(
            'assets/app_icon/digicsr_app_icon.png',
            height: w * 0.25,
            width: w * 0.25,
            fit: BoxFit.contain,
          ),
              ),
              // splashIconSize: 120,
              backgroundColor: white, //blue
              // backgroundColor: Color(0xFFE1E8ED),  //greyish white
              // backgroundColor: Color(0xFFAAB8C2), //grey
        
              animationDuration: Duration(milliseconds: 1300),
              splashTransition: SplashTransition.scaleTransition,
              pageTransitionType: PageTransitionType.leftToRight,
              duration: 2500,
            )),
        ));
  }
}
