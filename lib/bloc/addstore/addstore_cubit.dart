import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import '../../model/addstore.dart';
import '../../model/getcategory.dart';
import '../../network/endpoint.dart';
import '../../network/local/cache.dart';
import '../../network/remote/http.dart';
import 'addstore_state.dart';
import 'package:http/http.dart' as http ;
import 'package:image_picker/image_picker.dart';


class AddstoreCubit extends Cubit<AddstoreState> {
  AddstoreCubit() : super(AddstoreInitial());
  static AddstoreCubit get(context) => BlocProvider.of(context);
  var selectitem;
  var  items = [
    'food',
    'electric',
  ];
  Categorymodel? getCategorymodel;




  void getcategory() {
    emit(loading());
    HttpHelper.getData(
      url: "getAllCategories",)

        .then((value) {
      var responseData = jsonDecode(value.body);
      var categoryList = responseData['categories'] as List<dynamic>;
      var  categories = categoryList
          .map((category) => Categories.fromJson(category))
          .toList();
      items = categories.map((category) => category.name!).toList();

      getCategorymodel = Categorymodel.fromJson(jsonDecode(value.body));


      emit(sucess());
    }).catchError((onError) {
      print(onError.toString());
      emit(error());
    });
  }


  var catid = 0;

  void prints(){
    print(selectitem);
    print(getCategorymodel!.categories?[1].name);
    Categories categoriess=getCategorymodel!.categories!.firstWhere((element) => element.name==selectitem);
    catid = categoriess.id!;

    print("id is ${categoriess.id}");


  }
  addproductmodel? Addmodel ;


  void addstore({
    required  name,
    required  description,
    required  phonenumber,
    required   city,
    required longitude,
    required latitude,
    var category_id,


  }) async {

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$URL/addShopWithLocation'),
    );
    request.headers['Authorization'] = 'Bearer ${CacheHelper.getData(key: 'token')}';
    if(selectitem == 'food '){
      category_id = 1 ;
    }
    else category_id  =2;

    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['phone_number'] = phonenumber;
    request.fields['city'] = city;
    request.fields['latitude'] = '$latitude';
    request.fields['longitude'] = '$longitude';
    request.fields['category_id'] = catid.toString();
    if (addImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath('photo', addImage!.path),
      );
    }

    try {
      var response = await request.send();
      var body = request.fields.values;
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).listen((value) {
          Addmodel = addproductmodel.fromJson(jsonDecode(value));

          emit(SuccessState(Addmodel!));
        });




      } else {

      }
    } catch (error) {
    }
  }





  void changeitemselected (value) {
    selectitem = value;
    emit(droplist());
  }


  File ?addImage;
  var addPicker = ImagePicker();
  Future getImage ()async
  {

    final pikedFile=await addPicker.pickImage(source:ImageSource.gallery);
    if(pikedFile !=null)
    {
      addImage=File(pikedFile.path);
      emit(ImageSuccess());
    }
    else
    {
      emit(ImageError());
    }
  }
}
