import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theme/colors.dart';

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  Orientation orientation = mediaQueryData.orientation;
  double width = 0;
  if (orientation == Orientation.landscape) {
    width = mediaQueryData.size.height;
  } else {
    width = mediaQueryData.size.width;
  }
  if (width >= 600) {
    return DeviceType.tablet;
  } else {
    return DeviceType.mobile;
  }
}

enum DeviceType { mobile, tablet }

const String icons = "icons/";

getSvgIcon(icon) {
  return SvgPicture.asset(icons + icon);
}

Future<void> flutterToast(String message, String type) async {
  Color backgroundColor = Colors.green;

  if (type == 'error') {
    backgroundColor = Colors.red;
  }

  await Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}


Future flutterToastt(dynamic message, String type,double height,String gravity) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity=="pin"?ToastGravity.CENTER:ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: type=="error"?Colors.red:green,
      textColor: Colors.white,
      fontSize: height*0.027);
}




class EndPoint {
  static String url = "http://192.168.1.104:8000/api/";
  static String imageUrl="http://192.168.1.104:8000/";
}
