import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './backend/router.dart';
import 'backend/request.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  runApp(MultiProvider(child: MyApp(), // Wrap your app

      providers: [
        ChangeNotifierProvider.value(value: UserHelper()),
      ]));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String loginpage;
  String userid;
  getidfunction() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String id = _prefs.getString('user_id');
    setState(() {
      userid = id;
      print(userid);
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      getidfunction();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX App',
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      defaultTransition: Transition.rightToLeft,
      getPages: Router1.route,
      initialRoute: "/splash",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        appBarTheme: AppBarTheme(
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
