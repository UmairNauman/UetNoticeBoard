import 'package:flutter/material.dart';

import 'package:uetnoticeboard/RepeatedWidgets/textfield.dart';
import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';
import './backend/logincontroller.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  double w;
  double h;
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Opacity(
              opacity: 0.1,
              child: Container(
                  alignment: Alignment.center,
                  child: Image.asset('images/logo.png')),
            ),
            ListView(
              children: [
                ClipPath(
                  clipper: DrawClip(),
                  child: Container(
                    alignment: Alignment.center,
                    height: h / 2.5,
                    width: double.infinity,
                    color: AppColor.orangeColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.convert(context, 35),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Log in to your Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.convert(context, 15),
                          ),
                        ),
                        SizedBox(
                          height: h / 9,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.convert(context, 10)),
                CustomTextField("Email", "johndoe@gmail.com", null, false,
                    (value) {
                  _loginController.email = value;
                }),
                SizedBox(
                  height: h / 80,
                ),
                CustomTextField(
                  "Password",
                  "••••••••••",
                  IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility),
                  ),
                  hidePassword,
                  (value) {
                    _loginController.password = value;
                  },
                ),
                SizedBox(
                  height: size.convert(context, 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25, top: 13),
                      child: InkWell(
                        onTap: () {
                          Get.offNamed('/forgetView');
                        },
                        child: Text(
                          'Forget Password ?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.convert(context, 30)),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: InkWell(
                    onTap: () {
                      print('object');
                      _loginController.apiLogin();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          color: AppColor.orangeColor,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 6,
                                offset: Offset(4, 4),
                                color: Color(0xff000000).withOpacity(0.4)),
                          ]),
                      width: 100,
                      height: size.convert(context, 50),
                      child: Center(
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: size.convert(context, 25),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'one',
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;

  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = Offset(45, size.height / 1.4);
    var firstEndPoint = Offset(size.width / 2, size.height / 1.4);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width + (55), size.height - 75);
    var secondEndPoint = Offset(size.width, size.height / 1);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
