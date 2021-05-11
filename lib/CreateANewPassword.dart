import 'package:flutter/material.dart';

import 'RepeatedWidgets/customtextFiled2.dart';

import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';

import 'RepeatedWidgets/submitbutton.dart';

class CreateNewPassword extends StatefulWidget {
  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: size.convert(context, 150),
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
                      icon:
                          Icon(Icons.arrow_back, size: 34, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      'Change Password',
                      style: TextStyle(
                          fontSize: size.convert(context, 32),
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
              CustomTextField2(
                'Password',
                context,
              ),
              CustomTextField2(
                'Re-Password',
                context,
              ),
              SizedBox(height: size.convert(context, 40)),
              InkWell(
                  //TODO
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ()));
                  },
                  child: SubmitButton(context, 'verify email', () {}))
            ],
          ),
        ],
      ),
    );
  }
}
