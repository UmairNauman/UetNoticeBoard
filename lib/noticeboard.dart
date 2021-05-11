// import 'package:flutter/material.dart';
// import 'package:uetnoticeboard/backend/homecontroller.dart';
// import 'package:get/get.dart';
// import './style/size.dart';
// import 'package:uetnoticeboard/home.dart';

// class NoticeBoard extends StatelessWidget {
//   final Noticeboardcontroller _noticeboardcontroller =
//       Get.put(Noticeboardcontroller());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() => ListView.builder(
//             itemCount: _noticeboardcontroller.userListData.length,
//             itemBuilder: (context, index) => Container(
//               height: size.convert(context, 100),
//               width: size.convertWidth(context, 300),
//               child: GestureDetector(
//                 onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                     builder: (BuildContext context) => Home(
//                           _noticeboardcontroller.userListData[index],
//                         ))),
//                 child: ListTile(
//                   title: Text("Pdf Files"),
//                   subtitle: Text(_noticeboardcontroller.userListData[index]),
//                 ),
//               ),
//             ),
//           )),
//     );
//   }
// }
