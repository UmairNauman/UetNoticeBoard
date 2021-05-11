import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uetnoticeboard/RepeatedWidgets/submitbutton.dart';
import 'package:uetnoticeboard/backend/changecontroller.dart';
import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';
import 'RepeatedWidgets/customtextFiled2.dart';
import 'package:get/get.dart';

class ChangeNumber extends StatefulWidget {
  @override
  _ChangeNumberState createState() => _ChangeNumberState();
}

class _ChangeNumberState extends State<ChangeNumber> {
  String userid;
  final Numbercontroller _numbercontroller = Get.put(Numbercontroller());
  getuserid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userid = prefs.getString('user_id');
      print(userid);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getuserid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: size.convert(context, 100),
            decoration: BoxDecoration(
                color: AppColor.orangeColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                border: Border.all(color: Color(0xff707070)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6,
                      offset: Offset(4, 4),
                      color: Color(0xff000000).withOpacity(0.4))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  padding: EdgeInsets.only(right: 15),
                  icon: Icon(Icons.arrow_back, size: 34, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(
                  'Edit Profile',
                  style: TextStyle(
                      fontSize: size.convert(context, 32),
                      color: AppColor.whiteColor,
                      fontFamily: 'one'),
                ),
                Text(''),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: size.convert(context, 80),
                  ),
                  CustomTextField2('Enter new no.', context, onChanged: (val) {
                    _numbercontroller.newEmail = val;
                  }),
                  SizedBox(
                    height: size.convert(context, 30),
                  ),
                  SubmitButton(context, 'submit', () {
                    _numbercontroller.id = userid;
                    _numbercontroller.numupdate();
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
