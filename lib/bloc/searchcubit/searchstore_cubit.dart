import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../model/changefaovouritemodel.dart';
import '../../model/searchproductmodel.dart';
import '../../model/searchstoremodel.dart';
import '../../network/endpoint.dart';
import '../../network/remote/http.dart';

part 'searchstore_state.dart';

class SearchstoreCubit extends Cubit<SearchstoreState> {
  SearchstoreCubit() : super(SearchstoreInitial());

  static SearchstoreCubit get(context) => BlocProvider.of(context);

  searchstoremodel? Searchmodel ;
  searchproductmodel? Searchproductmodel;

  ChangeFavoritesModel? changeFavoritesModel;

  Map<dynamic,dynamic> favourites = {};


  void searchbychar({required text}) {
    emit(Loadingstate());
    HttpHelper.getData(
      url: "searchShop/${text}", )

        .then((value) {
      Searchmodel = searchstoremodel.fromJson(jsonDecode(value.body));
      print(Searchmodel!.shopsData?.length);
      emit(SuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState());
    });
  }






  void searchproduct({required text}) {
    emit(searchproductLoadingstate());
    HttpHelper.getData(
      url: "searchproduct/${text}", )

        .then((value) {
      Searchproductmodel = searchproductmodel.fromJson(jsonDecode(value.body));

      Searchproductmodel?.productsData?.forEach((element) {

        favourites.addAll({

          element.id:element.inFavorite,

        });
      });

      emit(searchproductSuccessState());

    }).catchError((onError) {
      print(onError.toString());
      emit(searchproductErrorState());
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
      print(changeFavoritesModel?.message);





      emit(SuccesschangefavouriteState(changeFavoritesModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorchangefavouriteState());
    });
  }


}
