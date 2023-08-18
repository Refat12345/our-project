import 'dart:convert';
import 'package:http/http.dart' as http ;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../model/addstore.dart';
import '../../model/changefaovouritemodel.dart';
import '../../model/getproductbyshop.dart';
import '../../network/endpoint.dart';
import '../../network/local/cache.dart';
import '../../network/remote/http.dart';

part 'getproduct_state.dart';

class GetproductCubit extends Cubit<GetproductState> {
  GetproductCubit() : super(GetproductInitial());

  static GetproductCubit get(context) => BlocProvider.of(context);
  getproductmodel? getProductmodel ;

  Map<dynamic,dynamic> favourites = {};
  ChangeFavoritesModel? changeFavoritesModel;

  addproductmodel? Addmodel ;




  void open_closeshop({required id}) {
    emit(Open_CloseLoadingstate());

    HttpHelper.postData(
      url: "open_closeShop", data: {"shop_id":id.toString()},


    )
        .then((value) {
          print(value.body);

      Addmodel = addproductmodel.fromJson(jsonDecode(value.body));


      emit(Open_CloseSuccessState(Addmodel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(Open_CloseErrorState());
    });
  }












  void getproductbyshopid({required id,name,price,photo,shopid}) {
    emit(Loadingstate());

    HttpHelper.getData(
      url: "getProductsByShop/${id}",)
        .then((value) {

      getProductmodel = getproductmodel.fromJson(jsonDecode(value.body));



      getProductmodel?.productsData?.forEach((element) {

        favourites.addAll({

          element.id:element.inFavorite,

        });
      });


      emit(SuccessState(getProductmodel));
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


  void addproduct({
    required  name,
    required  description,
    required  price,
    required  weight,
    required  quantity,
    required  brand_name,
    required shopid,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${URL}/addProduct'),
    );
    request.headers['Authorization'] = 'Bearer ${CacheHelper.getData(key: 'token')}';

    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['price'] = price;
    request.fields['weight'] = weight;
    request.fields['quantity'] = quantity;
    request.fields['brand_name'] = brand_name;
    request.fields['shop_id'] = shopid.toString();
    request.fields['colors[0]'] = 'Black';

    if (addImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath('photos[0]', addImage!.path),
      );
    }

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        print(response.statusCode);

        response.stream.transform(utf8.decoder).listen((value) {
          Addmodel = addproductmodel.fromJson(jsonDecode(value));
          print(Addmodel?.message);

          emit(AddProductSuccessState(Addmodel!));
        });

      } else {
        print(response.statusCode);
      }
    } catch (error) {
    }
  }



  File ?addImage;
  var addPicker = ImagePicker();
  Future getImage ()async
  {

    final pikedFile=await addPicker.pickImage(source:ImageSource.gallery);
    if(pikedFile !=null)
    {
      addImage=File(pikedFile.path);
      emit(AddProductImageSuccess());
    }
    else
    {
      emit(AddProductImageError());
    }
  }



}
