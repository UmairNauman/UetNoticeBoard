import 'package:flutter/material.dart';
import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';

CustomTextField2(
  String name,
  context, {
  String hinttext,
  Icon suffix,
  bool obsecure,
  Function onChanged,
}) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
            child: Text(
              name,
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
        child: Container(
          height: size.convert(context, 63),
          width: size.convertWidth(context, 367),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.whiteColor,
              boxShadow: [
                BoxShadow(
                    blurRadius: 6,
                    offset: Offset(4, 4),
                    color: Color(0xff000000).withOpacity(0.2))
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 13),
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
