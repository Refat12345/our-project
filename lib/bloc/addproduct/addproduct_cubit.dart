// import 'dart:convert';
// import 'dart:io';
// import 'package:dio/dio.dart';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http ;
// import 'package:meta/meta.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../model/addstore.dart';
// import '../../network/endpoint.dart';
// import '../../network/local/cache.dart';
// import '../../network/remote/http.dart';
// part 'addproduct_state.dart';
//
// class AddproductCubit extends Cubit<AddproductState> {
//   AddproductCubit() : super(AddproductInitial());
//   static AddproductCubit get(context) => BlocProvider.of(context);
//
//
//   addproductmodel? Addmodel ;
//
//   void addproduct({
//     required  name,
//     required  description,
//     required  price,
//     required  weight,
//     required  quantity,
//     required  brand_name,
//     required shopid,
//   }) async {
//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse('${url}/addProduct'),
//     );
//     request.headers['Authorization'] = 'Bearer ${CacheHelper.getData(key: 'token')}';
//
//     request.fields['name'] = name;
//     request.fields['description'] = description;
//     request.fields['price'] = price;
//     request.fields['weight'] = weight;
//     request.fields['quantity'] = quantity;
//     request.fields['brand_name'] = brand_name;
//     request.fields['shop_id'] = shopid.toString();
//     request.fields['colors[0]'] = 'Black';
//
//     if (addImage != null) {
//       request.files.add(
//         await http.MultipartFile.fromPath('photos[0]', addImage!.path),
//       );
//     }
//
//     try {
//       var response = await request.send();
//       if (response.statusCode == 200) {
//         print(response.statusCode);
//
//         response.stream.transform(utf8.decoder).listen((value) {
//           Addmodel = addproductmodel.fromJson(jsonDecode(value));
//           print(Addmodel?.message);
//
//           emit(SuccessState(Addmodel!));
//         });
//
//         // تمت إضافة المنتج بنجاح
//       } else {
//         print(response.statusCode);
//         // حدث خطأ أثناء إضافة المنتج
//       }
//     } catch (error) {
//       // حدث خطأ أثناء الاتصال بالسيرفر
//     }
//   }
//
//
//
//   File ?addImage;
//   var addPicker = ImagePicker();
//   Future getImage ()async
//   {
//
//     final pikedFile=await addPicker.pickImage(source:ImageSource.gallery);
//     if(pikedFile !=null)
//     {
//       addImage=File(pikedFile.path);
//       emit(ImageSuccess());
//     }
//     else
//     {
//       emit(ImageError());
//     }
//   }
//
//
//
//
//
// }
