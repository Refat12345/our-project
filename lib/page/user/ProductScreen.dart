import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlytest/page/user/product_details.dart';
import 'package:onlytest/page/user/searchproduct.dart';


import '../../bloc/getproductcategory/getproduct_cubitt.dart';
import '../../component/helper.dart';
import '../../model/getcategory.dart';
import '../../model/getproductbycategorymodel.dart';
import '../../network/endpoint.dart';
import '../../theme/colors.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetproductCubitt()
        ..getproductcategory(id: 1)
        ..getcategoryy(),
      child: BlocConsumer<GetproductCubitt, GetproductStatee>(
        listener: (context, state) {
          if (state is SuccesschangefavouriteState) {
            if ((state.model.status ?? false)) {
              flutterToast(state.model.message.toString(), "sucess");
            }
          }
        },
        builder: (context, state) {
          getproductbycategorymodel? getproductcategormodel =
              GetproductCubitt.get(context).getProductModel;
          Categorymodel? getcategorymodel =
              GetproductCubitt.get(context).getCategorymodel;
          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            double screenWidth = MediaQuery.of(context).size.width;
            double screenHeight = MediaQuery.of(context).size.height;

            return ((getproductcategormodel != null) &&
                    (getcategorymodel != null))
                ? Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Column(
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          SizedBox(
                            height: screenHeight * 0.07,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchProduct()));
                            },
                            child: FractionallySizedBox(
                              widthFactor: 0.9,
                              child: Directionality(
                                textDirection: TextDirection.rtl,

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
                                  onTap: () {},
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
                                                'images/shop3.jpg',
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
                                  'المنتجات',
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
                          Expanded(
                            child: GridView.builder(
                                padding: EdgeInsets.all(screenWidth * 0.036),
                                itemCount: getproductcategormodel
                                        .productsData?.length ??
                                    0,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.70,
                                  crossAxisSpacing: screenWidth * 0.036,
                                  mainAxisSpacing: screenWidth * 0.036,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetails(
                                                    id: getproductcategormodel
                                                            .productsData![
                                                                index]
                                                            .id ??
                                                        1,
                                                  )));
                                    },
                                    child: Stack(
                                      children: [
                                        Card(
                                          child: Column(
                                            textDirection: TextDirection.rtl,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              AspectRatio(
                                                aspectRatio: 1,
                                                child: Image.network(
                                                  imageProductUrl +
                                                      (getproductcategormodel
                                                              .productsData![
                                                                  index]
                                                              .picture ??
                                                          'sd'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(
                                                    screenWidth * 0.018),
                                                child: Column(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      getproductcategormodel
                                                              .productsData![
                                                                  index]
                                                              .name ??
                                                          'ds',
                                                      style: TextStyle(
                                                          fontSize:
                                                              screenWidth *
                                                                  0.03,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Cairo'),
                                                    ),
                                                    SizedBox(
                                                        height: screenWidth *
                                                            0.007),
                                                    Text(
                                                      '\$${getproductcategormodel.productsData![index].price ?? 'ds'}',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: constraints.maxWidth * 0.48,
                                          left: constraints.maxWidth * 0.001,
                                          child: Visibility(
                                            visible: true,
                                            child: IconButton(
                                              icon: CircleAvatar(
                                                radius: constraints.maxWidth *
                                                    0.030,
                                                backgroundColor: GetproductCubitt
                                                                    .get(context)
                                                                .favourites[
                                                            getproductcategormodel
                                                                .productsData?[
                                                                    index]
                                                                .id] ==
                                                        1
                                                    ? Colors.red
                                                    : Colors.grey,
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: Colors.white,
                                                  size: constraints.maxWidth *
                                                      0.05,
                                                ),
                                              ),
                                              onPressed: () {
                                                GetproductCubitt.get(context)
                                                    .changefavourite(
                                                  id: getproductcategormodel
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
                        ],
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(green),));
          });
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
