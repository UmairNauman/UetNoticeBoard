import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import './Edit.dart';

class InviteFriends extends StatefulWidget {
  @override
  _InviteFriendsState createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  getuseremail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('user_email');
      print(email);
    });
  }

  String email;

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  double w;
  double h;
  @override
  void initState() {
    // TODO: implement initState
    getuseremail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          ClipPath(
            clipper: DrawClip(),
            child: Container(
              decoration:
                  BoxDecoration(color: AppColor.orangeColor, boxShadow: [
                BoxShadow(
                    offset: Offset(-7, 7),
                    blurRadius: 9,
                    color: AppColor.complainBoxShadow.withOpacity(1.0)),
              ]),
              alignment: Alignment.center,
              height: size.convert(context, 200),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: IconButton(
                          padding: EdgeInsets.only(right: 15),
                          icon: Icon(Icons.arrow_back,
                              size: 34, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Text(
                          "Invite Friends",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.convert(context, 35),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: size.convert(context, 30),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h / 9,
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.7,
            child: Container(
                height: size.convert(context, 180),
                width: size.convert(context, 180),
                child: Image.asset('images/logo.png')),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  '$email',
                  style: TextStyle(
                      fontSize: size.convert(context, 20),
                      fontFamily: 'one',
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Invite your friends to get UET notice',
                  style: TextStyle(fontSize: size.convert(context, 12)),
                ),
                Text(
                  'board App and easy get all information',
                  style: TextStyle(fontSize: size.convert(context, 12)),
                ),
                Text(
                  'related to University ',
                  style: TextStyle(fontSize: size.convert(context, 12)),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.convert(context, 40),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        FlutterOpenWhatsapp.sendSingleMessage(
                            "", "http://playstore/uettoiceboard");
                      },
                      child: Container(
                        height: size.convert(context, 70),
                        width: size.convert(context, 70),
                        child: Image.asset('images/Whatsapp.png'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        customLaunch(
                            'sms:?subject=UET%20Notice%20board%20link&body=http://urtnoticeboard');
                      },
                      child: Container(
                        height: size.convert(context, 70),
                        width: size.convert(context, 70),
                        child: Image.asset('images/message.png'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        customLaunch(
                            'mailto:?subject=UET%20Notice%20board%20link&body=http://urtnoticeboard');
                      },
                      child: Container(
                        height: size.convert(context, 70),
                        width: size.convert(context, 70),
                        child: Image.asset('images/email.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
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
    var firstControlPoint = Offset(45, size.height / 1.8);
    var firstEndPoint = Offset(size.width / 2, size.height / 1.8);
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
