import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:onlytest/page/user/ProductScreen.dart';
import 'package:onlytest/page/user/cart.dart';
import 'package:onlytest/page/user/favourite.dart';
import 'package:onlytest/page/user/storescreen.dart';
import 'package:onlytest/page/userDelirey/orders.dart';
import 'package:onlytest/theme/colors.dart';

import 'bottomnavbar_cubit.dart';
class HomePage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {


    List<Widget> screen =    [
      StoreScreen(),
      ProductScreen(),
      FavouriteScreen(),
      Orders('orders'),
    ];

    List<GButton> _tabs = const [
      GButton(icon: Icons.home, text: 'الرئيسية',backgroundColor:green),
      GButton(icon: Icons.shop_rounded, text: 'المنتجات',backgroundColor:green),
      GButton(icon: Icons.favorite_outline, text: 'المفضلة',backgroundColor:green),
      GButton(icon: Icons.shopping_cart, text: 'الطلبات',backgroundColor:green),
    ];

    return BlocProvider(
      create: (BuildContext context) => BottomnavbarCubit()..soso(context)..intialstate(context),
      child: BlocConsumer<BottomnavbarCubit, BottomnavbarState>(
        listener: (context, state) {},
        builder: (context, state) {
          var navigationCubit = BottomnavbarCubit.get(context);
          return Scaffold(
            body: screen[navigationCubit.currentIndex],
            bottomNavigationBar: Directionality(
              textDirection: TextDirection.rtl,

              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 600) {
                    // Small screen layout
                    return Container(
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
            ),
          );
        },
      ),
    );
  }
}




