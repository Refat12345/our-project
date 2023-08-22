import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../model/login/login_model.dart';
import '../../network/remote/http.dart';
import '../../theme/colors.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);



  var fbm = FirebaseMessaging.instance;
  var k;
  void getdevicetoken() {
    fbm.getToken().then((value) {
      print('=========================================');
      print('token is ');
      k = value;
      print(value);
      print('=========================================');

    }
    );
  }

  LoginModel? loginModel;

  void login({required phoneNumber, required password}) {
    emit(LoadingState());
    HttpHelper.postData(
            url: "login",
            data: {"phone_number": phoneNumber, "password": password,"device_token":k}

    )
        .then((value) {
      loginModel = LoginModel.fromJson(jsonDecode(value.body));

      emit(SuccessState(loginModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState());
    });
  }

  bool password = false;
  Icon passwordICon = const Icon(
    Icons.visibility_off_outlined,
    color: primary,
  );

  void changeIcons(height) {
    password = !password;
    passwordICon = password
        ? Icon(
            Icons.visibility_outlined,
            size: height*0.03,
            color: primary,
          )
        : Icon(
            Icons.visibility_off_outlined,
            size: height*0.03,
            color: primary,
          );
    emit(PasswordState());
  }
}
