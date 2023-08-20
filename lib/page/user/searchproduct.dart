import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/page/user/product_details.dart';
import '../../bloc/searchcubit/searchstore_cubit.dart';
import '../../model/searchproductmodel.dart';
import '../../network/endpoint.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => SearchstoreCubit(),
      child: BlocConsumer<SearchstoreCubit, SearchstoreState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          searchproductmodel? Searchproductmodel =
              SearchstoreCubit.get(context).Searchproductmodel;

          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
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
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.018),
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
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      SearchstoreCubit.get(context)
                                          .searchproduct(text: value);
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'البحث عن منتجات ',
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
                    if (state is searchproductLoadingstate)
                      const LinearProgressIndicator(),
                    Expanded(
                      child: Container(
                        child: GridView.builder(
                            padding: EdgeInsets.all(screenWidth * 0.036),
                            itemCount:
                                Searchproductmodel?.productsData?.length ?? 0,
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
                                          builder: (context) => ProductDetails(
                                                id: Searchproductmodel
                                                        .productsData![index]
                                                        .id ??
                                                    1,
                                              )));
                                },
                                child: Stack(
                                  children: [
                                    Card(
                                        child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          AspectRatio(
                                            aspectRatio: 1,
                                            child: Image.network(
                                              imageProductUrl +
                                                  (Searchproductmodel
                                                          ?.productsData![index]
                                                          .picture ??
                                                      'sd'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(
                                                screenWidth * 0.018),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  Searchproductmodel
                                                          ?.productsData![index]
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
                                                  '\$${Searchproductmodel?.productsData![index].price ?? 'ds'}',
                                                  style: TextStyle(
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
                                    )),
                                    Positioned(
                                      top: constraints.maxWidth * 0.48,
                                      left: constraints.maxWidth * 0.001,
                                      child: Visibility(
                                        visible: true,
                                        child: IconButton(
                                          icon: CircleAvatar(
                                            radius:
                                                constraints.maxWidth * 0.030,
                                            backgroundColor:
                                                SearchstoreCubit.get(context)
                                                                .favourites[
                                                            Searchproductmodel!
                                                                .productsData?[
                                                                    index]
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
                                            SearchstoreCubit.get(context)
                                                .changefavourite(
                                              id: Searchproductmodel
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
                    )
                  ],
                ),
              ),
            ));
          });
        },
      ),
    );
  }
}
///////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project2/page/user/storeproduct.dart';
//
// import '../../bloc/searchcubit/searchstore_cubit.dart';
// import '../../model/searchproductmodel.dart';
// import '../../model/searchstoremodel.dart';
// import '../../network/endpoint.dart';
// class SearchProduct extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return BlocProvider(
//       create: (context) => SearchstoreCubit(),
//       child: BlocConsumer<SearchstoreCubit, SearchstoreState>(
//         listener: (context, state) {
//
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           searchproductmodel? Searchproductmodel  = SearchstoreCubit.get(context).Searchproductmodel ;
//
//           return Scaffold(
//
//
//               body: Container(
//                 color: Colors.grey[200],
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 5.0),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: screenHeight * 0.07,
//                       ),
//                       Align(
//                         alignment: Alignment.topCenter,
//                         child: FractionallySizedBox(
//                           widthFactor: 0.9,
//                           child: Container(
//                             padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.018),
//                             decoration: BoxDecoration(
//                               color: Colors.grey[300],
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                             child: Row(
//                               children: [
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.search_outlined,
//                                     size: screenWidth * 0.06,
//                                   ),
//                                   onPressed: () {},
//                                 ),
//                                 Expanded(
//                                   child: TextField(
//                                     onChanged: (value){
//                                       if(value.isNotEmpty)
//                                       {
//                                         SearchstoreCubit.get(context).searchproduct(text: value);
//                                       }
//
//                                     },
//
//                                     decoration: InputDecoration(
//                                       hintText: 'البحث عن منتجات ',
//                                       hintStyle: TextStyle(
//                                         fontSize: screenWidth * 0.04,
//                                         fontFamily: 'Cairo',
//                                       ),
//                                       border: InputBorder.none,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       if(state is Loadingstate)
//                         const LinearProgressIndicator(),
//                       if(state is SuccessState)
//                         Expanded(
//                           //  color: Colors.white60,
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: GridView.builder(
//                                   padding: EdgeInsets.all(16),
//                                   itemCount:  Searchproductmodel?.productsData?.length ??0,
//                                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: (MediaQuery.of(context).size.width > 600) ? 3 : 2,
//                                     childAspectRatio: 0.72,
//                                     crossAxisSpacing: 16,
//                                     mainAxisSpacing: 16,
//                                   ),
//                                   itemBuilder: (BuildContext context, int index) {
//                                     return Stack(
//                                       children: [
//                                         Card(
//                                           color: Colors.white70,
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: <Widget>[
//                                               AspectRatio(
//                                                 aspectRatio: 1,
//                                                 child: Image.network(
//                                                   imageProductUrl+
//                                                       (Searchproductmodel
//                                                           ?.productsData![
//                                                       index]
//                                                           .picture ??
//                                                           'sd'),
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsets.all(8),
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                                   children: <Widget>[
//                                                     Text(
//                                                       Searchproductmodel?.productsData![index].name??'ds',
//                                                       style: TextStyle(
//                                                         fontSize: MediaQuery.of(context).size.width * 0.04,
//                                                         fontWeight: FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                     SizedBox(height: 4),
//                                                     Text(
//                                                       '\$${Searchproductmodel?.productsData![index].price??'ds'
//                                                       }',
//                                                       style: TextStyle(
//                                                         fontSize: MediaQuery.of(context).size.width * 0.04,
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
//                                         Positioned(
//                                           top: 8,
//                                           right: 8,
//                                           child: Icon(
//                                             Icons.favorite,
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               )
//
//
//           );
//         },
//       ),
//     );
//   }
// }
//////////
