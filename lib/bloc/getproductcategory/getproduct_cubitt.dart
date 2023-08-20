import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/changefaovouritemodel.dart';
import '../../model/getcategory.dart';
import '../../model/getfavouritemodell.dart';
import '../../model/getproductbycategorymodel.dart';
import '../../network/remote/http.dart';

part 'getproduct_statee.dart';

class GetproductCubitt extends Cubit<GetproductStatee> {
  GetproductCubitt() : super(GetproductInitial());

  static GetproductCubitt get(context) => BlocProvider.of(context);
  getproductbycategorymodel? getProductModel ;
  Categorymodel? getCategorymodel;
  Map<dynamic,dynamic> favourites = {};
  ChangeFavoritesModel? changeFavoritesModel;
  getfavouritemodel? Getfavouritemodel;

  void getcategoryy() {
    emit(getcategoryyLoadingstate());
    HttpHelper.getData(
      url: "getAllCategories",)

        .then((value) {

      getCategorymodel = Categorymodel.fromJson(jsonDecode(value.body));

      emit(getcategoryySuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(getcategoryyErrorState());
    });
  }
  void getproductcategory({required id}) {
    emit(getproductcategoryLoadingstate());
    HttpHelper.getData(
      url: "getProductsByCategory/${id}",)

        .then((value) {



      getProductModel = getproductbycategorymodel.fromJson(jsonDecode(value.body));

      getProductModel?.productsData?.forEach((element) {

        favourites.addAll({

          element.id:element.inFavorite,

        });
      });



      emit(getproductcategorySuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(getproductcategoryErrorState());
    });
  }



  void changefavourite({required id}) {
    if(favourites[id]==1)
      favourites[id]=0;
    else{
      favourites[id] = 1 ;
    }
    emit(changefavouriteState());

    HttpHelper.postData(
      url: "addProductToFavorite/${id}", data: null,)

        .then((value) {

      changeFavoritesModel = ChangeFavoritesModel.fromJson(jsonDecode(value.body));





      emit(SuccesschangefavouriteState(changeFavoritesModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorchangefavouriteState());
    });
  }

  void getallfavourite(  ) {
    emit(getallfavouriteLoadingstate());
    HttpHelper.getData(
      url: "getFavoriteProducts",)

        .then((value) {


      Getfavouritemodel = getfavouritemodel.fromJson(jsonDecode(value.body));


      emit(getallfavouriteSuccessState(Getfavouritemodel));
    }).catchError((onError) {
      print(onError.toString());
      emit(getallfavouriteErrorState());
    });
  }

}
