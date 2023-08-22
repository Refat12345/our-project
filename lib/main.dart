//
//
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onlytest/page/login.dart';
import 'package:onlytest/page/vendor/getvendorshop.dart';

import 'bloc/localization/locale_state.dart';
import 'network/local/cache.dart';
import 'page/vendor/addproduct.dart';
import 'app_localizations.dart';
import 'bloc/localization/locale_cubit.dart';
import 'home_page.dart';
import 'package:device_preview/device_preview.dart';

String? type = CacheHelper.getData(key: 'type');
String? token = CacheHelper.getData(key: 'token');

  Future<void> backgroundMessageHandler( RemoteMessage message) async {
  print("back grounddddddddddddd");
  print("Handling a background message: ${message.notification?.body}");
}






void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler );
   await CacheHelper.init();
  runApp(  MyApp());
}






class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return MaterialApp(


      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // supportedLocales: const [Locale('en'), Locale('ar')],
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate
      // ],
      // localeResolutionCallback: (deviceLocale, supportedLocales) {
      //   for (var locale in supportedLocales) {
      //     if (deviceLocale != null &&
      //         deviceLocale.languageCode == locale.languageCode) {
      //       return deviceLocale;
      //     }
      //   }
      //
      //   return supportedLocales.first;
      // },

      debugShowCheckedModeBanner: false,
      home:  Login(),
    );
  }
}
//AIzaSyBuHMCxbDKEXcarikZam3JYeXHjCKfQIRc

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:project2/page/login.dart';
// import 'package:project2/page/vendor/getvendorshop.dart';
// import 'bloc/localization/locale_state.dart';
// import 'network/local/cache.dart';
// import 'page/vendor/addproduct.dart';
// import 'app_localizations.dart';
// import 'bloc/localization/locale_cubit.dart';
// import 'home_page.dart';
// import 'package:device_preview/device_preview.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await CacheHelper.init();
//
//   String? token = CacheHelper.getData(key: 'token');
//   String? type = CacheHelper.getData(key: 'type');
//
//   Widget widget;
//   if(token != null){
//     if(type == 'customer')
//       widget = HomePage();
//     else
//       widget = GetVendorShop();
//   }
//   else{
//     widget = Login();
//   }
//
//
//   runApp(  MyApp(startwidget: widget,));
//
//   // runApp (
//   //     DevicePreview(
//   //
//   //         enabled: !kReleaseMode,
//   //         builder: (context)=>MyApp(startwidget: HomePage(),)));
//
// }
//
// class MyApp extends StatelessWidget {
//   late final Widget startwidget ;
//   MyApp({
//     required this.startwidget
//
//   });
//   @override
//   Widget build(BuildContext context) {
//         return Directionality(
//           textDirection: TextDirection.rtl,
//
//           child: MaterialApp(
//             debugShowCheckedModeBanner: false,
//             home:  Login(),
//           ),
//         );
//   }
// }
