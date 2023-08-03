import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../theme/colors.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

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
          title: const Text("تفاصيل المنتج"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.menu_board, color: green))
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
          padding: EdgeInsets.only(top: height / 100, left: 10, right: 10),
          child: LayoutBuilder(
              builder: (context, constrain) => SingleChildScrollView(
                    child: Column(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(constrain.maxWidth / 55),
                          child: Image(
                              width: double.infinity,
                              height: constrain.maxHeight / 2,
                              fit: BoxFit.fill,
                              image: const NetworkImage(
                                  "https://static.arrajol.com/styles/800x533/public/2021-08/11111_0.jpg")),
                        ),
                        SizedBox(
                          height: constrain.maxHeight / 30,
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(
                              "همبرغر لحمة",
                              style: TextStyle(
                                  fontFamily: "Cairo",
                                  fontSize: constrain.maxWidth / 15,
                                  color: green),
                            ),
                            const Spacer(),
                            Container(
                              height: constrain.maxHeight / 31.5,
                              width: constrain.maxWidth / 7.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: green.withOpacity(0.7)),
                              child: Padding(
                                padding: const EdgeInsets.all(1.5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "4.5 ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: constrain.maxWidth / 50 +
                                              constrain.maxHeight / 75),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: constrain.maxWidth / 55 +
                                          constrain.maxHeight / 65,
                                      color: Colors.yellow,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: constrain.maxHeight / 30,
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            ZoomTapAnimation(
                              child: Container(
                                  height: constrain.maxHeight / 22,
                                  width: constrain.maxWidth / 13,
                                  decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: constrain.maxWidth / 19,
                                  )),
                            ),
                            SizedBox(
                              width: constrain.maxWidth / 100,
                            ),
                            Text(
                              "1",
                              style:
                                  TextStyle(fontSize: constrain.maxWidth / 23),
                            ),
                            SizedBox(
                              width: constrain.maxWidth / 100,
                            ),
                            ZoomTapAnimation(
                              child: Container(
                                  height: constrain.maxHeight / 22,
                                  width: constrain.maxWidth / 13,
                                  decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: constrain.maxWidth / 19,
                                  )),
                            ),
                            const Spacer(),
                            Text(
                              '27000 ل.س',
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: constrain.maxWidth / 50 +
                                      constrain.maxHeight / 70,
                                  fontWeight: FontWeight.w900),
                              textDirection: TextDirection.rtl,
                            )
                          ],
                        ),
                        SizedBox(
                          height: constrain.maxHeight / 30,
                        ),
                        Text(
                          "أكلة كثيراً ما تعد من الوجبات السريعة وقد انتشرت بسرعة في كل أنحاء العالم حتى أصبحت من وجبات العولمة، تتكون من ساندويتش من اللحم أو الدجاج بالإضافة إلى الكاتشاب والمايونيز والخضار",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: constrain.maxWidth / 55 +
                                  constrain.maxHeight / 75),
                        ),
                        SizedBox(
                          height: constrain.maxHeight / 150,
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(
                              "الكمية المتبقية:",
                              style: TextStyle(
                                  fontFamily: "Cairo",
                                  fontSize: constrain.maxWidth / 35 +
                                      constrain.maxHeight / 55,
                                  fontWeight: FontWeight.w700),
                              textDirection: TextDirection.rtl,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "كثير",
                              style: TextStyle(
                                  fontFamily: "Cairo",
                                  fontSize: constrain.maxWidth / 50 +
                                      constrain.maxHeight / 75,
                                  color: green.withOpacity(0.9)),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
        ));
  }

  Widget getBottom(width, height) {
    return Container(
      height: width >= 600 ? height / 12 : height / 15,
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(width: 2, color: Colors.white))),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 15, bottom: 7),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
              height: width >= 600 ? height / 10 : height / 20,
              width: width / 1.3,
              decoration: BoxDecoration(
                  color: green, borderRadius: BorderRadius.circular(12)),
              child: Text(
                "إضافة إلى السلة",
                style: TextStyle(
                    fontSize: width / 20,
                    fontFamily: "Cairo",
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                  width: width / 7,
                  height: height / 15,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                      size: width / 30 + height / 50,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
