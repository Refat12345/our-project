import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/orders/orders_state.dart';
import 'package:untitled1/network/local/cache.dart';
import '../../model/orders/orders.dart';
import '../../network/remote/http.dart';

class OrdersCubit extends Cubit<OrdersState>
{

  OrdersCubit():super(InitialState());

  static OrdersCubit get(context)=>BlocProvider.of(context);
  
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