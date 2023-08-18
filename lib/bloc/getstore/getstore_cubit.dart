import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/getcategory.dart';
import '../../model/getstoremodel.dart';
import '../../model/getvendorshop.dart';
import '../../network/endpoint.dart';
import '../../network/remote/http.dart';

part 'getstore_state.dart';

class GetstoreCubit extends Cubit<GetstoreState> {
  GetstoreCubit() : super(GetstoreInitial());

  static GetstoreCubit get(context) => BlocProvider.of(context);
  GetStoreModel? getStoreModel ;
  Categorymodel? getCategorymodel;
  GetVendorShopModel? getVendorShopModel;



  void getstorebycategory({required id}) {
    emit(Loadingstate());
    HttpHelper.getData(
            url: "getShopsByCategory/${id}",)

        .then((value) {



            getStoreModel = GetStoreModel.fromJson(jsonDecode(value.body));



      emit(SuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState());
    });
  }

  void getcategory() {
    emit(Loadingstate());
    HttpHelper.getData(
      url: "getAllCategories",)

        .then((value) {

      getCategorymodel = Categorymodel.fromJson(jsonDecode(value.body));

      emit(SuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState());
    });
  }

  void getvendorshop() {
    emit(Loadingstate());
    HttpHelper.getData(
      url: "getVendorShops",)
        .then((value) {
      getVendorShopModel = GetVendorShopModel.fromJson(jsonDecode(value.body));
      emit(SuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState());
    });
  }




}
