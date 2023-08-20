


import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/remote/http.dart';
import 'confirm_cart_with_same_location_state.dart';


class ConfirmCartWithSameLocationCubit extends Cubit<ConfirmCartWithSameLocationState>
{

  ConfirmCartWithSameLocationCubit():super(InitState());

  static ConfirmCartWithSameLocationCubit get(context)=>BlocProvider.of(context);

  Future confirmCart() async{

    emit(LoadingState());
    await HttpHelper.putData(url: 'confirmsCart', data: {'notes': "not found"})
        .then((value) {
      var response = jsonDecode(value.body);
      String message = response['message'];

      emit(SuccessState(message));
    }).catchError((onError) {
      emit(ErrorState());
      print(onError.toString());
    });
  }
}