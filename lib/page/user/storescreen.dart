// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:onlytest/page/user/searchstore.dart';
// import 'package:onlytest/page/user/storeproduct.dart';
//
//
// import '../../bloc/getstore/getstore_cubit.dart';
// import '../../component/helper.dart';
// import '../../model/cart/cart_model.dart';
// import '../../model/getcategory.dart';
// import '../../model/getstoremodel.dart';
// import '../../network/endpoint.dart';
// import '../../theme/colors.dart';
// import 'cart.dart';
//
// class StoreScreen extends StatelessWidget {
//   const StoreScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> _categories = const [
//       {
//         'name': 'الالبسة',
//         'image': 'images/clothes.jpg',
//       },
//       {
//         'name': 'كهربائيات',
//         'image': 'images/ele.jpg',
//       },
//       {
//         'name': 'طعام',
//         'image': 'images/food.jpg',
//       },
//       {
//         'name': 'احذية',
//         'image': 'images/shoes.jpg',
//       },
//     ];
//     return LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//       double screenWidth = MediaQuery.of(context).size.width;
//       double screenHeight = MediaQuery.of(context).size.height;
//
//
//
//       return BlocProvider(
//         create: (context) => GetstoreCubit()
//           ..getstorebycategory(id: 2)
//           ..getcategory()..getCart(),
//         child: BlocConsumer<GetstoreCubit, GetstoreState>(
//           listener: (context, state) {
//             // TODO: implement listener
//           },
//           builder: (context, state) {
//             GetStoreModel? getStoreModel =
//                 GetstoreCubit.get(context).getStoreModel;
//             Categorymodel? getcategorymodel =
//                 GetstoreCubit.get(context).getCategorymodel;
//         //    CartModel? cartModel = GetstoreCubit.get(context).cartModel;
//             int ? numberofitemincart = GetstoreCubit.get(context).num;
//
//
//             return ((getStoreModel != null) && (getcategorymodel != null))
//                 ? Container(
//                     color: Colors.grey[200],
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 5.0),
//                       child: Column(
//                         textDirection: TextDirection.rtl,
//                         children: [
//                           SizedBox(
//                             height: screenHeight * 0.07,
//                           ),
//                           InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => SearchStore()));
//                             },
//                             child: FractionallySizedBox(
//                               widthFactor: 0.9,
//                               child: Directionality(
//                                 textDirection: TextDirection.rtl,
//
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: screenWidth * 0.018),
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey[300],
//                                     borderRadius: BorderRadius.circular(16),
//                                   ),
//                                   child: Row(
//                                     textDirection: TextDirection.rtl,
//                                     children: [
//                                       IconButton(
//                                         icon: Icon(
//                                           Icons.search_outlined,
//                                           size: screenWidth * 0.06,
//                                         ),
//                                         onPressed: () {},
//                                       ),
//                                       Expanded(
//                                         child: TextField(
//                                           textDirection: TextDirection.rtl,
//                                           enabled: false,
//                                           decoration: InputDecoration(
//                                             hintText: 'البحث ',
//                                             hintStyle: TextStyle(
//                                                 fontSize: screenWidth * 0.04,
//                                                 fontFamily: 'Cairo'),
//                                             border: InputBorder.none,
//                                           ),
//                                         ),
//                                       ),
//                                       Badge.count(
//                                         count: numberofitemincart ?? 100 ,
//                                         child: IconButton(
//                                           icon: Icon(
//                                             Icons.shopping_cart,
//                                             size: screenWidth * 0.08,
//                                           ),
//                                           onPressed: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) => Cart()));
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: screenHeight * 0.01,
//                           ),
//                           Row(
//                             textDirection: TextDirection.rtl,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(left: screenWidth * 0.027),
//                                 child: Text(
//                                   'التصنيفات',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     fontFamily: 'Cairo',
//                                     fontSize: screenWidth * 0.055,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: screenHeight * 0.02,
//                           ),
//                           Container(
//                             height: screenHeight * 0.120,
//                             child: ListView.builder(
//                               reverse: true,
//                               scrollDirection: Axis.horizontal,
//                               itemCount:
//                                   getcategorymodel.categories?.length ?? 0,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return InkWell(
//                                   onTap: () {
//                                     GetstoreCubit().getstorebycategory(
//                                         id: getcategorymodel
//                                             .categories?[index].id);
//                                   },
//                                   child: Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: screenWidth * 0.018),
//                                     child: Column(
//                                       textDirection: TextDirection.rtl,
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius: BorderRadius.circular(
//                                               screenWidth * 0.053),
//                                           child: Container(
//                                             width: screenWidth * 0.220,
//                                             height: screenWidth * 0.170,
//                                             decoration: BoxDecoration(
//                                               gradient: LinearGradient(
//                                                 colors: [
//                                                   Color(0xFF2BC0E4),
//                                                   Color(0xFFEAECC6),
//                                                 ],
//                                                 begin: Alignment.topLeft,
//                                                 end: Alignment.bottomRight,
//                                               ),
//                                             ),
//                                             child: Center(
//                                               child: Image.asset(
//                                                 _categories[index]['image'],
//                                                 width: screenWidth * 0.099,
//                                                 height: screenWidth * 0.099,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(height: screenHeight * 0.002),
//                                         Text(
//                                           getcategorymodel
//                                                   .categories![index].name ??
//                                               'ds',
//                                           style: TextStyle(
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'Cairo'),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                           SizedBox(
//                             height: screenHeight * 0.01,
//                           ),
//                           Row(
//                             textDirection: TextDirection.rtl,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(left: screenWidth * 0.027),
//                                 child: Text(
//                                   'المتاجر',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     fontFamily: 'Cairo',
//                                     fontSize: screenWidth * 0.055,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               Spacer(),
//                               IconButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => Cart()));
//                                   },
//                                   icon: Icon(Icons.shape_line_outlined))
//                             ],
//                           ),
//                           Expanded(
//                             child: Container(
//                               child: SingleChildScrollView(
//                                 child: Column(
//                                   textDirection: TextDirection.rtl,
//                                   children: [
//                                     ConstrainedBox(
//                                       constraints: BoxConstraints(
//                                         maxHeight:
//                                             MediaQuery.of(context).size.height -
//                                                 150,
//                                       ),
//                                       child: ListView.separated(
//                                         shrinkWrap: true,
//                                         physics: NeverScrollableScrollPhysics(),
//                                         itemCount:
//                                             getStoreModel.shopsData?.length ??
//                                                 0,
//                                         itemBuilder:
//                                             (BuildContext context, int index) {
//                                           return Column(
//                                             children: [
//                                               Card(
//                                                   color: Colors.white,
//                                                   child: Padding(
//                                                   padding: EdgeInsets.only(left: screenHeight * 0.01),
//                                                     child: Stack(
//                                                       children: [
//                                                         Row(
//                                                           textDirection: TextDirection.rtl,
//                                                           children: [
//                                                             ClipRRect(
//                                                               borderRadius: BorderRadius.circular(5),
//                                                               clipBehavior: Clip.antiAliasWithSaveLayer,
//                                                               child: Image(
//                                                                 image: NetworkImage(EndPoint.imageShopUrl +
//                                                                     getStoreModel.shopsData![index].photo!),
//                                                                 fit: BoxFit.cover,
//                                                                 height: 100,
//                                                                 width: 100,
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               width: screenWidth * 0.026,
//                                                             ),
//                                                             Column(
//                                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                                               textDirection: TextDirection.rtl,
//                                                               children: [
//                                                                 Text(
//                                                                   "${getStoreModel.shopsData![index].name}",
//                                                                   style: TextStyle(
//                                                                       fontFamily: "Cairo",
//                                                                       fontWeight: FontWeight.bold,
//                                                                       fontSize: screenHeight * 0.015 + screenWidth * 0.01),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: screenHeight * 0.0004,
//                                                                 ),
//                                                                 Text(
//                                                                   "${getStoreModel.shopsData![index].location!.city}",
//                                                                   style: TextStyle(
//                                                                       fontFamily: "Cairo",
//                                                                       fontSize: screenHeight * 0.015 + screenWidth * 0.01,
//                                                                       fontWeight: FontWeight.w500),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: screenHeight * 0.0004,
//                                                                 ),
//                                                                 Row(
//                                                                   children: [
//                                                                     Icon(
//                                                                       Icons.star,
//                                                                       color: Colors.yellow,
//                                                                       size: screenHeight * 0.02 + screenWidth * 0.015,
//                                                                     ),
//                                                                     Text(
//                                                                       '5',
//                                                                       style: TextStyle(
//                                                                           fontFamily: "Cairo",
//                                                                           fontSize: screenHeight * 0.015 + screenWidth * 0.01,
//                                                                           color: green,
//                                                                           fontWeight: FontWeight.w600),
//                                                                     ),
//                                                                   ],
//                                                                 )
//                                                               ],
//                                                             ),
//                                                             const Spacer(),
//                                                             Text(
//                                                               'مفتوح',
//                                                               style: TextStyle(
//                                                                   fontSize: screenHeight * 0.015 + screenWidth * 0.01,
//                                                                   fontFamily: "Cairo",
//                                                                   fontWeight: FontWeight.w600,
//                                                                   color: green),
//                                                             )
//                                                           ],
//                                                         ),
//                                                         Positioned(
//                                                           bottom: MediaQuery.of(context).size.height * 0.001, // Adjust as needed
//                                                           left: MediaQuery.of(context).size.width * 0.000000000001,
//
//
//                                                         child:  IconButton(
//                                                             icon: CircleAvatar(
//                                                               radius: constraints.maxWidth * 0.030,
//                                                               backgroundColor: GetstoreCubit.get(
//                                                                   context)
//                                                                   .favourites[
//                                                               getStoreModel
//                                                                   .shopsData?[index]
//                                                                   .id] ==
//                                                                   1
//                                                                   ? Colors.red
//                                                                   : Colors.grey,
//                                                               child: Icon(
//                                                                 Icons.favorite,
//                                                                 color: Colors.white,
//                                                                 size: constraints.maxWidth * 0.05,
//                                                               ),
//                                                             ),
//                                                             onPressed: () {
//                                                               GetstoreCubit.get(context)
//                                                                   .changefavourite(
//                                                                 id: getStoreModel
//                                                                     .shopsData?[index].id,
//                                                               );
//                                                             },
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                               ),
//                                             ],
//                                           );
//
//                                           },
//
//
//
//                                         separatorBuilder:
//                                             (BuildContext context, int index) {
//                                           return SizedBox(height: 10);
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 : const DecoratedBox(
//                     decoration: BoxDecoration(color: Colors.white),
//                     child: Center(
//                         child: CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(green),
//                     )));
//           },
//         ),
//       );
//     });
//   }
// }
///////////////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlytest/page/user/searchstore.dart';
import 'package:onlytest/page/user/storeproduct.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../bloc/getstore/getstore_cubit.dart';
import '../../component/helper.dart';
import '../../theme/colors.dart';
import 'cart.dart';

class StorePage extends StatelessWidget {
  StorePage({super.key});

  List<Map<String, dynamic>> categories = const
  [
    {
      'name': 'طعام',
      'image': 'images/food.jpg',
    },
    {
      'name': 'الالبسة',
      'image': 'images/clothes.jpg',
    },
    {
      'name': 'كهربائيات',
      'image': 'images/ele.jpg',
    },
    {
      'name': 'احذية',
      'image': 'images/shoes.jpg',
    },
  ];

  bool status=false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
         return Scaffold(
              backgroundColor: lightGrey,
              body: BlocProvider(
                create: (context) => GetstoreCubit()..getstorebycategory(id: "2"),
                child: BlocConsumer<GetstoreCubit, GetstoreState>(
                  listener: (context, state) {
                    if(state is StateBloc)

                    {
                      GetstoreCubit.get(context).getstorebycategory(id: "2");
                    }
                  },
                  builder: (context, state) {
                    GetstoreCubit getStoreCubit=GetstoreCubit.get(context);
                    int id=getStoreCubit.id;
                    return SafeArea(
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 28.0, left: 8, right: 8),
                        child: LayoutBuilder(
                          builder: (context, constrain) {
                            double height = constrain.maxHeight;
                            double width = constrain.maxWidth;
                            return SingleChildScrollView(
                                child: Column(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Container(
                                      height: height * 0.067,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                                              },
                                              icon: Icon(
                                                Icons.shopping_cart,
                                                color: Colors.black,
                                                size: height * 0.04,
                                              )),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                  color: Colors.grey.shade300,
                                                ),
                                                child: TextField(
                                                  textDirection:
                                                  TextDirection.rtl,
                                                  textAlignVertical: TextAlignVertical.center,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                      hintText: "البحث",
                                                      border: InputBorder.none,
                                                      hintStyle: const TextStyle(
                                                          fontFamily: "Cairo"),
                                                      hintTextDirection:
                                                      TextDirection.rtl,
                                                      prefixIcon:
                                                      ZoomTapAnimation(
                                                          onTap: () {
                                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchStore()));
                                                          },
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                            child: Container(
                                                              width: width *
                                                                  0.063,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: ColorConstants
                                                                    .gray200,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    10),
                                                              ),
                                                              child:
                                                              const Center(
                                                                child: Icon(
                                                                   // IconlyLight

                                                                    //.filter,
                                                                  Icons.ice_skating
                                                                    // color: Colors
                                                                    //     .white
                                                                       ),
                                                              ),
                                                            ),
                                                          ))),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: height * 0.04),
                                    SizedBox(
                                      height: height * 0.086,
                                      child: ListView.builder(
                                        reverse: true,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: categories.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            children: [
                                              ZoomTapAnimation(
                                                onTap: () {
                                                  getStoreCubit.changeId();
                                                },
                                                beginDuration: const Duration(
                                                    milliseconds: 50),
                                                endDuration: const Duration(
                                                    milliseconds: 100),
                                                child: Container(
                                                  clipBehavior: Clip.hardEdge,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                  ),
                                                  margin: const EdgeInsets.only(
                                                      right: 8),
                                                  child: Stack(
                                                    children: [
                                                      SizedBox(
                                                        width: width * 0.3,
                                                        child: Image(
                                                          image: AssetImage(
                                                              categories[index]
                                                              ['image']),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        left: 0,
                                                        right: 0,
                                                        bottom: 0,
                                                        child: Container(
                                                          decoration:
                                                          BoxDecoration(
                                                            color: Colors.black
                                                                .withAlpha(110),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                                "${categories[index]['name']}",
                                                                textAlign:
                                                                TextAlign
                                                                    .center,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    "Cairo",
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontSize: height *
                                                                        0.0155 +
                                                                        width *
                                                                            0.01)),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: width * 0.01),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(height: height * 0.025),
                                    GetstoreCubit.get(context).getStoreModel!=null?ListView.builder(
                                        shrinkWrap: true,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount:
                                        GetstoreCubit.get(context).getStoreModel!.shopsData!.length,
                                        itemBuilder: (context, index) => Column(
                                          children: [
                                            ZoomTapAnimation(
                                              onTap: () {

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        StoreProduct(
                                                            storeid: getStoreCubit.getStoreModel!.shopsData![index].id??
                                                                0),
                                                  ),
                                                );
                                              },
                                              child: Card(
                                                color: Colors.white,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: height * 0.01),

                                                  child: Stack(
                                                    children: [
                                                      Row(
                                                        textDirection:
                                                        TextDirection.rtl,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            child: Image(
                                                              image: NetworkImage(EndPoint
                                                                  .imageShopUrl +
                                                                  GetstoreCubit.get(context). getStoreModel
                                                                  !.shopsData![
                                                                  index]
                                                                      .photo!),
                                                              fit: BoxFit.cover,
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: width * 0.026,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            textDirection:
                                                            TextDirection.rtl,
                                                            children: [
                                                              Text(
                                                                "${GetstoreCubit.get(context).getStoreModel!.shopsData![index].name}",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    "Cairo",
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                    fontSize: height *
                                                                        0.015 +
                                                                        width *
                                                                            0.01),
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.0004,
                                                              ),
                                                              Text(
                                                                "${GetstoreCubit.get(context).getStoreModel!.shopsData![index].location!.city}",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    "Cairo",
                                                                    fontSize: height *
                                                                        0.015 +
                                                                        width *
                                                                            0.01,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.0004,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .yellow,
                                                                    size: height *
                                                                        0.02 +
                                                                        width *
                                                                            0.015,
                                                                  ),
                                                                  Text(
                                                                    '5',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                        "Cairo",
                                                                        fontSize: height * 0.015 +
                                                                            width *
                                                                                0.01,
                                                                        color:
                                                                        green,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            'مفتوح',
                                                            style: TextStyle(
                                                                fontSize: height *
                                                                    0.015 +
                                                                    width * 0.01,
                                                                fontFamily:
                                                                "Cairo",
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                                color: green),
                                                          )
                                                        ],
                                                      ),
                                                      Positioned(
                                                        bottom: MediaQuery.of(context).size.height * 0.001, // Adjust as needed
                                                        left: MediaQuery.of(context).size.width * 0.000000000001,


                                                        child:  IconButton(
                                                          icon: CircleAvatar(
                                                            radius: constraints.maxWidth * 0.030,
                                                            backgroundColor: GetstoreCubit.get(
                                                                context)
                                                                .favourites[GetstoreCubit.get(context).getStoreModel
                                                                ?.shopsData?[index]
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
                                                            GetstoreCubit.get(context)
                                                                .changefavourite(
                                                              id: GetstoreCubit.get(context).getStoreModel
                                                                  ?.shopsData?[index].id,
                                                            );
                                                          },
                                                        ),
                                                      ),

                                                    ],

                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: height * 0.018),
                                          ],
                                        )):
                                    const Center(child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(green),
                                    ),)
                                  ],
                                )
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ));

        }

    );
  }
}


