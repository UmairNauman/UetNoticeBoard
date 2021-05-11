import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uetnoticeboard/style/size.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  double h;
  double w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        // backgroundColor: Color(0xffD38553),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [const Color(0xffD38553), const Color(0xffD4A485)],
                begin: Alignment.topCenter,
                end: Alignment(1.0, 1.0),
              )),
              child: Container(
                // height: size.convert(context, 60),
                child: ListView(
                  children: [
                    SizedBox(
                      height: size.convert(context, 0),
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Image.asset(
                        'images/logo.png',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('University Of Engineering',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: size.convert(context, 28),
                                fontFamily: 'one',
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('& Technology,',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'one',
                                fontSize: size.convert(context, 28))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(' Peshawar',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'one',
                                fontSize: size.convert(context, 28))),
                      ],
                    ),
                    SizedBox(
                      height: size.convert(context, 60),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Deparment of Computer Science & ',
                          style: TextStyle(fontFamily: 'one', fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Information Technology,University of',
                          style: TextStyle(fontFamily: 'one', fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Engineering &  Technology Peshawar',
                          style: TextStyle(fontFamily: 'one', fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }

  void login() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String email = _prefs.getString('user_email');

    Timer(Duration(seconds: 5), () {
      if (email == null) {
        Get.offNamed('/aftersplash');
      } else {
        Get.offNamed('/Mainhome');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 5000),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.forward();

    super.initState();
    login();
  }
}

// Container(
//   child: FadeTransition(
//     opacity: _animation,
//     child: Text(
//       "UET Notice Board",
//       style: TextStyle(
//           color: Colors.black,
//           fontSize: 40,
//           fontWeight: FontWeight.bold),
//     ),
//   ),
//  ),
