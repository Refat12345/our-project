import 'package:flutter/material.dart';

import '../component/helper.dart';
import '../component/widget.dart';
import '../theme/colors.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: heightScreen / 45, right: heightScreen / 45),
        child: LayoutBuilder(builder: (context, constrain) {
          double fontSize = constrain.maxHeight / 50;
          onTap() {
            if (formKey.currentState!.validate()) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        actions: [
                          Center(
                              child: PinCode(
                            controller: pinController,
                            pinLength: 4,
                            maxHeight: constrain.maxHeight,
                            maxWidth: constrain.maxWidth,
                            phoneNumber: phoneNumber.text,
                          )),
                        ],
                      ));
            }
          }

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                      child: SizedBox(
                    height: constrain.maxHeight / 3,
                    width: constrain.maxWidth / 1.2,
                    child: getSvgIcon("welcome2.svg"),
                  )),
                  SizedBox(
                    height: constrain.maxHeight / 45,
                  ),
                  Text(
                    "اسم المستخدم",
                    style: TextStyle(
                        fontSize: fontSize,
                        color: grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Cairo"),
                  ),
                  SizedBox(
                    height: constrain.maxHeight / 72,
                  ),
                  Filed(
                      controller: name,
                      hintText: "أدخل اسم المستخدم",
                      height: constrain.maxHeight,
                      login: false),
                  SizedBox(
                    height: constrain.maxHeight / 37,
                  ),
                  Text(
                    "رقم الهاتف",
                    style: TextStyle(
                        fontSize: fontSize,
                        color: grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Cairo"),
                  ),
                  SizedBox(
                    height: constrain.maxHeight / 72,
                  ),
                  Filed(
                      controller: phoneNumber,
                      hintText: "أدخل رقم الهاتف",
                      height: constrain.maxHeight,
                      login: false),
                  SizedBox(
                    height: constrain.maxHeight / 37,
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
                    height: heightScreen / 72,
                  ),
                  Filed(
                      controller: password,
                      hintText: "أدخل 8 أحرف على الأقل",
                      height: constrain.maxHeight,
                      login: false),
                  SizedBox(
                    height: heightScreen / 37,
                  ),
                  Text(
                    "تأكيد كلمة المرور",
                    style: TextStyle(
                        fontSize: fontSize,
                        color: grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Cairo"),
                  ),
                  SizedBox(
                    height: heightScreen / 72,
                  ),
                  Filed(
                      controller: confirmPassword,
                      hintText: "أدخل تأكيد كلمة المرور",
                      height: constrain.maxHeight,
                      login: false),
                  SizedBox(
                    height: constrain.maxHeight / 30,
                  ),
                  Bottom(
                      text: "أنشئ حساب",
                      height: constrain.maxHeight,
                      onTap: onTap),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
