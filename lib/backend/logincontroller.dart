import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './request.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  String email;
  String password;

  setdata(String id, String name, String profilepic, String email) async {
    print(profilepic);
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('user_id', id);
    _prefs.setString('user_name', name);
    _prefs.setString(
        'user_profilepic',
        "https://uetnoticeboard.000webhostapp.com/fileStorage/profileimage/" +
            profilepic);
    _prefs.setString('user_email', email);
  }

  void apiLogin() async {
    Get.dialog(
        Center(
            child: CupertinoActivityIndicator(
          radius: 30,
        )),
        barrierDismissible: false);

    Request request = Request(body: {
      'email': email,
      'password': password,
      'token':
          "AAAAlmDysA8:APA91bE2dn9JIhNPvKW8-uQ9YLWpDF3n9Pk3Rp2cCweekPShbDzKnbjcyJsCibHug-ov3gtVaonrL6fMRC8HFetwmONrgr2NZJ4jlVHboJNDrU8ragVYCJsAf5HO6DJsjkaOO5DlXFye "
    });
    request.login().then((value) {
      var response = jsonDecode(value.body);
      if (response['success'] == "true") {
        print("true");
        print(response['detail'][0]['id']);
        print(response['detail'][0]['name']);
        setdata(response['detail'][0]['id'], response['detail'][0]['name'],
            response['detail'][0]['image'], response['detail'][0]['email']);
        Get.back();
        Get.offNamed('/Mainhome');
      } else {
        print("false");

        Get.snackbar("Error", "Email does not exist");
      }
      print(value.body);
    }).catchError((onError) {});
  }
}
