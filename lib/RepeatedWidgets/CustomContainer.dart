import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';

double w;
double h;
CustomContainer(String text, context, _fontsize) {
  h = MediaQuery.of(context).size.width;
  w = MediaQuery.of(context).size.width;
  return Padding(
      padding: EdgeInsets.only(left: 18.0, right: 18.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: _fontsize, // fontWeight: FontWeight.w500
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: size.convert(context, 18.5),
              color: AppColor.orangeColor,
            )
          ],
        ),
//    width: size.convert(context, 370.35),
        height: size.convert(context, 25.35),
        width: w / 1,

        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[400])),
        ),
      ));
}

Listofcontainer(
  String text, {
  context,
  String name,
  @required String imageName,
  Function onTap,
  String name2,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: size.convert(context, 90),
      width: size.convertWidth(context, 390),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("$imageName"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
              Flexible(
                child: Text(
                  name2,
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(
                top: 65,
              ),
              child: Text(text, style: TextStyle(color: AppColor.orangeColor))),
        ],
      ),
    ),
  );
}
