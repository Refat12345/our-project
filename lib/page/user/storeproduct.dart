// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:onlytest/page/user/product_details.dart';
// import '../../bloc/getproductshopid/getproduct_cubit.dart';
// import '../../component/helper.dart';
// import '../../model/getproductbyshop.dart';
// import '../../network/endpoint.dart';
// import '../../network/local/cache.dart';
// import '../vendor/addproduct.dart';
// import '../vendor/editStore.dart';
// import '../vendor/shopinfo.dart';
//
// class StoreProduct extends StatelessWidget {
//   late int storeid;
//
//   StoreProduct({super.key,
//     required this.storeid,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => GetproductCubit()..getproductbyshopid(id: storeid),
//       child: BlocConsumer<GetproductCubit, GetproductState>(
//         listener: (context, state) {
//           if (state is SuccessState) {
//
//           }
//           if (state is SuccesschangefavouriteState) {
//             if ((state.model.status ?? false)) {
//               flutterToast(state.model.message.toString(), "sucess");
//             }
//           }
//
//           if (state is Open_CloseSuccessState) {
//             flutterToast(state.model.message.toString(), "sucess");
//           }
//
//           if(state is deleteproductSuccessState){
//             flutterToast(state.model.message.toString(), "sucess");
//
//           }
//
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//
//           const Color green = Color(0xFF169956);
//           const Color secondaryColor = Color(0xFF1F9E67);
//           String type = CacheHelper.getData(key: 'type');
//           double screenWidth = MediaQuery.of(context).size.width;
//           getproductmodel? getProductModel =
//               GetproductCubit.get(context).getProductmodel;
//
//
//           return getProductModel != null
//               ? LayoutBuilder (
//                   builder: (BuildContext context, BoxConstraints constraints) {
//                     return Scaffold(
//                       appBar: AppBar(
//                           backgroundColor: green,
//                           title:const  Text(
//                             'المنتجات',
//                             style: TextStyle(fontFamily: 'Cairo'),
//                           ),
//                           centerTitle: true,
//                           actions: [
//                             PopupMenuButton<String>(
//                               onSelected: (value) {
//                                 if (value == 'info') {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           ShopInfo(shopid: storeid),
//                                     ),
//                                   );
//                                 } else if (value == 'edit') {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           EditStore(id: storeid),
//                                     ),
//                                   );
//                                 } else {
//                                   GetproductCubit.get(context)
//                                       .open_closeshop(id: storeid);
//                                 }
//                               },
//                               itemBuilder: (BuildContext context) {
//                                 String? userType =
//                                 CacheHelper.getData(key: 'type');
//                                 List<PopupMenuItem<String>> items = [];
//
//                                 items.add(
//                                   PopupMenuItem(
//                                     value: 'info',
//                                     child: ListTile(
//                                       leading: Icon(Icons.info),
//                                       title: Text('معلومات المتجر'),
//                                       subtitle: Text('عرض تفاصيل المتجر'),
//                                     ),
//                                   ),
//                                 );
//
//                                 if (userType == 'vendor') {
//                                   items.add(
//                                     PopupMenuItem(
//                                       value: 'edit',
//                                       child: ListTile(
//                                         leading: Icon(Icons.edit),
//                                         title: Text('تعديل معلومات المتجر'),
//                                         subtitle: Text('تعديل تفاصيل المتجر'),
//                                       ),
//                                     ),
//                                   );
//                                 }
//
//                                 if (userType == 'vendor') {
//                                   items.add(
//                                     PopupMenuItem(
//                                       value: 'إغلاق/فتح المتجر',
//                                       child: ListTile(
//                                         leading: Icon(Icons.edit),
//                                         title: Text('إغلاق/فتح المتجر'),
//                                         subtitle: Text('إغلاق/فتح المتجر'),
//                                       ),
//                                     ),
//                                   );
//                                 }
//
//                                 return items;
//                               },
//                             ),
//                           ]
//                       ),
//                       body: getProductModel.productsData!.isEmpty? Center(child: Text('لا يوجد منتجات',style: TextStyle(
//                           fontFamily: "Cairo",
//                           fontSize: constraints.maxHeight * 0.02 + constraints.maxWidth * 0.02,
//                           fontWeight: FontWeight.w600),
//                       ),):RefreshIndicator(
//                         backgroundColor: green,
//                         color: Colors.white,
//                         onRefresh: ()async=>context.read<GetproductCubit>().getproductbyshopid(id: storeid),
//                         child: Container(
//                           child: GridView.builder(
//                               padding: EdgeInsets.all(screenWidth * 0.036),
//                               itemCount: getProductModel.productsData?.length ?? 0,
//                               gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 childAspectRatio: 0.70,
//                                 crossAxisSpacing: screenWidth * 0.036,
//                                 mainAxisSpacing: screenWidth * 0.036,
//                               ),
//                               itemBuilder: (BuildContext context, int index) {
//                                 return InkWell(
//                                   onLongPress: () {
//                                     if (type == "vendor") {
//                                       showDialog(
//                                         context: context,
//                                         builder: (contextt) {
//                                           return AlertDialog(
//                                             title: Text("اختر العملية المطلوبة"),
//                                             content: Column(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: <Widget>[
//                                                 ListTile(
//                                                   title: Text("حذف المنتج"),
//                                                   onTap: () {
//
//                                                     GetproductCubit.get(context).deleteproduct(id:getProductModel.productsData?[index].id);
//
//                                                   },
//                                                 ),
//
//                                               ],
//                                             ),
//                                           );
//                                         },
//                                       );
//                                     }
//                                   },
//
//
//
//
//
//
//                                   onTap: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => ProductDetails(
//                                               id: getProductModel
//                                                   .productsData![index].id,
//                                             )));
//                                   },
//                                   child: Stack(
//                                     children: [
//                                       Card(
//                                         child: SingleChildScrollView(
//                                           child: Column(
//                                             textDirection: TextDirection.rtl,
//                                             crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                             children: <Widget>[
//                                               AspectRatio(
//                                                 aspectRatio: 1,
//                                                 child: Image.network(
//                                                   imageProductUrl +
//                                                       (getProductModel
//                                                           .productsData![index]
//                                                           .picture ??
//                                                           'sd'),
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsets.all(
//                                                     screenWidth * 0.018),
//                                                 child: Column(
//                                                   textDirection: TextDirection.rtl,
//                                                   crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                                   children: <Widget>[
//                                                     Text(
//                                                       getProductModel
//                                                           .productsData![index]
//                                                           .name ??
//                                                           'ds',
//                                                       style: TextStyle(
//                                                           fontSize:
//                                                           screenWidth * 0.04,
//                                                           fontWeight:
//                                                           FontWeight.bold,
//                                                           fontFamily: 'Cairo'),
//                                                     ),
//                                                     SizedBox(
//                                                         height:
//                                                         screenWidth * 0.007),
//                                                     Text(
//                                                       '\$${getProductModel.productsData![index].price ?? 'ds'}',
//                                                       style: const TextStyle(
//                                                         fontSize: 16,
//                                                         color: Colors.green,
//                                                         fontWeight: FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       Positioned(
//                                         top: constraints.maxWidth * 0.48,
//                                         left: constraints.maxWidth * 0.001,
//                                         child: Visibility(
//                                           visible: type == 'customer',
//                                           child: IconButton(
//                                             icon: CircleAvatar(
//                                               radius: constraints.maxWidth * 0.030,
//                                               backgroundColor: GetproductCubit.get(
//                                                   context)
//                                                   .favourites[
//                                               getProductModel
//                                                   .productsData?[index]
//                                                   .id] ==
//                                                   1
//                                                   ? Colors.red
//                                                   : Colors.grey,
//                                               child: Icon(
//                                                 Icons.favorite,
//                                                 color: Colors.white,
//                                                 size: constraints.maxWidth * 0.05,
//                                               ),
//                                             ),
//                                             onPressed: () {
//                                               GetproductCubit.get(context)
//                                                   .changefavourite(
//                                                 id: getProductModel
//                                                     .productsData?[index].id,
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               }),
//                         ),
//                       ),
//                       floatingActionButton: type == 'vendor'
//                           ? FloatingActionButton(
//                         backgroundColor: secondaryColor,
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => AddProduct(id: storeid),
//                             ),
//                           );
//                         },
//                         child: Icon(Icons.add),
//                       )
//                           : null,
//                     );
//                 })
//               : const DecoratedBox(
//                   decoration: BoxDecoration(color: Colors.white),
//                   child: Center(
//                     child: CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(green),
//                     ),
//                   ),
//                 );
//         },
//       ),
//     );
//   }
// }
////////////////
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlytest/page/user/product_details.dart';
import '../../bloc/getproductshopid/getproduct_cubit.dart';
import '../../component/helper.dart';
import '../../model/getproductbyshop.dart';
import '../../network/endpoint.dart';
import '../../network/local/cache.dart';
import '../vendor/addproduct.dart';
import '../vendor/editStore.dart';
import '../vendor/shopinfo.dart';

