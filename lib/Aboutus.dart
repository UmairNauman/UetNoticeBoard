import 'package:flutter/material.dart';
import 'package:uetnoticeboard/style/colors.dart';
import 'package:uetnoticeboard/style/size.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
                          "About us   ",
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
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Opacity(
                    opacity: 0.1,
                    child: Container(child: Image.asset('images/logo.png'))),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                            "⬤  The Student Facilitation System has been created to enable students and admin to connect them on online application platform. By this	application, there is no need to display any announcement on noticeboard."),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                            "⬤ 	It will promote paperless administration, making the I.T environmental friendly as well as efficient."),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                            "⬤  Online Uet Student Facilitating System is a mobile base application which is used for facilitating students"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                            '⬤ 	Because our project has a real scope in our department. We are targeting all those Students who are unable to see their notice board for any notification announcements, results, fees, timetable and etc. Due to some reasons. '),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                            '⬤ 	Students can have used these System for easy to watching any Time table, notification announcements such as fees, results and etc. at any destination on time. It will allow students through this application to find and see any notification/announcement, time table, form and etc. on notice board on time. '),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     child: Text(
          //         "✓  The Student Facilitation System has been created to enable students and admin to connect them on online application platform. By this	application, there is no need to display any announcement on noticeboard."),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     child: Text(
          //         "✓ 	It will promote paperless administration, making the I.T environmental friendly as well as efficient."),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     child: Text(
          //         "✓ Online Uet Student Facilitating System is a mobile base application which is used for facilitating students"),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     child: Text(
          //         '✓ 	Because our project has a real scope in our department. We are targeting all those Students who are unable to see their notice board for any notification announcements, results, fees, timetable and etc. Due to some reasons. '),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     child: Text(
          //         '✓ 	Students can have used these System for easy to watching any Time table, notification announcements such as fees, results and etc. at any destination on time. It will allow students through this application to find and see any notification/announcement, time table, form and etc. on notice board on time. '),
          //   ),
          // ),
        ],
      ),
    );
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
    var secondControlPoint = Offset(size.width + (55), size.height - 100);
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
