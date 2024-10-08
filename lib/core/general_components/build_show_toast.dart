import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'color_helper.dart';

Future<bool?> buildShowToast(String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: ColorHelper.darkColor,
    textColor: Colors.white,
    fontSize: 15.0,
  );
}