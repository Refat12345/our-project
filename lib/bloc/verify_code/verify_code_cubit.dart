import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled1/bloc/verify_code/verify_code_state.dart';



import '../../network/local/cache.dart';
import '../../network/remote/http.dart';


class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit() : super(InitState());

  static VerifyCodeCubit get(context) => BlocProvider.of(context);


  Future verifyCode({required code,required phone}) async
  {
    emit(CodeLoadingState());
    await HttpHelper.postData(url: 'verifyCode', data:
    {
      'code':code,
      'phone_number':phone
    }).then((value)
    async {
      var response=jsonDecode(value.body);
      String token=response['token'];
      await CacheHelper.saveData(key: 'token', value: token);
      emit(CodeSuccessState(token));
    }).catchError((onError)
    {
      print(onError.toString());
      emit(CodeErrorState());
    });
  }

}
