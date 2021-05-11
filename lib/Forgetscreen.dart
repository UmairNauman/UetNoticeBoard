import 'package:flutter/material.dart';
import 'package:uetnoticeboard/RepeatedWidgets/customtextFiled2.dart';
import 'package:uetnoticeboard/RepeatedWidgets/submitbutton.dart';
import 'package:uetnoticeboard/backend/Forgetcontroller.dart';

import 'package:get/get.dart';
import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';

import 'Login.dart';
import 'RepeatedWidgets/customtextFiled2.dart';

class ForgetScreen extends StatelessWidget {
  final Forgetcontroller _forgetcontroller = Get.put(Forgetcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: size.convert(context, 110),
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
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login())),
                      ),
                      Text(
                        'Forgot Password',
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
                  height: size.convert(context, 70),
                ),
                Container(
                  child: SingleChildScrollView(
                    child: CustomTextField2('Email', context, onChanged: (val) {
                      _forgetcontroller.email = val;
                    }),
                  ),
                ),
                SizedBox(height: size.convert(context, 40)),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: InkWell(
                      onTap: () {},
                      child: SubmitButton(context, 'verify email', () {
                        _forgetcontroller.recoverpass();
                      })),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
