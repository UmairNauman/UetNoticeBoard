import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uetnoticeboard/Aboutus.dart';
import 'package:uetnoticeboard/backend/changecontroller.dart';
import 'package:uetnoticeboard/backend/diorequest.dart';
import 'package:uetnoticeboard/main.dart';
import './style/colors.dart';
import './style/size.dart';
import 'backend/request.dart';

String imageurl;
String name1;

class AluminiView extends StatefulWidget {
  @override
  _AluminiViewState createState() => _AluminiViewState();
}

class _AluminiViewState extends State<AluminiView> {
  TextEditingController messagecontroller = TextEditingController();
  final Commentcontroller _commentcontroller = Get.put(Commentcontroller());
  getuserPicture() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      print("kkkkkkkk");
      imageurl = prefs.getString('user_profilepic');
      print(imageurl);
    });
  }

  getusername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name1 = prefs.getString('user_name');
      print(name1);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getusername();
    getuserPicture();
    getcomments().then((value) {
      Provider.of<UserHelper>(context, listen: false).setusercoments(value);
    });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserHelper>(context);
    return Scaffold(
        body: Form(
      key: _formKey,
      child: ListView(
        children: [
          ClipPath(
            clipper: DrawClip(),
            child: Container(
              decoration:
                  BoxDecoration(color: AppColor.orangeColor, boxShadow: [
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
                          "Alumini Relation",
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
                  SizedBox(height: size.convert(context, 65)),
                ],
              ),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                height: size.convert(context, 410),
                width: double.infinity,
                child: user.isloading
                    ? Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        itemCount: user.coments.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                margin: EdgeInsets.all(8.0),
                                height: size.convert(context, 100),
                                decoration: BoxDecoration(
                                    color: AppColor.teachercontainer,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 3,
                                          offset: Offset(2, 2),
                                          color:
                                              AppColor.shadow.withOpacity(0.3))
                                    ]),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: size.convertWidth(context, 10),
                                    ),
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage: NetworkImage(
                                          user.coments[index].image),
                                    ),
                                    SizedBox(
                                      width: size.convertWidth(context, 10),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: size.convert(context, 2),
                                        ),
                                        Text(
                                          user.coments[index].name,
                                          style: TextStyle(fontSize: 22),
                                        ),
                                        SizedBox(
                                          height: size.convert(context, 2),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: size.convert(context, 72),
                                            width:
                                                size.convertWidth(context, 200),
                                            child: Text(
                                              user.coments[index].message,
                                              style: TextStyle(fontSize: 15),
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                              textDirection: TextDirection.ltr,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ))),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.shadow.withOpacity(0.10),
                              offset: Offset(2, 2),
                            )
                          ]),
                      child: TextFormField(
                          controller: messagecontroller,
                          validator: (val) {},
                          onChanged: (val) {
                            _commentcontroller.message = val;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 14),
                              hintText: "Type a message")),
                    ),
                  ),
                  SizedBox(
                    width: size.convertWidth(context, 10),
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        _commentcontroller.comentmsg();
                        messagecontroller.clear();
                      }
                    },
                    child: Icon(
                      Icons.send,
                      color: AppColor.orangeColor,
                    ),
                  )
                ],
              ),
            ),
          ])
        ],
      ),
    ));
  }
}
