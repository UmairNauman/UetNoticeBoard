import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uetnoticeboard/backend/homecontroller.dart';
import 'package:uetnoticeboard/home.dart';
import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';
import 'package:get/get.dart';

class Discipline extends StatefulWidget {
  final String url;
  Discipline({this.url});
  @override
  _DisciplineState createState() => _DisciplineState();
}

class _DisciplineState extends State<Discipline> {
  final Cardcontroller _cardcontroller = Get.put(Cardcontroller());
  getdatacontroller() async {
    print(widget.url + "This is url");
    await _cardcontroller.apiGetUserList(widget.url);
  }

  @override
  void initState() {
    getdatacontroller();

    super.initState();
    getpermission();
  }

  void getpermission() async {
    print(getpermission);
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

  downloader(String url, String path) async {
    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: path,
      showNotification: true,
      openFileFromNotification: true,
    );
    return taskId;
  }

  double h;
  double w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ListView(
      children: [
        ClipPath(
          clipper: DrawClip(),
          child: Container(
            decoration: BoxDecoration(color: AppColor.orangeColor, boxShadow: [
              BoxShadow(
                  offset: Offset(-7, 7),
                  blurRadius: 9,
                  color: AppColor.complainBoxShadow.withOpacity(1.0)),
            ]),
            alignment: Alignment.center,
            height: size.convert(context, 200),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: IconButton(
                        padding: EdgeInsets.only(right: 15),
                        icon: Icon(Icons.arrow_back,
                            size: 34, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Text(
                        "Discipline   ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.convert(context, 35),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: size.convert(context, 30),
                    )
                  ],
                ),
                SizedBox(
                  height: h / 9,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.convert(context, 20),
        ),
        Container(
          height: size.convert(context, 450),
          width: double.infinity,
          child: Obx(() => ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: _cardcontroller.userListData.length,
              itemBuilder: (context, index) => Container(
                  height: size.convert(context, 100),
                  width: size.convertWidth(context, 300),
                  child: GestureDetector(
                    onLongPress: () async {
                      String path =
                          await ExtStorage.getExternalStoragePublicDirectory(
                              ExtStorage.DIRECTORY_DOWNLOADS);
                      downloader(
                          widget.url == "get_discipines.php"
                              ? "http://uetnoticeboard.000webhostapp.com/fileStorage/discipines/" +
                                  _cardcontroller.userListData[index]
                              : Container(
                                  child: Text("error"),
                                ),
                          path);
                    },
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home(widget.url ==
                                    "get_discipines.php"
                                ? '${"http://uetnoticeboard.000webhostapp.com/fileStorage/discipines/" + _cardcontroller.userListData[index]}'
                                : Container(
                                    child: Text("error"),
                                  )))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              maxRadius: 40,
                              backgroundImage: AssetImage(
                                'images/pdf.png',
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: size.convert(context, 10),
                                ),
                                Container(
                                  height: size.convert(context, 25),
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          width: 2, color: Colors.red)),
                                  child: Center(child: Text("PDF file")),
                                ),
                                SizedBox(height: size.convert(context, 4)),
                                Container(
                                  height: size.convert(context, 40),
                                  width: size.convertWidth(context, 185),
                                  child: Text(
                                    _cardcontroller.userListData[index],
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.convertWidth(context, 350),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )))),
        ),
      ],
    ));
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;

  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = Offset(45, size.height / 1.8);
    var firstEndPoint = Offset(size.width / 2, size.height / 1.8);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width + (55), size.height - 75);
    var secondEndPoint = Offset(size.width, size.height / 1);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
