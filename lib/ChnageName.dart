import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:uetnoticeboard/RepeatedWidgets/customtextFiled2.dart';
import 'package:uetnoticeboard/backend/changecontroller.dart';

import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';
import 'package:get/get.dart';

class ChangeName extends StatefulWidget {
  @override
  _ChangeNameState createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  String userid;
  final Namecontroller _namecontroller = Get.put(Namecontroller());
  getuserid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userid = prefs.getString('user_id');
      print(userid);
      _namecontroller.id = userid;
    });
  }

  double h;
  double w;
  @override
  void initState() {
    // TODO: implement initState
    getuserid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Column(
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
                        icon: Icon(Icons.arrow_back,
                            size: 34, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontSize: size.convert(context, 26),
                            color: AppColor.whiteColor,
                            fontFamily: 'one'),
                      ),
                      Text(''),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.convert(context, 80),
                ),
                CustomTextField2('Change Name', context, onChanged: (val) {
                  _namecontroller.newEmail = val;
                }),
                // CustomTextField2(
                //   'Password',
                //   context,
                // ),
                SizedBox(
                  height: size.convert(context, 50),
                ),
                InkWell(
                  onTap: () {
                    _namecontroller.nameupdate();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
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
                      width: size.convertWidth(context, 150),
                      height: size.convert(context, 56),
                      child: Center(
                        child: Text('Submit',
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
          ),
        ],
      ),
    );
  }
}
