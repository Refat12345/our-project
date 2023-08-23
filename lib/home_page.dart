// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:onlytest/page/user/ProductScreen.dart';
// import 'package:onlytest/page/user/cart.dart';
// import 'package:onlytest/page/user/favourite.dart';
// import 'package:onlytest/page/user/storescreen.dart';
// import 'package:onlytest/page/userDelirey/orders.dart';
// import 'package:onlytest/theme/colors.dart';
//
// import 'bottomnavbar_cubit.dart';
// class HomePage extends StatelessWidget {
//   @override
//
//   Widget build(BuildContext context) {
//
//
//     List<Widget> screen =    [
//       StoreScreen(),
//       ProductScreen(),
//       FavouriteScreen(),
//       Orders('orders'),
//     ];
//
//     List<GButton> _tabs = const [
//       GButton(icon: Icons.home, text: 'الرئيسية',backgroundColor:green),
//       GButton(icon: Icons.shop_rounded, text: 'المنتجات',backgroundColor:green),
//       GButton(icon: Icons.favorite_outline, text: 'المفضلة',backgroundColor:green),
//       GButton(icon: Icons.shopping_cart, text: 'الطلبات',backgroundColor:green),
//     ];
//
//     return BlocProvider(
//       create: (BuildContext context) => BottomnavbarCubit()..soso(context)..intialstate(context),
//       child: BlocConsumer<BottomnavbarCubit, BottomnavbarState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           var navigationCubit = BottomnavbarCubit.get(context);
//           return Scaffold(
//             body: screen[navigationCubit.currentIndex],
//             bottomNavigationBar: Directionality(
//               textDirection: TextDirection.rtl,
//
//               child: LayoutBuilder(
//                 builder: (context, constraints) {
//                   if (constraints.maxWidth < 600) {
//                     // Small screen layout
//                     return Container(
//                       height: MediaQuery.of(context).size.height * 0.08,
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 20,
//                             color: Colors.black.withOpacity(0.1),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01,),
//                         child: GNav(
//                           gap: 5,
//                           activeColor: Colors.white,
//                           iconSize: MediaQuery.of(context).size.width * 0.05,
//                           padding: EdgeInsets.symmetric(
//                             horizontal: MediaQuery.of(context).size.width * 0.05,
//                             vertical: MediaQuery.of(context).size.height * 0.01,
//                           ),
//                           duration: Duration(milliseconds: 500),
//                           tabBackgroundColor: Colors.blue,
//                           color: Colors.grey[700],
//                           tabs: _tabs,
//                           selectedIndex: navigationCubit.currentIndex,
//                           onTabChange: (newindex) {
//                             navigationCubit.changeBottomNavBar(newindex);
//                           },
//                         ),
//                       ),
//                     );
//                   } else {
//                     // Large screen layout
//                     return Container(
//                       height: MediaQuery.of(context).size.height * 0.1,
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 20,
//                             color: Colors.black.withOpacity(0.1),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: MediaQuery.of(context).size.width * 0.1,
//                           vertical: MediaQuery.of(context).size.height * 0.02,
//                         ),
//                         child: GNav(
//                           gap: 10,
//                           activeColor: Colors.white,
//                           iconSize: 24,
//                           padding: EdgeInsets.symmetric(
//                             horizontal: MediaQuery.of(context).size.width * 0.05,
//                             vertical: MediaQuery.of(context).size.height * 0.02,
//                           ),
//                           duration: Duration(milliseconds: 500),
//                           tabBackgroundColor: Colors.blue,
//                           color: Colors.grey[700],
//                           tabs: _tabs,
//                           selectedIndex: navigationCubit.currentIndex,
//                           onTabChange: (newindex) {
//                             navigationCubit.changeBottomNavBar(newindex);
//                           },
//                         ),
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
//

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:onlytest/page/login.dart';
import 'package:onlytest/page/user/ProductScreen.dart';
import 'package:onlytest/page/user/favourite.dart';
import 'package:onlytest/page/user/storescreen.dart';
import 'package:onlytest/page/userDelirey/orders.dart';
import 'package:onlytest/theme/colors.dart';


