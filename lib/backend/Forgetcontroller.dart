import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:uetnoticeboard/backend/url.dart';
import './request.dart';
import 'package:get/get.dart';

class Forgetcontroller extends GetxController {
  String email;
  String password;
  void recoverpass() async {
    Get.dialog(
        Center(
            child: CupertinoActivityIndicator(
          radius: 30,
        )),
        barrierDismissible: false);

    Request request = Request(url: urlbase + urlrecover, body: {
      'email': email,
    });
    request.recover().then((value) {
      print(value.body);
      var response = jsonDecode(value.body);
      if (response['Success'] == "true") {
        print("true");
        Get.back();
        Get.offNamed('/recievecode');
      } else {
        print("false");
        Get.back();
        Get.snackbar("Error", "Email does not exist");
      }
    }).catchError((onError) {});
  }

  void confirmpass() async {
    Get.dialog(
        Center(
            child: CupertinoActivityIndicator(
          radius: 30,
        )),
        barrierDismissible: false);

    Request request = Request(
        url: urlbase + urlconfirm,
        body: {'email': email, 'password': password});
    print(request.body);
    request.recover().then((value) {
      print(value.body.toString() + '00000000000011111111111111111');
      var response = jsonDecode(value.body);
      if (response['Success'] == "true") {
        print("true");
        // Get.back();
        Get.offNamed('/updatepass');
      } else {
        print("false");
        // Get.back();
        Get.snackbar("Error", "Email does not exist");
      }
    }).catchError((onError) {});
  }

  void updatepass() async {
    Get.dialog(
        Center(
            child: CupertinoActivityIndicator(
          radius: 30,
        )),
        barrierDismissible: false);
    Request request = Request(
        url: urlbase + urlPassword,
        body: {'email': email, 'password': password});
    print(request.body);
    request.recover().then((value) {
      print(value.body.toString() + '00000000000011111111111111111');

      var response = jsonDecode(value.body);
      if (response['Success'] == "true") {
        print("true");
        Get.back();
        Get.offNamed('/loginView');
      } else {
        print("false");
        Get.back();
        Get.snackbar("Error", "Email does not exist");
      }
    }).catchError((onError) {});
  }
}
