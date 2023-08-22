import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/orders/orders.dart';
import '../../network/local/cache.dart';
import '../../network/remote/http.dart';
import '../../page/user/favourite.dart';
import '../../page/user/searchproduct.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState>
{

  OrdersCubit():super(InitialState());






  static OrdersCubit get(context)=>BlocProvider.of(context);

  intialstate(BuildContext context) async{




    FirebaseMessaging.onMessage.listen((event) {
      AwesomeDialog(context: context,title:'title',body: Text("${event.notification?.body}"))..show();


    });



    var message = await FirebaseMessaging.instance.getInitialMessage();

    if(message!=null){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FavouriteScreen()));
    }


  }




  void soso(BuildContext context){
    FirebaseMessaging.onMessageOpenedApp.listen((event) {

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchProduct()));
    });
  }
  
  OrdersModel ? ordersModel;

  Future getHistoryOrders() async
  {
    emit(LoadingState());
    await HttpHelper.getData(url: CacheHelper.getData(key: 'type')=="customer"?"viewCustomerOrders":"viewApprovedOrdersToDelivery").then((value)
    {
      if(value.statusCode==200)
      {
        ordersModel=OrdersModel.fromJson(jsonDecode(value.body));
        emit(SuccessState());
      }
    }).catchError((onError)
    {
      print(onError.toString());
      emit(ErrorState());
    });
    
  }

  Future getApprovedOrders() async
  {
    emit(LoadingState());
    await HttpHelper.getData(url:'viewDeliveryOrders').then((value)
    {
      if(value.statusCode==200)
      {
        ordersModel=OrdersModel.fromJson(jsonDecode(value.body));
        emit(SuccessState());
      }
    }).catchError((onError)
    {
      print(onError.toString());
      emit(ErrorState());
    });

  }


  void deleteOrder({required id})
  {
    ordersModel!.ordersInfo!.removeWhere((element) => element.id==id);
    emit(DeleteSuccess());
  }
  

}