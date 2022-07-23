import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
Logger logger=Logger();
bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}

goto(
  Widget widget, {
  Transition transition = Transition.native,
  Duration duration = const Duration(),
  bool isPrevClose = false,
}) {
if(isPrevClose)
  {
Get.offAll(widget, transition:transition ,duration:duration);
  }
else{
Get.to(widget, transition: transition, duration: duration);
}


}
TOASTS(
    String data, {
      double fontsize = 16.0,
    }) {
  Fluttertoast.showToast(
      msg: data,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: fontsize

  );}