import 'bloc/account/delete/delete_cubit.dart';
import 'bloc/account/delete/delete_state.dart';
import 'bloc/account/logout/logout_cubit.dart';
import 'bloc/account/logout/logout_state.dart';
import 'bottomnavbar_cubit.dart';
import 'component/helper.dart';
import 'network/local/cache.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override

  Widget build(BuildContext context) {

    List<Widget> screen =    [
      StorePage(),
      const ProductScreen(),
      const FavouriteScreen(),
      Orders('orders'),
    ];

    List<GButton> _tabs = const [
      GButton(icon: Icons.home, text: 'الرئيسية',backgroundColor:green),
      GButton(icon: Icons.shop_rounded, text: 'المنتجات',backgroundColor:green),
      GButton(icon: Icons.favorite_outline, text: 'المفضلة',backgroundColor:green),
      GButton(icon: Icons.shopping_cart, text: 'الطلبات',backgroundColor:green),
    ];

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => BottomnavbarCubit()..soso(context)..intialstate(context),
      child: BlocConsumer<BottomnavbarCubit, BottomnavbarState>(
        listener: (context, state) {},
        builder: (context, state) {
          var navigationCubit = BottomnavbarCubit.get(context);
          return Scaffold(
            drawer: Directionality(
              textDirection: TextDirection.rtl,
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: const BoxDecoration(
                        color: primary,
                      ),
                      child: SizedBox(
                        height: height*0.3,
                        width: width*0.2,
                        child: getSvgIcon('welcome3.svg'),
                      ),
                    ),
                    BlocProvider(
                        create: (context)=>LogOutCubit(),
                        child:BlocConsumer<LogOutCubit,LogOutState>
                          (
                          listener: (context,state){
                            if(state is LogOutSuccessState)
                            {
                              CacheHelper.removeData(key: 'token');
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()), (route) => false);
                            }
                          },
                          builder: (context,state)
                          {
                            return  ConditionalBuilder(
                                condition: state is !LogOutLoadingState,
                                builder: (context)=>ListTile(
                                  leading:  Icon(Icons.logout_outlined,color: green,size: height*0.022+width*0.015,),
                                  title:  Text('تسجيل الخروج',style: TextStyle(fontFamily: "Cairo",fontSize:height*0.015+width*0.01,fontWeight: FontWeight.w700 ),),
                                  onTap: () {
                                    LogOutCubit.get(context).logout();
                                  },
                                ),
                                fallback: (context)=>const Center(child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(green),
                                ),)
                            );
                          },
                        )
                    ),
                    BlocProvider(
                        create: (context)=>DeleteAccountCubit(),
                        child:BlocConsumer<DeleteAccountCubit,DeleteAccountState>
                          (
                          listener: (context,state){
                            if(state is DeleteSuccessState)
                            {
                              CacheHelper.removeData(key: 'token');
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()), (route) => false);
                            }
                          },
                          builder: (context,state)
                          {
                            return  ConditionalBuilder(
                                condition: state is !DeleteLoadingState,
                                builder: (context)=>ListTile(
                                  leading:  Icon(Icons.delete_outline_outlined,color: green,size: height*0.022+width*0.015,),
                                  title:  Text('حذف الحساب',style: TextStyle(fontFamily: "Cairo",fontSize:height*0.015+width*0.01,fontWeight: FontWeight.w700 ),),
                                  onTap: () {
                                    DeleteAccountCubit.get(context).deleteAccount();
                                  },
                                ),
                                fallback: (context)=>const Center(child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(green),
                                ),)
                            );
                          },
                        )
                    ),
                    // إضافة قائمة العناصر الأخرى هنا
                  ],
                ),
              ),
            ),
            body: screen[navigationCubit.currentIndex],
            bottomNavigationBar: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  // Small screen layout
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01,),
                        child: GNav(
                          gap: 5,
                          activeColor: Colors.white,
                          iconSize: MediaQuery.of(context).size.width * 0.05,
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.05,
                            vertical: MediaQuery.of(context).size.height * 0.01,
                          ),
                          duration: Duration(milliseconds: 500),
                          tabBackgroundColor: Colors.blue,
                          color: Colors.grey[700],
                          tabs: _tabs,
                          selectedIndex: navigationCubit.currentIndex,
                          onTabChange: (newindex) {
                            navigationCubit.changeBottomNavBar(newindex);
                          },
                        ),
                      ),
                    ),
                  );
                } else {
                  // Large screen layout
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: GNav(
                        gap: 10,
                        activeColor: Colors.white,
                        iconSize: 24,
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.02,
                        ),
                        duration: Duration(milliseconds: 500),
                        tabBackgroundColor: Colors.blue,
                        color: Colors.grey[700],
                        tabs: _tabs,
                        selectedIndex: navigationCubit.currentIndex,
                        onTabChange: (newindex) {
                          navigationCubit.changeBottomNavBar(newindex);
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}






