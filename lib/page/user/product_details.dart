import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../bloc/product/add_product_to_cart/add_product_to_cart_cubit.dart';
import '../../bloc/product/add_product_to_cart/add_product_to_cart_state.dart';
import '../../bloc/product/product_details/product_details_cubit.dart';
import '../../bloc/product/product_details/product_details_state.dart';
import '../../component/helper.dart';
import '../../model/product_details/product_details.dart';
import '../../theme/colors.dart';

class ProductDetails extends StatelessWidget {
  int id;



  @override
  Widget build(BuildContext context) {
    int?  isFavorite=0;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider(
        create: (context) =>
        ProductDetailsCubit()
          ..getProductDetails(id: id),
        child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
          listener: (context, state) {
            if(state is SuccessState)
            {
              isFavorite=state.productDetailsModel.productInfo!.inFavorite;
            }
          },
          builder: (context, state) {

            ProductDetailsModel? productDetailsModel =
                ProductDetailsCubit
                    .get(context)
                    .productDetailsModel;

            return ProductDetailsCubit
                .get(context)
                .productDetailsModel != null
                ? Scaffold(
                bottomNavigationBar: getBottom(width, height, context,isFavorite!),
                appBar: AppBar(
                  flexibleSpace: Image(
                      width: double.infinity,
                      height: height / 2.5,
                      fit: BoxFit.fill,
                      image:  NetworkImage(
                          EndPoint.imageUrl+productDetailsModel!.productInfo!.pictures!.first)),
                  iconTheme: IconThemeData(color: green, size: width / 15),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  toolbarHeight: height / 2.75,
                ),
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: LayoutBuilder(
                      builder: (context, constrain) =>
                          SingleChildScrollView(
                            child: Column(
                              textDirection: TextDirection.rtl,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: constrain.maxHeight / 80,
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Text(
                                      "${productDetailsModel.productInfo!
                                          .name}",
                                      style: TextStyle(
                                          fontFamily: "Cairo",
                                          fontSize: constrain.maxWidth / 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ), // Product Name
                                    const Spacer(),
                                    ZoomTapAnimation(
                                      onTap: () {
                                        if (ProductDetailsCubit
                                            .get(context)
                                            .count <ProductDetailsCubit.get(context).quantity) {
                                          ProductDetailsCubit.get(context)
                                              .changeCount('add');
                                        }
                                      },
                                      child: Container(
                                          height: height < 830
                                              ? constrain.maxHeight * 0.05 +
                                              constrain.maxWidth * 0.03
                                              : constrain.maxHeight / 14.5,
                                          width: constrain.maxWidth *
                                              0.027 +
                                              constrain.maxHeight * 0.05,
                                          decoration: BoxDecoration(
                                              color: green,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  20)),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: constrain.maxWidth / 19,
                                          )),
                                    ),
                                    SizedBox(
                                      width: constrain.maxWidth / 100,
                                    ),
                                    Text(
                                      "${ProductDetailsCubit
                                          .get(context)
                                          .count}",
                                      style: TextStyle(
                                          fontSize:
                                          constrain.maxWidth * 0.06),
                                    ), // Quantity Required
                                    SizedBox(
                                      width: constrain.maxWidth / 100,
                                    ),
                                    ZoomTapAnimation(
                                      onTap: () {
                                        if (ProductDetailsCubit
                                            .get(context)
                                            .count > 1) {
                                          ProductDetailsCubit.get(context)
                                              .changeCount('minus');
                                        }
                                      },
                                      child: Container(
                                          height: height < 830
                                              ? constrain.maxHeight * 0.05 +
                                              constrain.maxWidth * 0.03
                                              : constrain.maxHeight / 14.5,
                                          width: constrain.maxWidth *
                                              0.027 +
                                              constrain.maxHeight * 0.05,
                                          decoration: BoxDecoration(
                                              color: green,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  20)),
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: constrain.maxWidth / 19,
                                          )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: constrain.maxHeight / 30,
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${productDetailsModel.productInfo!
                                          .price} ل.س ',
                                      style: TextStyle(
                                          color: secondaryColor,
                                          fontSize: constrain.maxWidth *
                                              0.03 +
                                              constrain.maxHeight * 0.02,
                                          fontWeight: FontWeight.w900),
                                      textDirection: TextDirection.rtl,
                                    )
                                  ],
                                ), //Rating
                                SizedBox(
                                  height: constrain.maxHeight / 20,
                                ),
                                Text(
                                  "${productDetailsModel.productInfo!
                                      .description}",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontFamily: "Cairo",
                                      fontSize: constrain.maxWidth * 0.03 +
                                          constrain.maxHeight * 0.01),
                                ), // the description
                                SizedBox(
                                  height: constrain.maxHeight / 15,
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Text(
                                      "الكمية المتبقية:",
                                      style: TextStyle(
                                          fontFamily: "Cairo",
                                          fontSize:
                                          constrain.maxWidth / 35 +
                                              constrain.maxHeight / 55,
                                          fontWeight: FontWeight.w700),
                                      textDirection: TextDirection.rtl,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${productDetailsModel.productInfo!
                                          .quantity}",
                                      style: TextStyle(
                                          fontFamily: "Cairo",
                                          fontSize: constrain.maxWidth *
                                              0.03 +
                                              constrain.maxHeight * 0.02,
                                          color: green.withOpacity(0.9)),
                                    )
                                  ],
                                ) // The remaining quantity
                              ],
                            ),
                          )),
                ))
                : const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Widget getBottom(width, height, context,int isFavorite) {
    double bottomHeight = height < 700 ? 6 : 12;
    return Container(
      height: width >= 600 ? height / 12 : height / 15,
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(width: 2, color: Colors.white))),
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: bottomHeight),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            BlocProvider(
                create: (context) => AddProductToCartCubit(),
                child:
                BlocConsumer<AddProductToCartCubit, AddProductToCartState>(
                  listener: (context, state) {
                    if (state is AddProductToCartSuccessState) {
                      flutterToastt(state.message, "type",
                          height, "gravity");
                    }
                  },
                  builder: (context, state) {
                    return ConditionalBuilder(
                        condition: state is! AddProductToCartLoadingState,
                        builder: (context) =>
                            ZoomTapAnimation(
                              onTap: () {
                                AddProductToCartCubit.get(context)
                                    .addProductToCart(
                                    id: id,
                                    quantity:
                                    ProductDetailsCubit
                                        .get(context)
                                        .count);
                              },
                              child: Container(
                                height:
                                width >= 600 ? height / 10 : height / 20,
                                width: width / 1.25,
                                decoration: BoxDecoration(
                                    color: green,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  "إضافة إلى السلة",
                                  style: TextStyle(
                                      fontSize: width / 20,
                                      fontFamily: "Cairo",
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()));
                  },
                )),
            const Spacer(),
            Container(
              height: width >= 600 ? height / 10 : height / 20,
              width: width / 7.5,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(height * 0.002 + width * 0.03),
                  color: green),
              child: Center(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color:isFavorite==0? Colors.white:Colors.red,
                        size: height * 0.02 + width * 0.02,
                      ))),
            )
          ],
        ),
      ),
    );
  }

  ProductDetails({
    required this.id,
  });
}
