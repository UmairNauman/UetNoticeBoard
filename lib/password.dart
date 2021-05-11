import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uetnoticeboard/backend/Forgetcontroller.dart';

class ConfirmCode extends StatelessWidget {
  final Forgetcontroller _forgetcontroller = Get.put(Forgetcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            onChanged: (val) {
              _forgetcontroller.password = val;
            },
          ),
          RaisedButton(onPressed: () {
            _forgetcontroller.confirmpass();
          })
        ],
      ),
    );
  }
}
