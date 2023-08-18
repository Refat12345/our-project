import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../model/addstore.dart';
import '../../network/endpoint.dart';
import '../../network/local/cache.dart';
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

  addproductmodel? Addmodel ;


  void addstore({
    required  name,
    required  description,
    required  phonenumber,
    required   city,
    var category_id,


  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${URL}/addShopWithLocation'),
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
    request.fields['latitude'] = '33.5138';
    request.fields['longitude'] = '33.5138';
    request.fields['category_id'] = category_id.toString();
    if (addImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath('photo', addImage!.path),
      );
    }

    try {
      var response = await request.send();
      var body = request.fields.values;
      print(body);
      if (response.statusCode == 200) {
        print('soso');
        response.stream.transform(utf8.decoder).listen((value) {
          Addmodel = addproductmodel.fromJson(jsonDecode(value));
          print(Addmodel?.message);

          emit(SuccessState(Addmodel!));
        });




      } else {
        print(response.statusCode);
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
