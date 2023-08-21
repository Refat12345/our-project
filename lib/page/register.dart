import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/register/register_cubit.dart';
import 'package:untitled1/network/local/cache.dart';
import 'package:untitled1/page/user/verify_code.dart';
import 'package:untitled1/page/vendor/getvendorshop.dart';
import '../bloc/register/register_state.dart';
import '../component/helper.dart';
import '../component/widget.dart';
import '../theme/colors.dart';

class Register extends StatelessWidget {
  Register({super.key});

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormFieldState> phoneFromKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passwordFromKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> nameFormKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;


    return Scaffold(
        body: BlocProvider(
            create: (context) => RegisterCubit(),
            child: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) async {
                RegisterCubit registerCubit = RegisterCubit.get(context);
                if (state is SuccessState) {
                  if( state.registerModel.message=='الرقم مستخدم مسبقا')
                  {
                    flutterToastt(state.registerModel.message, 'error', heightScreen, "gravity");
                  }else
                  {
                   await CacheHelper.saveData(key: "bool", value: false);
                    if (state.registerModel.status == true) {
                      if(registerCubit.values==-1)
                      {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return VerifyCode(phoneNumber.text);
                            });
                      }else
                      {

                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const GetVendorShop()), (route) => false);
                      }

                    }
                  }

                }
              },
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: heightScreen / 45, right: heightScreen / 45),
                  child: LayoutBuilder(builder: (context, constrain) {
                    double fontSize = constrain.maxHeight / 50;
                    onTap() {
                      if (formKey.currentState!.validate()) {
                        RegisterCubit.get(context).register(
                            phoneNumber: phoneNumber.text,
                            name: name.text,
                            password: password.text);
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
                              height: constrain.maxHeight / 80,
                            ),
                            Text(
                              "نوع المستخدم",
                              style: TextStyle(
                                  fontSize: fontSize,
                                  color: grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Cairo"),
                            ),
                            SizedBox(
                              height: constrain.maxHeight / 73,
                            ),
                            Container(
                              height: constrain.maxHeight > 1300
                                  ? constrain.maxHeight / 17.7
                                  : (constrain.maxHeight > 1000
                                      ? constrain.maxHeight / 16.6
                                      : (constrain.maxHeight > 750 &&
                                              constrain.maxHeight < 950)
                                          ? constrain.maxHeight / 14.5
                                          : constrain.maxHeight >= 950 &&
                                                  constrain.maxHeight <= 1000
                                              ? constrain.maxHeight / 15
                                              : constrain.maxHeight / 12.5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: textFieldBg),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: DropdownButtonFormField(
                                        iconSize: constrain.maxHeight > 1300
                                            ? constrain.maxHeight * 0.045
                                            : (constrain.maxHeight > 1000
                                                ? constrain.maxHeight * 0.048
                                                : (constrain.maxHeight > 750 &&
                                                        constrain.maxHeight < 950)
                                                    ? constrain.maxHeight * 0.038
                                                    : constrain.maxHeight >=
                                                                950 &&
                                                            constrain.maxHeight <=
                                                                1000
                                                        ? constrain.maxHeight *
                                                            0.09
                                                        : constrain.maxHeight *
                                                            0.042),
                                        iconEnabledColor: primary,
                                        style: TextStyle(
                                            fontSize: constrain.maxHeight * 0.02,
                                            color: Colors.black),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        value: "-1",
                                        items: const [
                                          DropdownMenuItem(
                                            alignment:
                                                AlignmentDirectional.bottomEnd,
                                            value: "-1",
                                            child: Text(
                                              'زبون',
                                              textDirection: TextDirection.rtl,
                                              style:
                                                  TextStyle(fontFamily: "Cairo"),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            alignment:
                                                AlignmentDirectional.bottomEnd,
                                            value: "1",
                                            child: Text(
                                              'صاحب متجر',
                                              textDirection: TextDirection.rtl,
                                              style:
                                                  TextStyle(fontFamily: "Cairo"),
                                            ),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          if (value == "1") {
                                            RegisterCubit.get(context).values = 1;
                                            RegisterCubit.get(context)
                                                .removeField();
                                          } else {
                                            RegisterCubit.get(context).values =
                                                -1;
                                            RegisterCubit.get(context)
                                                .removeField();
                                          }
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: constrain.maxHeight / 39,
                            ),
                            RegisterCubit.get(context).values == 1
                                ? const SizedBox()
                                : Text(
                                    "اسم المستخدم",
                                    style: TextStyle(
                                        fontSize: fontSize,
                                        color: grey,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Cairo"),
                                  ),
                            RegisterCubit.get(context).values == 1
                                ? const SizedBox()
                                : SizedBox(
                                    height: constrain.maxHeight / 73,
                                  ),
                            RegisterCubit.get(context).values == 1
                                ? const SizedBox()
                                : Filed(
                                    formKey: nameFormKey,
                                    onChange: (value) {
                                      nameFormKey.currentState!.validate();
                                    },
                                    controller: name,
                                    hintText: "أدخل اسم المستخدم",
                                    height: constrain.maxHeight,
                                    login: false),
                            RegisterCubit.get(context).values == 1
                                ? const SizedBox()
                                : SizedBox(
                                    height: constrain.maxHeight / 39,
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
                              height: constrain.maxHeight / 73,
                            ),
                            Filed(
                                formKey: phoneFromKey,
                                onChange: (value) {
                                  phoneFromKey.currentState!.validate();
                                },
                                controller: phoneNumber,
                                hintText: "أدخل رقم الهاتف",
                                height: constrain.maxHeight,
                                login: false),
                            SizedBox(
                              height: constrain.maxHeight / 39,
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
                              height: heightScreen / 73,
                            ),
                            Filed(
                                formKey: passwordFromKey,
                                onChange: (value) {
                                  passwordFromKey.currentState!.validate();
                                },
                                controller: password,
                                hintText: "أدخل 8 أحرف على الأقل",
                                height: constrain.maxHeight,
                                login: false),
                            SizedBox(
                              height: constrain.maxHeight / 30,
                            ),
                            ConditionalBuilder(
                                condition: state is! LoadingState,
                                builder: (context) => Bottom(
                                      text: "أنشئ حساب",
                                      height: constrain.maxHeight,
                                      onTap: onTap,
                                    ),
                                fallback: (context) => const Center(
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(primary),
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    );
                  }),
                );
              },
            )));
  }
}
