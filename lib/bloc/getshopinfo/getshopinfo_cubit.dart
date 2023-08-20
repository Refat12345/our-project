import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/getshopinfo.dart';

import '../../network/remote/http.dart';
part 'getshopinfo_state.dart';


class GetshopinfoCubit extends Cubit<GetshopinfoState> {


  GetshopinfoCubit() : super(GetshopinfoInitial());
  static GetshopinfoCubit get(context) => BlocProvider.of(context);
  getshopinfomodel? Getshopinfomodel ;


  void getshopinfo({required id}) {
    emit(Loadingstate());
    HttpHelper.getData(
      url: "getshopinfo/${id}",)

        .then((value) {


      Getshopinfomodel = getshopinfomodel.fromJson(jsonDecode(value.body));



      emit(SuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState());
    });
  }

}
