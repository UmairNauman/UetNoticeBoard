import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:uetnoticeboard/backend/url.dart';
import './request.dart';
import 'package:get/get.dart';
import './url.dart';
import 'package:uetnoticeboard/Aluminirelation.dart';

class Emailcontroller extends GetxController {
  String id;
  String newEmail;

  void emmailupdate() async {
    Get.dialog(
        Center(
            child: CupertinoActivityIndicator(
          radius: 30,
        )),
        barrierDismissible: false);

    Request request = Request(url: urlbase + emailupdate, body: {
      'id': id,
      'email': newEmail,
    });
    request.recover().then((value) {
      print(value.body);
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

class Passwordcontroller extends GetxController {
  String id;
  String newEmail;

  void passupdate() async {
    Get.dialog(
        Center(
            child: CupertinoActivityIndicator(
          radius: 30,
        )),
        barrierDismissible: false);

    Request request = Request(url: urlbase + passwordchange, body: {
      'id': id,
      'password': newEmail,
    });
    request.recover().then((value) {
      print(value.body);
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

class Numbercontroller extends GetxController {
  String id;
  String newEmail;

  void numupdate() async {
    Get.dialog(
        Center(
            child: CupertinoActivityIndicator(
          radius: 30,
        )),
        barrierDismissible: false);

    Request request = Request(url: urlbase + changenumber, body: {
      'id': id,
      'mobile': newEmail,
    });
    request.recover().then((value) {
      print(value.body);
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

class Namecontroller extends GetxController {
  String id;
  String newEmail;

  void nameupdate() async {
    Get.dialog(
        Center(
            child: CupertinoActivityIndicator(
          radius: 30,
        )),
        barrierDismissible: false);

    Request request = Request(url: urlbase + changename, body: {
      'id': id,
      'name': newEmail,
    });
    request.recover().then((value) {
      print(value.body);
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

class Profilecontroller extends GetxController {
  String id;
  File newEmail;

  void profileupdate() async {
    Get.dialog(
        Center(
            child: CupertinoActivityIndicator(
          radius: 30,
        )),
        barrierDismissible: false);
    Map data = {
      'id': id,
      'c_image': 'ffff',
    };
    Request request = Request(url: urlbase + profilepicupdate, body: {
      'id': id,
      'c_image': newEmail,
    });
    FormData formData = FormData({
      "id": id,
    });
    formData.files.add(
        MapEntry("c_image", MultipartFile(newEmail, filename: newEmail.path)));
    profilechange(urlbase + profilepicupdate, id, newEmail.path).then((value) {
      Get.back();
      Get.snackbar("Success", "Profile Change Successfully");
    });
    request.profileupload().then((value) {
      print(value.toString() + "ffffffffffffffffffffffffffffffffffffffff");
      var response = jsonDecode(value);
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

class Complaintcontroller extends GetxController {
  String name;
  String message;

  void complaint1() async {
    Request request = Request(url: urlbase + complaint, body: {
      'name': name,
      'message': message,
    });
    request.recover().then((value) {
      print(value.body);
      var response = jsonDecode(value.body);
      if (response['Success'] == "true") {
        print("true");
        Get.snackbar("Complain sent", "Complain sent successfully");
      } else {
        print("false");
        Get.back();
        Get.snackbar("Error", "something wrong");
      }
    }).catchError((onError) {});
  }
}

class Commentcontroller extends GetxController {
  String message;

  void comentmsg() async {
    Request request = Request(url: urlbase + aluminimessage, body: {
      'name': name1,
      'message': message,
      'image': imageurl,
    });
    request.recover().then((value) {
      print(value.body);
      var response = jsonDecode(value.body);
      if (response['status'] == 200) {
        print("true");
        Get.snackbar("Posted", "Message sent successfully");
      }
    }).catchError((onError) {});
  }
}
