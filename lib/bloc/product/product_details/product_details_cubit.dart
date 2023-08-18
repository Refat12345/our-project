import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/product/product_details/product_details_state.dart';

import 'package:untitled1/network/remote/http.dart';

import '../../../model/product_details/product_details.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(InitialState());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  ProductDetailsModel? productDetailsModel;
  int quantity=0;

  Future getProductDetails({required id}) async{
    emit(LoadingState());
   await HttpHelper.getData(url: 'getProductInfo/$id').then((value) {
     print('object');
      productDetailsModel =
          ProductDetailsModel.fromJson(jsonDecode(value.body));
      quantity=productDetailsModel!.productInfo!.quantity!;
      emit(SuccessState(productDetailsModel!));
    }).catchError((onError) {
      print(onError.toString());
    }
    );
  }

  int count = 1;

  void changeCount(String type) {
    type == 'add' ? count++ : count--;
    emit(CountState());
  }
 void isFavorite(favorite)
 {
   if(favorite==0)
   {

   }
 }
}

