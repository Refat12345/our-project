import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/cart/cart_model.dart';
import '../../model/changefaovouritemodel.dart';
import '../../model/getcategory.dart';
import '../../model/getstoremodel.dart';
import '../../model/getvendorshop.dart';
import '../../model/shopfav.dart';
import '../../network/remote/http.dart';
part 'getstore_state.dart';

class GetstoreCubit extends Cubit<GetstoreState> {
  GetstoreCubit() : super(GetstoreInitial());

  static GetstoreCubit get(context) => BlocProvider.of(context);
  GetStoreModel? getStoreModel ;
  Categorymodel? getCategorymodel;
  GetVendorShopModel? getVendorShopModel;

  Map<dynamic,dynamic> favourites = {};
  ChangeFavoritesModel? changeFavoritesModel;
  getfavuritestoremodel? Getfavmodel;

  CartModel? cartModel;
  int? num ;








  void getCart()  {
    emit(GetCartLoadingState());
     HttpHelper.getData(url: 'viewCart').then((value) {
      if (value.statusCode == 200) {
        cartModel =  CartModel.fromJson(jsonDecode(value.body));
        if(cartModel?.message!=null){

          num = 0 ;
        }
        else
          {
            num = cartModel?.cartItems?.length;
          }

        emit(GetCartSuccessState());

      }
    }).catchError((onError) {
      emit(GetCartErrorState());
      print(onError.toString());
    });
  }


  void getstorebycategory({required id}) {
  getStoreModel=null;
  emit(Loadingstate());
  HttpHelper.getData(
  url: "getShopsByCategory/${id}",)

      .then((value) {



  getStoreModel = GetStoreModel.fromJson(jsonDecode(value.body));

  getStoreModel?.shopsData?.forEach((element) {

    favourites.addAll({

      element.id:element.inFavorite,

    });
  });

  emit(SuccessState());
  }).catchError((onError) {
  print(onError.toString());
  emit(ErrorState());
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
      url: "addShopToFavorite/${id}", data: null,)
        .then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(jsonDecode(value.body));
      emit(SuccesschangefavouriteState(changeFavoritesModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorchangefavouriteState());
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



  void getstorefav() {
    emit(getfavshopLoadingstate());
    HttpHelper.getData(
      url: "getFavoriteShops",)

        .then((value) {

      Getfavmodel = getfavuritestoremodel.fromJson(jsonDecode(value.body));






      emit(getfavshopSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(getfavshopErrorState());
    });
  }

  int id=2;
  void changeId()
  {
    id=3;
    emit(StateBloc());
  }




}
