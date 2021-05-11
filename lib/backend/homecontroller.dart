import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uetnoticeboard/backend/models/Noticemodel.dart';
import 'package:uetnoticeboard/backend/models/Usermodel.dart';
import 'package:uetnoticeboard/backend/models/careermodel.dart';
import 'package:uetnoticeboard/backend/models/studentmodel.dart';
import 'package:uetnoticeboard/backend/models/ueteventsmodel.dart';
import 'package:uetnoticeboard/backend/request.dart';
import 'package:uetnoticeboard/backend/models/timetablemodel.dart';
import 'package:uetnoticeboard/backend/url.dart';

import 'models/scholarshipmodel.dart';
import 'models/disciplinemodel.dart';

class Homecontroller extends GetxController {
  var userListData = List<dynamic>().obs;

  @override
  void onInit() {
    _apiGetUserList();
    super.onInit();
  }

  void _apiGetUserList() async {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));

    Request request = Request(url: urlslider, body: urlbase);
    request.home().then((value) {
      print(value.body.toString() + "jhkkjghfgddfghjjjjjjjjjjjjjjjjj");
      Usermodel userListModel = Usermodel.fromJson(json.decode(value.body));
      userListData.value = userListModel.imageUrl;
      print(value.body.toString() + "..................");
      Get.back();
    }).catchError((onError) {
      print(onError);
    });
  }
}

class Cardcontroller extends GetxController {
  var userListData = List<dynamic>().obs;
  Future apiGetUserList(url) async {
    Future.delayed(
      Duration.zero,
      () => Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false,
          barrierColor: Colors.white.withOpacity(0.5)),
    );

    Request request = Request(url: url, body: urlbase);
    request.home().then((value) {
      if (url == card) {
        Timetable userListModel = Timetable.fromJson(json.decode(value.body));
        userListData.value = userListModel.timetables;
        print(value.body.toString() + "..................");
        Get.back();
      } else if (url == noticeboard) {
        Noticeboardmodel userListModel =
            Noticeboardmodel.fromJson(json.decode(value.body));
        userListData.value = userListModel.notesboard;
        Get.back();
      } else if (url == career) {
        Career userListModel = Career.fromJson(json.decode(value.body));
        userListData.value = userListModel.careerDevelopment;
        Get.back();
      } else if (url == events) {
        Eventsmodel userListModel =
            Eventsmodel.fromJson(json.decode(value.body));
        userListData.value = userListModel.uetEvents;
        Get.back();
        // } else if (url == staff) {
        //   Staffmodel userListModel = Staffmodel.fromJson(json.decode(value.body));
        //   userListData.value = userListModel.searchTeacher;
        //   Get.back();
      } else if (url == alumini) {
        Scholarshipmodel userListModel =
            Scholarshipmodel.fromJson(json.decode(value.body));
        userListData.value = userListModel.scholarship;
        Get.back();
      } else if (url == student) {
        Studentmodel userListModel =
            Studentmodel.fromJson(json.decode(value.body));
        userListData.value = userListModel.studentAcademic;
        Get.back();
      } else if (url == discipline) {
        Disciplinemodel userListModel =
            Disciplinemodel.fromJson(json.decode(value.body));
        userListData.value = userListModel.discipines;
        Get.back();
      }
    }).catchError((onError) {
      print(onError);
    });
  }
}
