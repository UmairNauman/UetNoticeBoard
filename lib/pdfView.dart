import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:uetnoticeboard/Aboutus.dart';
import 'package:uetnoticeboard/backend/homecontroller.dart';
import 'package:uetnoticeboard/home.dart';
import 'package:uetnoticeboard/style/colors.dart';
import 'style/size.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfView extends StatefulWidget {
  final String url;
  final String name;
  PdfView({this.url, this.name});

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  TargetPlatform platform;

  final Cardcontroller _cardcontroller = Get.put(Cardcontroller());

  getdatacontroller() async {
    print(widget.url + "This is url");
    await _cardcontroller.apiGetUserList(widget.url);
  }

  @override
  void initState() {
    getpermission();
    getdatacontroller();
    super.initState();
  }

  void getpermission() async {
    print(getpermission);
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

  downloader(String url, String path) async {
    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: path,
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
    return taskId;
  }

  double h;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
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
                        "${widget.name}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.convert(context, 20),
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
        Container(
          height: size.convert(context, 450),
          width: double.infinity,
          child: Obx(() => ListView.builder(
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
                          widget.url == "get_notesboard.php"
                              ? "http://uetnoticeboard.000webhostapp.com/fileStorage/notesboard/" +
                                  _cardcontroller.userListData[index]
                              : widget.url == "get_Timetable.php"
                                  ? "http://uetnoticeboard.000webhostapp.com/fileStorage/timetable/" +
                                      _cardcontroller.userListData[index]
                                  : widget.url == "get_career.php"
                                      ? "http://uetnoticeboard.000webhostapp.com/fileStorage/career/" +
                                          _cardcontroller.userListData[index]
                                      : widget.url == "get_scholarship.php"
                                          ? "http://uetnoticeboard.000webhostapp.com/fileStorage/scholarship/" +
                                              _cardcontroller
                                                  .userListData[index]
                                          : widget.url ==
                                                  "get_studentsAcademic.php"
                                              ? "http://uetnoticeboard.000webhostapp.com/fileStorage/StudentsAcademic/" +
                                                  _cardcontroller
                                                      .userListData[index]
                                              : widget.url ==
                                                      "get_searchTeacher.php"
                                                  ? "http://uetnoticeboard.000webhostapp.com/fileStorage/searchTeacher/" +
                                                      _cardcontroller
                                                          .userListData[index]
                                                  : widget.url ==
                                                          "get_uetEvent.php"
                                                      ? "http://uetnoticeboard.000webhostapp.com/fileStorage/uetEvent/" +
                                                          _cardcontroller
                                                                  .userListData[
                                                              index]
                                                      : null,
                          path);
                    },
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Home(
                              widget.url == "get_notesboard.php"
                                  ? 'http://uetnoticeboard.000webhostapp.com/fileStorage/notesboard/${_cardcontroller.userListData[index]}'
                                  : widget.url == "get_Timetable.php"
                                      ? 'http://uetnoticeboard.000webhostapp.com/fileStorage/timetable/${_cardcontroller.userListData[index]}'
                                      : widget.url == "get_career.php"
                                          ? 'http://uetnoticeboard.000webhostapp.com/fileStorage/career/${_cardcontroller.userListData[index]}'
                                          : widget.url == "get_scholarship.php"
                                              ? 'http://uetnoticeboard.000webhostapp.com/fileStorage/scholarship/${_cardcontroller.userListData[index]}'
                                              : widget.url ==
                                                      "get_studentsAcademic.php"
                                                  ? 'http://uetnoticeboard.000webhostapp.com/fileStorage/StudentsAcademic/${_cardcontroller.userListData[index]}'
                                                  : widget.url ==
                                                          "get_searchTeacher.php"
                                                      ? 'http://uetnoticeboard.000webhostapp.com/fileStorage/searchTeacher/${_cardcontroller.userListData[index]}'
                                                      : widget.url ==
                                                              "get_uetEvent.php"
                                                          ? 'http://uetnoticeboard.000webhostapp.com/fileStorage/uetEvent/${_cardcontroller.userListData[index]}'
                                                          : null,
                            ))),
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
                              children: [
                                SizedBox(
                                  height: size.convert(context, 1),
                                ),
                                Container(
                                  height: size.convert(context, 30),
                                  width: size.convertWidth(context, 200),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          width: 2, color: Colors.red)),
                                  child: Center(child: Text("PDF file")),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 35,
                                  width: 150,
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
                  ),
                ),
              )),
        ),
      ],
    ));
  }
}
