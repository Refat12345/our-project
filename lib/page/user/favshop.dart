import 'package:flutter/material.dart';

import '../../bloc/getstore/getstore_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../component/helper.dart';
import '../../model/shopfav.dart';
import '../../theme/colors.dart';

class FavouriteShop extends StatelessWidget {
  const FavouriteShop({super.key});

  @override
  Widget build(BuildContext context) {



    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return BlocProvider(
            create: (context) => GetstoreCubit()..getstorefav(),
            child: BlocConsumer<GetstoreCubit, GetstoreState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {

                getfavuritestoremodel? Getfavmodel =GetstoreCubit.get(context).Getfavmodel ;
                double screenWidth = MediaQuery.of(context).size.width;
                double screenHeight = MediaQuery.of(context).size.height;

                return Getfavmodel !=null ?Scaffold(
                  appBar:AppBar(backgroundColor: green,

                    title: Text('مفضلة المتاجر',
                    style: TextStyle(fontFamily: 'Cairo'
                    ),
                    ),
                  ),
                  body: Column(
                    textDirection: TextDirection.rtl,

                    children: [
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
                                    Getfavmodel?.favoriteShopData?.length ??
                                        0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: screenHeight * 0.01),
                                          child: Stack(
                                            children: [
                                              Row(
                                                textDirection: TextDirection.rtl,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(5),
                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                    child: Image(
                                                      image: NetworkImage(EndPoint.imageShopUrl +
                                                          Getfavmodel!.favoriteShopData![index].photo!),
                                                      fit: BoxFit.cover,
                                                      height: 100,
                                                      width: 100,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 0.026,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    textDirection: TextDirection.rtl,
                                                    children: [
                                                      Text(
                                                        "${Getfavmodel!.favoriteShopData![index].name!}",
                                                        style: TextStyle(
                                                            fontFamily: "Cairo",
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: screenHeight * 0.015 + screenWidth * 0.01),
                                                      ),
                                                      SizedBox(
                                                        height: screenHeight * 0.0004,
                                                      ),
                                                      Text(
                                                        "${Getfavmodel!.favoriteShopData![index].location?.city!}",
                                                        style: TextStyle(
                                                            fontFamily: "Cairo",
                                                            fontSize: screenHeight * 0.015 + screenWidth * 0.01,
                                                            fontWeight: FontWeight.w500),
                                                      ),
                                                      SizedBox(
                                                        height: screenHeight * 0.0004,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors.yellow,
                                                            size: screenHeight * 0.02 + screenWidth * 0.015,
                                                          ),
                                                          Text(
                                                            '5',
                                                            style: TextStyle(
                                                                fontFamily: "Cairo",
                                                                fontSize: screenHeight * 0.015 + screenWidth * 0.01,
                                                                color: green,
                                                                fontWeight: FontWeight.w600),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    'مفتوح',
                                                    style: TextStyle(
                                                        fontSize: screenHeight * 0.015 + screenWidth * 0.01,
                                                        fontFamily: "Cairo",
                                                        fontWeight: FontWeight.w600,
                                                        color: green),
                                                  )
                                                ],
                                              ),
                                            ],
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




                ):const DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(green),
                        )));
              },
            ),
          );

        }


    );
  }
}
