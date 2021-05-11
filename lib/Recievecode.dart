import 'package:flutter/material.dart';
import 'package:uetnoticeboard/backend/Forgetcontroller.dart';
import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';
import 'package:get/get.dart';

import 'RepeatedWidgets/customtextFiled2.dart';
import 'RepeatedWidgets/submitbutton.dart';

class ConfirmPassword extends StatefulWidget {
  @override
  _ConfirmPasswordState createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
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
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Text(
                        'Enter Recieved Code',
                        style: TextStyle(
                            fontSize: size.convert(context, 25),
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
                CustomTextField2('Code', context, onChanged: (val) {
                  _forgetcontroller.password = val;
                }),
                SizedBox(height: size.convert(context, 40)),
                InkWell(
                    onTap: () {},
                    child: SubmitButton(context, 'submit', () {
                      _forgetcontroller.confirmpass();
                    }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
