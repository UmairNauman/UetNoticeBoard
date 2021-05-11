import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:uetnoticeboard/Edit.dart';

import 'package:uetnoticeboard/Largeimage.dart';
import 'package:uetnoticeboard/RepeatedWidgets/CustomContainer.dart';
import 'package:uetnoticeboard/Staffandfaculty.dart';
import 'package:uetnoticeboard/backend/homecontroller.dart';
import 'package:uetnoticeboard/backend/url.dart';
import 'package:uetnoticeboard/pdfView.dart';
import 'package:uetnoticeboard/style/colors.dart';
import 'package:get/get.dart';
import 'package:uetnoticeboard/style/size.dart';

import 'Aboutus.dart';
import 'Complainbox.dart';
import 'Discipline.dart';
import 'InviteFriends.dart';
import 'Aluminirelation.dart';

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  double h;
  double w;
  final Homecontroller _homecontroller = Get.put(Homecontroller());

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColor.orangeColor),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(45), bottomRight: Radius.circular(45)),
          child: Container(
            width: 250,
            child: Drawer(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: size.convert(context, 10),
                  ),
                  Center(
                    child: Container(
                      height: size.convert(context, 142),
                      width: size.convertWidth(context, 200),
                      child: Image.asset(
                        "images/logo.png",
                      ),
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Container(
                    height: size.convert(context, 100),
                    width: size.convertWidth(context, 100),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'UET',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text("Peshawar", style: TextStyle(color: Colors.white)),
                      ],
                    )),
                  ),
                  Divider(height: size.convert(context, 50)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()));
                    },
                    child: ListTile(
                      title: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Avenir',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      leading: Container(
                        width: w / 20,
                        child: Image.asset(
                          'images/edit.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ComplainBox()));
                    },
                    child: ListTile(
                      title: Text(
                        'Complaint Box',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Avenir',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      leading: Container(
                        width: w / 20,
                        child: Image.asset(
                          'images/edit.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                    child: ListTile(
                      title: Text(
                        'About Us',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Avenir',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      leading: Container(
                        width: w / 20,
                        child: Image.asset(
                          'images/about.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Discipline(
                                    url: discipline,
                                  )));
                    },
                    child: ListTile(
                      title: Text(
                        'Discipline',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Avenir',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      leading: Container(
                        width: w / 20,
                        child: Image.asset(
                          'images/disipline.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InviteFriends()));
                      },
                      child: Text(
                        'Invite Friends',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Avenir',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    leading: Container(
                      width: w / 20,
                      child: Image.asset(
                        'images/friend.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences _prefs =
                          await SharedPreferences.getInstance();
                      _prefs.remove('user_email');
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('user_id');
                      Get.offNamed("/loginView");
                      Get.back();
                    },
                    child: ListTile(
                      leading: Image.asset(
                        'images/logout.png',
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Avenir',
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColor.whiteColor,
      body: Builder(
        builder: (context) => SafeArea(
          child: Column(
            children: [
              //
              Obx(() => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Stack(
                        children: [
                          Container(
                            // padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            // height: size.convert(context, 400),

                            child: PageView.builder(
                                itemCount: _homecontroller.userListData.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => LargeImage(
                                                  _homecontroller
                                                      .userListData[index]))),
                                      child: Hero(
                                        tag: 'image',
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Image.network(
                                            _homecontroller.userListData[index],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 13),
                            child: Container(
                              height: size.convert(context, 40),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        Scaffold.of(context).openDrawer(),
                                    child: Icon(
                                      Icons.menu,
                                      color: AppColor.orangeColor,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),

              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.orangeColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          height: size.convert(context, 30),
                        ),
                        Column(
                          children: [
                            Listofcontainer("Click here >",
                                context: context,
                                name: "TimeTable Of",
                                name2: "Batches", onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PdfView(
                                            url: card,
                                            name: "TimeTable Of Batches",
                                          )));
                            }, imageName: 'images/timetable.png'),
                            SizedBox(
                              height: size.convert(context, 10),
                            ),
                            Listofcontainer("Click here >",
                                context: context,
                                name: "Notice Board",
                                name2: "", onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PdfView(
                                            url: noticeboard,
                                            name: "NoticeBoard",
                                          )));
                            }, imageName: 'images/notice.png'),
                            SizedBox(
                              height: size.convert(context, 10),
                            ),
                            Listofcontainer("Click here >",
                                context: context,
                                name: "Career",
                                name2: "Development", onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PdfView(
                                            url: career,
                                            name: "Career Development",
                                          )));
                            }, imageName: 'images/career.png'),
                            SizedBox(
                              height: size.convert(context, 10),
                            ),
                            Listofcontainer("Click here >",
                                context: context,
                                name: "Alumini Relation",
                                name2: "", onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AluminiView()));
                            }, imageName: 'images/alumini.png'),
                            SizedBox(
                              height: size.convert(context, 10),
                            ),
                            Listofcontainer("Click here >",
                                context: context,
                                name: "Students Academic",
                                name2: "Support", onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PdfView(
                                            url: student,
                                            name: "Student Academic Support",
                                          )));
                            }, imageName: 'images/studentsupport.png'),
                            SizedBox(
                              height: size.convert(context, 10),
                            ),
                            Listofcontainer("Click here >",
                                context: context,
                                name: "Faculty and",
                                name2: "Staff members", onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StaffandFaculty()));
                            }, imageName: 'images/staff.png'),
                            SizedBox(
                              height: size.convert(context, 10),
                            ),
                            Listofcontainer("Click here >",
                                context: context,
                                name: "Events of UET",
                                name2: "", onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PdfView(
                                          url: events, name: "Events of UET")));
                            }, imageName: 'images/events.png'),
                            SizedBox(
                              height: size.convert(context, 10),
                            ),
                            Listofcontainer(
                              "Click here >",
                              context: context,
                              name: "Scholarships",
                              name2: "",
                              imageName: 'images/scholar.png',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PdfView(
                                              url: alumini,
                                              name: "Scholarships",
                                            )));
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
