import 'package:flutter/material.dart';
import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';
import 'package:get/get.dart';

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  double h;
  double w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: h,
          width: w,
          child: Image.asset(
            'images/uet.png',
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: ListView(
            children: [
              SizedBox(
                height: h / 4,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'The Online UET',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Student Facilitation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'System',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: h / 40,
                  ),
                  Text('Department of Computer science & information',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      )),
                  Text('Technology University of Engineering &',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      )),
                  Text('Technology, Peshawar',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      )),
                  SizedBox(
                    height: h / 3.5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed('/loginView');
                    },
                    child: Container(
                        height: size.convert(context, 50),
                        width: w / 1.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 6,
                                  offset: Offset(4, 4),
                                  color: Colors.orange.withOpacity(0.4)),
                            ]),
                        child: Center(
                            child: Text(
                          'Log in',
                          style: TextStyle(
                              color: AppColor.orangeColor,
                              fontFamily: 'one',
                              fontWeight: FontWeight.w600,
                              fontSize: size.convert(context, 23)),
                        ))),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
