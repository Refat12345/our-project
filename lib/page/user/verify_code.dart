import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/verify_code/verify_code_cubit.dart';
import 'package:untitled1/home_page.dart';
import '../../bloc/verify_code/verify_code_state.dart';
import '../../component/helper.dart';
import '../../component/widget.dart';
import '../../network/local/cache.dart';
import '../login.dart';

class VerifyCode extends StatelessWidget {
  VerifyCode(this.phoneNumber, {super.key});

  String phoneNumber;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => VerifyCodeCubit(),
      child: BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
        listener: (context, state) {
          if (state is CodeSuccessState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false);
          }
        },
        builder: (context, state) {
          TextEditingController pinController = TextEditingController();
          return LayoutBuilder(builder: (context, constrain) {
            VerifyCodeCubit verifyCodeCubit = VerifyCodeCubit.get(context);
            return AlertDialog(
              actions: [
                Center(
                    child: PinCode(
                  bottom: ConditionalBuilder(
                      condition: state is! CodeLoadingState,
                      builder: (context) => Bottom(
                            text: "ارسال الرمز",
                            onTap: () {
                              if (pinController.text.length < 4) {
                                flutterToastt("من فضلك قم بتعبئة كامل الحقول",
                                    "error", constrain.maxHeight, "pin");
                              } else {
                                if (CacheHelper.getData(key: 'type') ==
                                    "customer") {
                                  verifyCodeCubit.verifyCode(
                                      code: pinController.text,
                                      phone: phoneNumber);
                                } else {
                                  flutterToastt("طلبك قيد المعالجة", "type",
                                      constrain.maxHeight, "notPin");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                }
                              }
                            },
                            height: constrain.maxHeight,
                          ),
                      fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          )),
                  controller: pinController,
                  pinLength: 4,
                  maxHeight: constrain.maxHeight,
                  maxWidth: constrain.maxWidth,
                  phoneNumber: phoneNumber,
                )),
              ],
            );
          });
        },
      ),
    );
  }
}
