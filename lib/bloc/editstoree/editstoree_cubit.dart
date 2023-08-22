import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http ;
import 'dart:io';

import '../../model/addstore.dart';
import '../../model/getshopinfo.dart';
import '../../network/endpoint.dart';
import '../../network/local/cache.dart';
import '../../network/remote/http.dart';

part 'editstoree_state.dart';

class EditstoreeCubit extends Cubit<EditstoreeState> {
  EditstoreeCubit() : super(EditstoreeInitial());

  addproductmodel? Addmodel ;
  static EditstoreeCubit get(context) => BlocProvider.of(context);


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


  void editstore({
    required  name,
    required  description,
    required  phonenumber,
    required   city,
    required shopid,


  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${URL}/updateShopWithLocation'),
    );


    request.headers['Authorization'] = 'Bearer ${CacheHelper.getData(key: 'token')}';


    request.fields['shop_id'] = shopid.toString();
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['phone_number'] = phonenumber;
    request.fields['city'] = city;
    request.fields['latitude'] = '33.5138';
    request.fields['longitude'] = '33.5138';
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
          print(Addmodel?.message);
          emit(EditstoreSuccessState(Addmodel!));
        });




      } else {

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
      emit(EditstoreImageSuccess());
    }
    else
    {
      emit(EditstoreImageError());
    }
  }
}
