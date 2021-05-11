import 'dart:ui';

import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';

import 'package:flutter/material.dart';

Widget SubmitButton(
  context,
  String text,
  Function ontap,
) {
  return InkWell(
    onTap: ontap,
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
      width: size.convertWidth(context, 220),
      height: size.convert(context, 56),
      child: Center(
        child: Text(text,
            style: TextStyle(
                fontSize: size.convert(context, 25),
                fontWeight: FontWeight.w500,
                fontFamily: 'one',
                color: Colors.white)),
      ),
    ),
  );
}
