import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/page/user/cart.dart';
import 'package:untitled1/page/user/searchstore.dart';
import 'package:untitled1/page/user/storeproduct.dart';
import '../../bloc/getstore/getstore_cubit.dart';
import '../../model/getcategory.dart';
import '../../model/getstoremodel.dart';
import '../../network/endpoint.dart';
import '../../theme/colors.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _categories = const [
      {
        'name': 'الالبسة',
        'image': 'images/clothes.jpg',
      },
      {
        'name': 'كهربائيات',
        'image': 'images/ele.jpg',
      },
      {
        'name': 'طعام',
        'image': 'images/food.jpg',
      },
      {
        'name': 'احذية',
        'image': 'images/shoes.jpg',
      },
    ];
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;

      return BlocProvider(
        create: (context) => GetstoreCubit()
          ..getstorebycategory(id: 2)
          ..getcategory(),
        child: BlocConsumer<GetstoreCubit, GetstoreState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            GetStoreModel? getStoreModel =
                GetstoreCubit.get(context).getStoreModel;
            Categorymodel? getcategorymodel =
                GetstoreCubit.get(context).getCategorymodel;

            return ((getStoreModel != null) && (getcategorymodel != null))
                ? Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Column(
                        textDirection: TextDirection.rtl,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.07,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchStore()));
                            },
                            child: FractionallySizedBox(
                              widthFactor: 0.9,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.018),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.search_outlined,
                                        size: screenWidth * 0.06,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Expanded(
                                      child: TextField(
                                        textDirection: TextDirection.rtl,
                                        enabled: false,
                                        decoration: InputDecoration(
                                          hintText: 'البحث ',
                                          hintStyle: TextStyle(
                                              fontSize: screenWidth * 0.04,
                                              fontFamily: 'Cairo'),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.027),
                                child: Text(
                                  'التصنيفات',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: screenWidth * 0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Container(
                            height: screenHeight * 0.120,
                            child: ListView.builder(
                              reverse: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  getcategorymodel.categories?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    GetstoreCubit().getstorebycategory(
                                        id: getcategorymodel
                                            .categories?[index].id);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.018),
                                    child: Column(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              screenWidth * 0.053),
                                          child: Container(
                                            width: screenWidth * 0.220,
                                            height: screenWidth * 0.170,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFF2BC0E4),
                                                  Color(0xFFEAECC6),
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                _categories[index]['image'],
                                                width: screenWidth * 0.099,
                                                height: screenWidth * 0.099,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.002),
                                        Text(
                                          getcategorymodel
                                                  .categories![index].name ??
                                              'ds',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Cairo'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.027),
                                child: Text(
                                  'المتاجر',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: screenWidth * 0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Cart()));
                                  },
                                  icon: Icon(Icons.shape_line_outlined))
                            ],
                          ),
                          Expanded(
                            child: Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight:
                                            MediaQuery.of(context).size.height -
                                                150,
                                      ),
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            getStoreModel.shopsData?.length ??
                                                0,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        StoreProduct(
                                                            storeid: getStoreModel
                                                                    .shopsData![
                                                                        index]
                                                                    .id ??
                                                                0),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF4F4F4),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: Row(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Image.network(
                                                        imageShopUrl +
                                                            (getStoreModel
                                                                    .shopsData![
                                                                        index]
                                                                    .photo ??
                                                                'sd'),
                                                        fit: BoxFit.cover,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                        height: double.infinity,
                                                      ),
                                                    ),
                                                    SizedBox(width: 20),
                                                    Expanded(
                                                      child: Column(
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          Text(
                                                            getStoreModel
                                                                    .shopsData![
                                                                        index]
                                                                    .name ??
                                                                'ds',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          SizedBox(height: 10),
                                                          Row(
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            children: [
                                                              Icon(Icons
                                                                  .location_on),
                                                              SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                getStoreModel
                                                                        .shopsData![
                                                                            index]
                                                                        .location
                                                                        ?.city ??
                                                                    'ds',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                          .grey[
                                                                      600],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 10),
                                                          Row(
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            children: [
                                                              Icon(Icons.star,
                                                                  color: Colors
                                                                      .yellow),
                                                              Text(
                                                                  getStoreModel
                                                                          .shopsData![
                                                                              index]
                                                                          .avgStars ??
                                                                      '5',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    color: Colors
                                                                            .grey[
                                                                        600],
                                                                  )),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(height: 10);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                        child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(green),
                    )));
          },
        ),
      );
    });
  }
}
