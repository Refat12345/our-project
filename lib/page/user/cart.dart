import 'package:flutter/material.dart';


import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../component/widget.dart';
import '../../theme/colors.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: getBottom(width, height),
        appBar: AppBar(
          iconTheme: IconThemeData(color: green, size: width / 15),
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: height / 15,
          title: const Text("سلة التسوق"),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.delete_outline),
            )
          ],
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w800,
              fontFamily: "Cairo",
              fontSize: width / 18,
              color: Colors.black),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: height / 100),
          child: const ProductCart(),
        ));
  }
}

Widget getBottom(width, height) {
  return Container(
    height: height / 8.5,
    width: double.infinity,
    decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 2, color: Colors.white))),
    child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          ZoomTapAnimation(
            child: Container(
              height: height / 19,
              width: width / 2,
              decoration: BoxDecoration(
                  color: green, borderRadius: BorderRadius.circular(12)),
              child: Text(
                "تأكيد الطلب",
                style: TextStyle(
                    fontSize: width / 20,
                    fontFamily: "Cairo",
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' اجمالي الفاتورة:',
                style: TextStyle(fontFamily: "Cairo", fontSize: width / 25),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(
                height: height / 100,
              ),
              Text(
                '27000 ل.س',
                style: TextStyle(
                    color: green,
                    fontSize: width / 27,
                    fontWeight: FontWeight.w900),
                textDirection: TextDirection.rtl,
              )
            ],
          )
        ],
      ),
    ),
  );
}
