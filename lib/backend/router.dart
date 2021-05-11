import 'package:get/get.dart';
import 'package:uetnoticeboard/ChangePassword.dart';
import 'package:uetnoticeboard/Complainbox.dart';
import 'package:uetnoticeboard/Edit.dart';

import 'package:uetnoticeboard/Login.dart';

import 'package:uetnoticeboard/Forgetscreen.dart';
import 'package:uetnoticeboard/Recievecode.dart';
import 'package:uetnoticeboard/SplashScreen.dart';
import 'package:uetnoticeboard/aftersplashScreen.dart';
import 'package:uetnoticeboard/mainpage.dart';

import 'package:uetnoticeboard/password.dart';
import 'package:uetnoticeboard/pdfView.dart';
import 'package:uetnoticeboard/updatepass.dart';

class Router1 {
  static final route = [
    GetPage(
      name: '/loginView',
      page: () => Login(),
    ),
    // GetPage(
    //   name: '/homeView',
    //   parameter: ,
    //   page: () => Home(),
    // ),
    GetPage(name: '/forgetView', page: () => ForgetScreen()),
    GetPage(name: '/code', page: () => ConfirmCode()),
    GetPage(name: '/pdfview', page: () => PdfView()),
    GetPage(name: '/update', page: () => Updatepass()),
    // GetPage(name: '/noticeboard', page: () => NoticeBoard()),
    GetPage(name: '/Mainhome', page: () => Mainpage()),
    GetPage(name: '/recievecode', page: () => ConfirmPassword()),
    GetPage(name: '/updatepass', page: () => ChangePassword()),
    GetPage(name: '/splash', page: () => SplashScreen()),
    GetPage(name: '/editprofile', page: () => EditProfile()),
    GetPage(name: '/aftersplash', page: () => LoginButton()),
    GetPage(name: '/complaint', page: () => ComplainBox()),
  ];
}
