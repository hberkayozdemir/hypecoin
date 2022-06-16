import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastMessage(String mess, {required ToasType type}) {
  late Color _color;
  switch (type) {
    case ToasType.success:
      _color = Colors.greenAccent.shade700;
      break;
    case ToasType.info:
      _color = Colors.blueAccent.shade700;
      break;
    case ToasType.error:
      _color = Colors.redAccent.shade700;
      break;
  }

  Fluttertoast.showToast(
      msg: mess,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: _color,
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToasType { success, info, error }
