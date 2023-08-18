import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/getproductcategory/getproduct_cubitt.dart';
import '../../component/helper.dart';
import '../../model/changefaovouritemodel.dart';
import '../../model/getfavouritemodell.dart';
import '../../network/endpoint.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetproductCubitt()..getallfavourite(),
      child: BlocConsumer<GetproductCubitt, GetproductStatee>(
        listener: (context, state) {
          if(state is getallfavouriteSuccessState){
            if(state.Getfavouritemodel?.favoriteProductsData?.length == 0){
              flutterToast('لا يوجد اي عنصر في المفضلة بعد !', "error");

            }
          }
        },
        builder: (context, state) {
          getfavouritemodel? Getfavouritemodel=GetproductCubitt.get(context).Getfavouritemodel;
          const Color green=Color(0xFF169956);
          const Color secondaryColor = Color(0xFF1F9E67);
          return Getfavouritemodel!=null ?Scaffold(
            appBar: AppBar(backgroundColor: green,
              title: Text('المفضلة ',style: TextStyle(fontFamily: 'Cairo'),),
            ),
            body: Container(
              color: Colors.white60,
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: Getfavouritemodel?.favoriteProductsData?.length ?? 0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width > 600) ? 3 : 2,
                        childAspectRatio: 0.70,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Card(
                              color: Colors.white70,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.network(
                                      imageProductUrl+
                                          (Getfavouritemodel
                                              ?.favoriteProductsData![
                                          index]
                                              .picture ??
                                              'sd'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          Getfavouritemodel
                                                  ?.favoriteProductsData![index].name ??
                                              'ds',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '\$${Getfavouritemodel?.favoriteProductsData![index].price ?? 'ds'}',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
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
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Visibility(
                              visible :false,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ):Center(child:CircularProgressIndicator());
        },
      ),
    );
  }
}
////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../bloc/getproductcategory/getproduct_cubitt.dart';
// import '../../component/helper.dart';
// import '../../model/changefaovouritemodel.dart';
// import '../../model/getfavouritemodell.dart';
// import '../../network/endpoint.dart';
//
// class FavouriteScreen extends StatelessWidget {
//   const FavouriteScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => GetproductCubitt()..getallfavourite(),
//       child: BlocConsumer<GetproductCubitt, GetproductStatee>(
//         listener: (context, state) {
//           if(state is getallfavouriteSuccessState){
//             if(state.Getfavouritemodel?.favoriteProductsData?.length == 0){
//               flutterToast('لا يوجد اي عنصر في المفضلة بعد !', "error");
//
//             }
//           }
//         },
//         builder: (context, state) {
//           getfavouritemodel? Getfavouritemodel=GetproductCubitt.get(context).Getfavouritemodel;
//           const Color green=Color(0xFF169956);
//           const Color secondaryColor = Color(0xFF1F9E67);
//           return Getfavouritemodel!=null ?Scaffold(
//             appBar: AppBar(backgroundColor: green,
//               title: Text('المفضلة ',style: TextStyle(fontFamily: 'Cairo'),),
//             ),
//             body: Container(
//               color: Colors.white60,
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: GridView.builder(
//                       padding: EdgeInsets.all(16),
//                       itemCount: Getfavouritemodel?.favoriteProductsData?.length ?? 0,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount:
//                         (MediaQuery.of(context).size.width > 600) ? 3 : 2,
//                         childAspectRatio: 0.70,
//                         crossAxisSpacing: 16,
//                         mainAxisSpacing: 16,
//                       ),
//                       itemBuilder: (BuildContext context, int index) {
//                         return Stack(
//                           children: [
//                             Card(
//                               color: Colors.white70,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   AspectRatio(
//                                     aspectRatio: 1,
//                                     child: Image.network(
//                                       imageProductUrl+
//                                           (Getfavouritemodel
//                                               ?.favoriteProductsData![
//                                           index]
//                                               .picture ??
//                                               'sd'),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.all(8),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         Text(
//                                           Getfavouritemodel
//                                               ?.favoriteProductsData![index].name ??
//                                               'ds',
//                                           style: TextStyle(
//                                             fontSize: MediaQuery.of(context)
//                                                 .size
//                                                 .width *
//                                                 0.04,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         SizedBox(height: 4),
//                                         Text(
//                                           '\$${Getfavouritemodel?.favoriteProductsData![index].price ?? 'ds'}',
//                                           style: TextStyle(
//                                             fontSize: MediaQuery.of(context)
//                                                 .size
//                                                 .width *
//                                                 0.04,
//                                             color: Colors.green,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Positioned(
//                               top: 8,
//                               right: 8,
//                               child: Visibility(
//                                 visible :false,
//                                 child: Icon(
//                                   Icons.favorite,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ):Center(child:CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
