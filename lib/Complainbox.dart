import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uetnoticeboard/RepeatedWidgets/submitbutton.dart';
import 'package:uetnoticeboard/backend/changecontroller.dart';

import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';

class ComplainBox extends StatefulWidget {
  @override
  _ComplainBoxState createState() => _ComplainBoxState();
}

class _ComplainBoxState extends State<ComplainBox> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController messagecontroller = TextEditingController();
  final Complaintcontroller _complaintcontroller =
      Get.put(Complaintcontroller());
  double h;
  double w;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
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
                            "Complain Box",
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
                  child: Text(
                    'Complain :',
                    style: TextStyle(
                        fontSize: size.convert(context, 25),
                        fontFamily: 'one',
                        fontWeight: FontWeight.w600,
                        color: Color(0xff5E5E5E)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.whiteColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 6,
                              offset: Offset(4, 4),
                              color: Color(0xff000000).withOpacity(0.2))
                        ]),
                    height: size.convert(context, 40),
                    width: size.convert(context, 367),
                    child: TextFormField(
                      validator: (val) {},
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        border: InputBorder.none,
                        hintText: "Enter your name",
                      ),
                      controller: namecontroller,
                      onChanged: (val) {
                        _complaintcontroller.name = val;
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.convert(context, 10),
                  ),
                  Container(
                    height: size.convert(context, 163),
                    width: size.convert(context, 367),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.whiteColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 6,
                              offset: Offset(4, 4),
                              color: Color(0xff000000).withOpacity(0.2))
                        ]),
                    child: TextFormField(
                      validator: (val) {},
                      controller: messagecontroller,
                      maxLines: 16,
                      onChanged: (val) {
                        _complaintcontroller.message = val;
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        border: InputBorder.none,
                        hintText: "Enter your complain",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.convert(context, 40),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: SubmitButton(context, 'Submit', () {
                if (_formKey.currentState.validate()) {
                  namecontroller.clear();
                  messagecontroller.clear();
                  _complaintcontroller.complaint1();
                }
              }),
            )
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
