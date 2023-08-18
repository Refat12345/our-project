import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/theme/colors.dart';

const String icons = "icons/";

getSvgIcon(icon) {
  return SvgPicture.asset(icons + icon);
}

Future flutterToast(dynamic message, String type,double height,String gravity) {
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
  static String url = "http://192.168.1.105:8000/api/";
  static String imageUrl="http://192.168.1.105:8000/";
}


