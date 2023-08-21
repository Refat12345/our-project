import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/register/register_state.dart';


import '../../model/register/register_model.dart';
import '../../network/local/cache.dart';
import '../../network/remote/http.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  int values = -1;

  RegisterModel? registerModel;

  Future register({required phoneNumber, required name, required password}) async{
    values == -1

        ? CacheHelper.saveData(key: 'type', value: 'customer')
        : CacheHelper.saveData(key: 'type', value: 'vendor');
    emit(LoadingState());
   await HttpHelper.postData(url: 'signup', data: {
      'type': values == -1 ? 'customer' : 'vendor',
      'name': name,
      'phone_number': phoneNumber,
      'password': password
    }).then((value)async {

    if(value.statusCode==200)
    {
      registerModel = RegisterModel.fromJson(jsonDecode(value.body));
      await  CacheHelper.saveData(key: 'token', value: registerModel!.token);
    }else
    {
      var response=jsonDecode(value.body);
      registerModel!.message=response['message'];
    }
      emit(SuccessState(registerModel!));
    }).catchError((onError) {
      emit(ErrorState());
      print(onError.toString());
    });
  }


  void removeField()
  {
    emit(RemoveField());
  }
}
