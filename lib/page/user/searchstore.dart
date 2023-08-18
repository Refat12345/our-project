import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/page/user/storeproduct.dart';

import '../../bloc/searchcubit/searchstore_cubit.dart';
import '../../model/searchstoremodel.dart';
class SearchStore extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<Store> stores = [
      Store(
          name: 'المتجر الاول',
          image: 'images/shop1.jpg',
          rating: 3.5,
          address: "123 Main St"),
      Store(
          name: 'المتجر الثاني',
          image: 'images/shop2.jpg',
          rating: 4.5,
          address: "456 Market St"),
      Store(
          name: 'المتجر الثالث',
          image: 'images/shop3.jpg',
          rating: 5.0,
          address: "660 Kani Sr"),
      Store(
          name: 'المتجر الرابع',
          image: 'images/shop4.jpg',
          rating: 2.5,
          address: "123 Main St"),
    ];
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
  create: (context) => SearchstoreCubit(),
  child: BlocConsumer<SearchstoreCubit, SearchstoreState>(
  listener: (context, state) {

    // TODO: implement listener
  },
  builder: (context, state) {
    searchstoremodel? Searchmodel  = SearchstoreCubit.get(context).Searchmodel ;

    return Scaffold(


        body: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.07,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.018),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
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
                              onChanged: (value){
                                if(value.isNotEmpty)
                                {
                                  SearchstoreCubit.get(context).searchbychar(text: value);
                                }

                              },

                              decoration: InputDecoration(
                                hintText: 'البحث عن متاجر ',
                                hintStyle: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontFamily: 'Cairo',
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if(state is Loadingstate)
                  const LinearProgressIndicator(),
                if(state is SuccessState)
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight:
                              MediaQuery.of(context).size.height - 150,
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: Searchmodel?.shopsData?.length ??0 ,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height:
                                  MediaQuery.of(context).size.width *
                                      0.35,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              StoreProduct(storeid: Searchmodel?.shopsData![index].id ??0),
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
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                            child: Image.asset(
                                              'images/shop3.jpg',
                                              fit: BoxFit.cover,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.35,
                                              height: double.infinity,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  Searchmodel?.shopsData![index].name??'ds',

                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Icon(Icons.location_on),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      Searchmodel?.shopsData![index].location?.city??'ds',                                                          style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors
                                                          .grey[600],
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Icon(Icons.star,
                                                        color:
                                                        Colors.yellow),
                                                    Text(
                                                       // Searchmodel?.shopsData![index].avgStars?? '5',
                                                      '5',
                                                        style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors
                                                          .grey[600],
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


    );
  },
),
);
  }
}
class Store {
  String name;
  String image;
  double rating;
  String address;

  Store(
      {required this.name,
        required this.image,
        required this.rating,
        required this.address});
}
