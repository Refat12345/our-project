import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:onlytest/page/user/favourite.dart';
import 'package:onlytest/page/user/searchproduct.dart';


part 'bottomnavbar_state.dart';

class BottomnavbarCubit extends Cubit<BottomnavbarState> {
  BottomnavbarCubit() : super(BottomnavbarInitial());

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



  int currentIndex = 0;

  static BottomnavbarCubit get(context) => BlocProvider.of(context);

  void changeBottomNavBar(index) {
    currentIndex = index;
    emit(Bottomnav());
  }
}
