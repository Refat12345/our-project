import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project2/page/user/ProductScreen.dart';
import 'package:project2/page/user/storescreen.dart';
import 'package:project2/page/vendor/addstore.dart';


import 'page/vendor/addproduct.dart';

import 'app_localizations.dart';
import 'bottomnavbar_cubit.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {


    List<Widget> screen = const   [
      StoreScreen(),
      ProductScreen(),
      AddProduct(),
      AddStore(),
    ];

    List<GButton> _tabs = const [
      GButton(icon: Icons.home, text: 'الرئيسية'),
      GButton(icon: Icons.shop_rounded, text: 'المنتجات'),
      GButton(icon: Icons.favorite_outline, text: 'المفضلة'),
      GButton(icon: Icons.person, text: 'الصفحة الشخصية'),
    ];

    return BlocProvider(
      create: (BuildContext context) => BottomnavbarCubit(),
      child: BlocConsumer<BottomnavbarCubit, BottomnavbarState>(
        listener: (context, state) {},
        builder: (context, state) {
          var navigationCubit = BottomnavbarCubit.get(context);
          return Scaffold(
            body: screen[navigationCubit.currentIndex],
            bottomNavigationBar: LayoutBuilder(
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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

class Product {
  final String name;
  final double price;
  final String image;
  final String description;

  Product(
      {required this.name,
        required this.price,
        required this.image,
        required this.description});
}



