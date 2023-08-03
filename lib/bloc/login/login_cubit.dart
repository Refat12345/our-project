import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/colors.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

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
            size: height / 26,
            color: primary,
          )
        : Icon(
            Icons.visibility_off_outlined,
            size: height / 26,
            color: primary,
          );
    emit(PasswordState());
  }
}
