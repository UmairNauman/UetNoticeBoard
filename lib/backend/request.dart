import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uetnoticeboard/backend/models/staffmodel.dart';
import './url.dart';
import 'models/aluminimodel.dart';

class Request {
  final String url;
  final dynamic body;

  Request({this.url, this.body, String email});

  Future<http.Response> login() {
    print('object2');
    print(urlbase + urllogin);
    print(body);
    return http
        .post(urlbase + urllogin, body: body)
        .timeout(Duration(minutes: 2));
  }

  Future<http.Response> recover() {
    print(body.toString());
    return http.post(url, body: body).timeout(Duration(minutes: 2));
  }

  Future<http.Response> home() {
    return http.get(body + url).timeout(Duration(minutes: 2));
  }

  Future<String> profileupload() async {
    var request = http.MultipartRequest('id', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('c_image', body));
    var res = await request.send();
    return res.reasonPhrase;
  }
}

Future profilechange(url, id, image) async {
  var request = http.MultipartRequest('POST', Uri.parse(url))
    ..fields['id'] = id;
  request.files.add(await http.MultipartFile.fromPath('c_image', image));
  http.Response response = await http.Response.fromStream(await request.send());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var decode = jsonDecode(response.body);
  prefs.setString("user_profilepic", decode['image']);
  print(response.body);
  print("this is functiom");
}

class UserHelper extends ChangeNotifier {
  bool isloading = true;
  Staffmodel newuser;
  List<CommentDatum> coments;
  Staffmodel get getuser => newuser;
  setUserInformation(Staffmodel paramsUser) {
    newuser = paramsUser;
    isloading = false;
    notifyListeners();
  }

  setusercoments(List<CommentDatum> paramscoments) {
    coments = paramscoments;
    isloading = false;
    notifyListeners();
  }
}
