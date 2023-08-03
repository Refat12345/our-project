import 'package:flutter/material.dart';
import 'package:project2/page/register.dart';
import 'package:project2/page/user/cart.dart';


import '../component/helper.dart';
import '../component/widget.dart';
import '../theme/colors.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: heightScreen / 45,
            right: heightScreen / 45,
            top: heightScreen / 16),
        child: LayoutBuilder(builder: (context, constrain) {
          onTap() {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Cart()));
          }

          double fontSize = constrain.maxHeight / 50;
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                        child: SizedBox(
                      height: constrain.maxHeight / 2.75,
                      width: constrain.maxWidth / 1.2,
                      child: getSvgIcon("welcome3.svg"),
                    )),
                    SizedBox(
                      height: constrain.maxHeight / 20,
                    ),
                    Text(
                      "رقم الهاتف",
                      style: TextStyle(
                          fontSize: fontSize,
                          color: grey,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Cairo"),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: constrain.maxHeight / 70,
                    ),
                    Filed(
                        controller: phoneNumber,
                        hintText: "أدخل رقم الهاتف",
                        height: constrain.maxHeight,
                        login: true),
                    SizedBox(
                      height: constrain.maxHeight / 35,
                    ),
                    Text(
                      "كلمة المرور",
                      style: TextStyle(
                          fontSize: fontSize,
                          color: grey,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Cairo"),
                    ),
                    SizedBox(
                      height: heightScreen / 70,
                    ),
                    Filed(
                        controller: password,
                        hintText: "أدخل كلمة المرور",
                        height: constrain.maxHeight,
                        login: true),
                    SizedBox(
                      height: constrain.maxHeight / 30,
                    ),
                    Bottom(
                      text: "تسجيل الدخول",
                      height: constrain.maxHeight,
                      onTap: onTap,
                    ),
                    SizedBox(
                      height: constrain.maxHeight / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          "ليس لديك حساب بعد؟",
                          style: TextStyle(
                              fontSize: fontSize,
                              decoration: TextDecoration.underline,
                              fontFamily: "Cairo"),
                          textAlign: TextAlign.right,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              " أنشئ حساب",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize,
                                  color: primary,
                                  fontFamily: "Cairo"),
                              textAlign: TextAlign.right,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