class StoreProduct extends StatelessWidget {
  late int storeid;

  StoreProduct({super.key,
    required this.storeid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetproductCubit()..getproductbyshopid(id: storeid),
      child: BlocConsumer<GetproductCubit, GetproductState>(
        listener: (context, state) {
          if (state is SuccessState) {

          }
          if (state is SuccesschangefavouriteState) {
            if ((state.model.status ?? false)) {
              flutterToast(state.model.message.toString(), "sucess");
            }
          }

          if (state is Open_CloseSuccessState) {
            flutterToast(state.model.message.toString(), "sucess");
          }

          if(state is deleteproductSuccessState){
            flutterToast(state.model.message.toString(), "sucess");

          }

          // TODO: implement listener
        },
        builder: (context, state) {

          const Color green = Color(0xFF169956);
          const Color secondaryColor = Color(0xFF1F9E67);
          String type = CacheHelper.getData(key: 'type');
          double screenWidth = MediaQuery.of(context).size.width;
          getproductmodel? getProductModel =
              GetproductCubit.get(context).getProductmodel;


          return getProductModel != null
              ? LayoutBuilder (
              builder: (BuildContext context, BoxConstraints constraints) {
                return Scaffold(
                  appBar: AppBar(
                      backgroundColor: green,
                      title:const  Text(
                        'المنتجات',
                        style: TextStyle(fontFamily: 'Cairo'),
                      ),
                      centerTitle: true,
                      actions: [
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'info') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ShopInfo(shopid: storeid),
                                ),
                              );
                            } else if (value == 'edit') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditStore(id: storeid),
                                ),
                              );
                            } else {
                              GetproductCubit.get(context)
                                  .open_closeshop(id: storeid);
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            String? userType =
                            CacheHelper.getData(key: 'type');
                            List<PopupMenuItem<String>> items = [];

                            items.add(
                              PopupMenuItem(
                                value: 'info',
                                child: ListTile(
                                  leading: Icon(Icons.info),
                                  title: Text('معلومات المتجر'),
                                  subtitle: Text('عرض تفاصيل المتجر'),
                                ),
                              ),
                            );

                            if (userType == 'vendor') {
                              items.add(
                                PopupMenuItem(
                                  value: 'edit',
                                  child: ListTile(
                                    leading: Icon(Icons.edit),
                                    title: Text('تعديل معلومات المتجر'),
                                    subtitle: Text('تعديل تفاصيل المتجر'),
                                  ),
                                ),
                              );
                            }

                            if (userType == 'vendor') {
                              items.add(
                                PopupMenuItem(
                                  value: 'إغلاق/فتح المتجر',
                                  child: ListTile(
                                    leading: Icon(Icons.edit),
                                    title: Text('إغلاق/فتح المتجر'),
                                    subtitle: Text('إغلاق/فتح المتجر'),
                                  ),
                                ),
                              );
                            }

                            return items;
                          },
                        ),
                      ]),
                  body: getProductModel.productsData!.isEmpty? Center(child: Text('لا يوجد منتجات',style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: constraints.maxHeight * 0.02 + constraints.maxWidth * 0.02,
                      fontWeight: FontWeight.w600),
                  ),):RefreshIndicator(
                    backgroundColor: green,
                    color: Colors.white,
                    onRefresh: ()async=>context.read<GetproductCubit>().getproductbyshopid(id: storeid),
                    child: Container(
                      child: GridView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.all(screenWidth * 0.036),
                          itemCount: getProductModel.productsData?.length ?? 0,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.70,
                            crossAxisSpacing: screenWidth * 0.036,
                            mainAxisSpacing: screenWidth * 0.036,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onLongPress: () {
                                if (type == "vendor") {
                                  showDialog(
                                    context: context,
                                    builder: (contextt) {
                                      return AlertDialog(
                                        title: Text("اختر العملية المطلوبة"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ListTile(
                                              title: Text("حذف المنتج"),
                                              onTap: () {

                                                GetproductCubit.get(context).deleteproduct(id:getProductModel.productsData?[index].id);

                                              },
                                            ),

                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }
                              },



                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetails(
                                          id: getProductModel
                                              .productsData![index].id,
                                        )));
                              },
                              child: Stack(
                                children: [
                                  Card(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        textDirection: TextDirection.rtl,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          AspectRatio(
                                            aspectRatio: 1,
                                            child: Image.network(
                                              imageProductUrl +
                                                  (getProductModel
                                                      .productsData![index]
                                                      .picture ??
                                                      'sd'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(
                                                screenWidth * 0.018),
                                            child: Column(
                                              textDirection: TextDirection.rtl,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  getProductModel
                                                      .productsData![index]
                                                      .name ??
                                                      'ds',
                                                  style: TextStyle(
                                                      fontSize:
                                                      screenWidth * 0.04,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily: 'Cairo'),
                                                ),
                                                SizedBox(
                                                    height:
                                                    screenWidth * 0.007),
                                                Text(
                                                  '\$${getProductModel.productsData![index].price ?? 'ds'}',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: constraints.maxWidth * 0.48,
                                    left: constraints.maxWidth * 0.001,
                                    child: Visibility(
                                      visible: type == 'customer',
                                      child: IconButton(
                                        icon: CircleAvatar(
                                          radius: constraints.maxWidth * 0.030,
                                          backgroundColor: GetproductCubit.get(
                                              context)
                                              .favourites[
                                          getProductModel
                                              .productsData?[index]
                                              .id] ==
                                              1
                                              ? Colors.red
                                              : Colors.grey,
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                            size: constraints.maxWidth * 0.05,
                                          ),
                                        ),
                                        onPressed: () {
                                          GetproductCubit.get(context)
                                              .changefavourite(
                                            id: getProductModel
                                                .productsData?[index].id,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  floatingActionButton: type == 'vendor'
                      ? FloatingActionButton(
                    backgroundColor: secondaryColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddProduct(id: storeid),
                        ),
                      );
                    },
                    child: Icon(Icons.add),
                  )
                      : null,
                );
              })
              : const DecoratedBox(
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(green),
              ),
            ),
          );
        },
      ),
    );
  }
}
