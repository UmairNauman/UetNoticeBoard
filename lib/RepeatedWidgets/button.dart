import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';

Widget customButton({context, String text, Function onTap}) {
  return InkWell(
    onTap: onTap,
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
      width: size.convertWidth(context, 250),
      height: size.convert(context, 52),
      child: Center(
        child: Text('$text',
            style: TextStyle(
                fontSize: size.convert(context, 25),
                fontWeight: FontWeight.w500,
                fontFamily: 'one',
                color: Colors.white)),
      ),
    ),
  );
}
