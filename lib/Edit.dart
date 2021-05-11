import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uetnoticeboard/ChangeNumber.dart';
import 'package:uetnoticeboard/RepeatedWidgets/CustomContainer.dart';
import 'package:uetnoticeboard/backend/changecontroller.dart';
import 'package:uetnoticeboard/style/colors.dart';
import './style/size.dart';

import 'ChangeEmail.dart';
import 'ChangeNumber.dart';
import 'ChangePassword.dart';
import 'ChnageName.dart';
import './Globals.dart' as globals;

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final Profilecontroller _profilecontroller = Get.put(Profilecontroller());
  String idno;
  getusername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      globals.name = prefs.getString('user_name');
      print(name);
    });
  }

  getuserid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idno = prefs.getString('user_id');
      print(idno);
    });
  }

  getuserPicture() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      print("kkkkkkkk");
      profilePicture = prefs.getString('user_profilepic');
      print(profilePicture);
    });
  }

  // File _image;
  String name;

  String profilePicture;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _profilecontroller.newEmail = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  double h;
  double w;
  @override
  void initState() {
    getusername();
    getuserid();
    getuserPicture();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
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
                          "Edit Profile",
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    Container(
                        width: size.convert(context, 120),
                        height: size.convert(context, 120),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.orangeColor),
                            // color: Colors.red,
                            shape: BoxShape.circle),
                        child: _profilecontroller.newEmail != null
                            ? CircleAvatar(
                                backgroundImage:
                                    FileImage(_profilecontroller.newEmail),
                              )
                            : CircleAvatar(
                                backgroundImage: NetworkImage(profilePicture),
                              )),
                    IconButton(
                        icon: Icon(
                          Icons.add_a_photo,
                          color: AppColor.orangeColor,
                          size: 20,
                        ),
                        onPressed: () {
                          _profilecontroller.id = idno;
                          getImage().then(
                              (value) => _profilecontroller.profileupdate());
                        })
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _profilecontroller.profileupdate();
                      },
                      child: Text(
                        "${globals.name}",
                        style: TextStyle(
                          fontSize: size.convert(context, 18),
                          fontFamily: 'one',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      height: h / 100,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 4, right: 5),
                          width: size.convert(context, 20.35),
                          height: size.convert(context, 1.35),
                          color: Colors.grey[400],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: size.convert(context, 20.35),
                          height: size.convert(context, 1.35),
                          color: Colors.grey[400],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: size.convert(context, 15.35),
                          height: size.convert(context, 1.35),
                          color: Colors.grey[400],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: size.convert(context, 15.35),
                          height: size.convert(context, 1.35),
                          color: Colors.grey[400],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: size.convert(context, 15.35),
                          height: size.convert(context, 1.35),
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.convert(context, 50),
          ),
          Container(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    //Get.offNamed('/ChangeName');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChangeName()));
                  },
                  child: CustomContainer(
                      'Change Name', context, size.convert(context, 16)),
                ),
                SizedBox(
                  height: size.convert(context, 35),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePassword()));
                  },
                  child: CustomContainer(
                      'Change Password', context, size.convert(context, 16)),
                ),
                SizedBox(
                  height: size.convert(context, 35),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChangeEmail()));
                  },
                  child: CustomContainer(
                      'Change Email', context, size.convert(context, 16)),
                ),
                SizedBox(
                  height: size.convert(context, 35),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeNumber()));
                  },
                  child: CustomContainer(
                      'Change Number', context, size.convert(context, 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
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
