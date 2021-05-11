import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uetnoticeboard/backend/request.dart';
import 'package:uetnoticeboard/style/colors.dart';
import './style/size.dart';
import 'Aboutus.dart';
import 'backend/diorequest.dart';

class StaffandFaculty extends StatefulWidget {
  @override
  _StaffandFacultyState createState() => _StaffandFacultyState();
}

class _StaffandFacultyState extends State<StaffandFaculty> {
  double h;
  double w;
  @override
  void initState() {
    getdata().then((value) {
      Provider.of<UserHelper>(context, listen: false).setUserInformation(value);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserHelper>(context);
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(children: [
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
                        "Faculty and Staff memebers",
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
          child: user.isloading
              ? Center(
                  child: CupertinoActivityIndicator(),
                )
              : ListView.builder(
                  itemCount: user.newuser.teacherInfo.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.teachercontainer,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              offset: Offset(2, 2),
                              color: AppColor.shadow.withOpacity(0.3))
                        ]),
                    height: size.convert(context, 130),
                    width: size.convertWidth(context, 200),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 3,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: size.convertWidth(context, 8)),
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                                user?.newuser?.teacherInfo[index]?.image ??
                                    'network error'),
                          ),
                          SizedBox(
                            width: size.convertWidth(context, 5),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Name: " +
                                        user?.newuser?.teacherInfo[index]
                                            ?.name ??
                                    'network error',
                                style: TextStyle(
                                  fontSize: size.convert(context, 14),
                                ),
                              ),
                              SizedBox(height: size.convert(context, 5)),
                              Text(
                                user?.newuser?.teacherInfo[index]?.email ??
                                    'network error',
                                style: TextStyle(
                                  fontSize: size.convert(context, 13),
                                ),
                              ),
                              SizedBox(height: size.convert(context, 5)),
                              Text(
                                "Department: " +
                                        user?.newuser?.teacherInfo[index]
                                            ?.deparment ??
                                    'network error',
                                style: TextStyle(
                                  fontSize: size.convert(context, 14),
                                ),
                              ),
                              SizedBox(height: size.convert(context, 5)),
                              Text(
                                "Subject: " +
                                        user?.newuser?.teacherInfo[index]
                                            ?.specialsubj ??
                                    'network error',
                                style: TextStyle(
                                  fontSize: size.convert(context, 14),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        )
      ]),
    );
  }
}
