import 'package:dio/dio.dart';
import 'package:uetnoticeboard/backend/models/staffmodel.dart';
import 'package:uetnoticeboard/backend/url.dart';

import 'models/aluminimodel.dart';

Dio dio = Dio();

class Request {
  Future getFunction({url}) async {
    Response request = await dio.get(url);
    return request.data;
  }
}

Request request = Request();
Future<Staffmodel> getdata() async {
  var response = await request.getFunction(url: urlbase + staff);
  Staffmodel apidatause = Staffmodel.fromJson(response);
  return apidatause;
}

Request request1 = Request();
Future<List<CommentDatum>> getcomments() async {
  var response = await request.getFunction(url: urlbase + aluminiposts);
  List<CommentDatum> commentData = [];
  print(response['commentData']);
  response['commentData'].forEach((data) {
    commentData.insert(0, CommentDatum.fromJson(data));
  });
  // Aluminimodel apidatause = Aluminimodel.fromJson(response);
  return commentData;
}
