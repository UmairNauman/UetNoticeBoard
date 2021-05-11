import 'package:flutter/material.dart';
import 'package:uetnoticeboard/backend/logincontroller.dart';
import 'package:get/get.dart';

final LoginController _loginController = Get.put(LoginController());
CustomTextField(
  String name, [
  String hinttext,
  IconButton suffix,
  bool obsecure = false,
  Function onChanged,
]) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: TextFormField(
          onChanged: onChanged,
          obscureText: obsecure,
          decoration: InputDecoration(
            enabledBorder: new UnderlineInputBorder(
                borderSide: new BorderSide(width: 1, color: Colors.black)),
            suffix: suffix,
            hintText: hinttext,

            hintStyle: TextStyle(color: Colors.grey[400]),

            //prefixIcon: Icon(Icons.lock, color: Colors.grey),
          ),
        ),
      ),
    ],
  );
}
