import 'package:flutter/material.dart';

class Handpractice extends StatefulWidget {
  @override
  _HandpracticeState createState() => _HandpracticeState();
}

class _HandpracticeState extends State<Handpractice> {
  double h;
  double w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 30,
        backgroundColor: Colors.black,
        title: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.white10,
              child: Row(
                children: [
                  SizedBox(
                    width: w / 50,
                  ),
                  //Icon(Icons.arrow_back,color: Colors.black,),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: h / 3,
            width: w / 2,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,

                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
