import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/page/user/product_details.dart';

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

  StoreProduct({
    required this.storeid,
  });


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => GetproductCubit()..getproductbyshopid(id:storeid ),
      child: BlocConsumer<GetproductCubit, GetproductState>(
        listener: (context, state) {
          if (state is SuccessState){
            if(state.getProductmodel?.productsData?.length ==0){
              flutterToast('لا يوجد اي منتج في هذا المتجر بعد!', "error");

            }


          }
          if( state is SuccesschangefavouriteState){
            if((state.model.status ?? false)){

              flutterToast(state.model.message.toString(), "sucess");

            }
          }

          if( state is Open_CloseSuccessState){

              flutterToast(state.model.message.toString(), "sucess");


          }




          // TODO: implement listener
        },
        builder: (context, state) {
          const Color green=Color(0xFF169956);
          const Color secondaryColor = Color(0xFF1F9E67);
          String type =  CacheHelper.getData(key: 'type');
          double screenWidth = MediaQuery
              .of(context)
              .size
              .width;
          double screenHeight = MediaQuery
              .of(context)
              .size
              .height;
          getproductmodel? getProductmodel  = GetproductCubit.get(context).getProductmodel ;

          return  getProductmodel != null ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.green,
                  title: Text('المنتجات',style: TextStyle(fontFamily: 'Cairo'),),
                    actions:  [
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'info') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShopInfo(shopid: storeid),
                              ),
                            );
                          }
                          else if(value == 'edit') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditStore(id: storeid),
                              ),
                            );
                          }
                          else{

                            GetproductCubit.get(context).open_closeshop(id: storeid);

                          }

                        },
                        itemBuilder: (BuildContext context) {
                          String? userType = CacheHelper.getData(key: 'type');
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

                          if(userType == 'vendor') {
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


                          if(userType == 'vendor') {
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
                    ]


                ),
                body:  Container(
                  child: GridView.builder(
                      padding: EdgeInsets.all(screenWidth * 0.036),
                      itemCount: getProductmodel?.productsData?.length ??0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.70,
                        crossAxisSpacing: screenWidth * 0.036,
                        mainAxisSpacing: screenWidth * 0.036,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetails(id: getProductmodel?.productsData![index].id,)));

                          },
                          child: Stack(
                            children: [
                              Card(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.network(
                                          imageProductUrl+
                                              (getProductmodel
                                                  ?.productsData![
                                              index]
                                                  .picture ??
                                                  'sd'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(screenWidth * 0.018),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: <Widget>[
                                            Text(
                                              getProductmodel?.productsData![index].name??'ds',
                                              style: TextStyle(
                                                  fontSize: screenWidth * 0.04,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Cairo'
                                              ),
                                            ),
                                            SizedBox(height: screenWidth * 0.007),
                                            Text(
                                              '\$${getProductmodel?.productsData![index].price??'ds'
                                              }',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,),),
                                          ],),),
                                    ],),
                                ),),
                              Positioned(
                                top: constraints.maxWidth * 0.48,
                                left: constraints.maxWidth * 0.001,
                                child: Visibility(
                                  visible: type == 'customer' ,
                                  child: IconButton(
                                    icon: CircleAvatar(
                                      radius: constraints.maxWidth * 0.030,
                                      backgroundColor: GetproductCubit.get(context).favourites[getProductmodel!.productsData?[index].id] == 1
                                          ? Colors.red
                                          : Colors.grey,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: constraints.maxWidth * 0.05,
                                      ),
                                    ),
                                    onPressed: () {
                                      GetproductCubit.get(context).changefavourite(
                                        id: getProductmodel!.productsData?[index].id,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                ),
                floatingActionButton: type == 'vendor'
                    ? FloatingActionButton(backgroundColor: secondaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddProduct(id:storeid),
                      ),
                    );
                  },
                  child: Icon(Icons.add),
                )
                    : null,



              );
            }

          ) : Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }


}
// return getProductmodel !=null ?Scaffold(
//
// appBar: AppBar(backgroundColor: green,
// title: Text('المنتجات'),
// actions: CacheHelper.getData(key: 'type') == 'vendor' ? [
// PopupMenuButton<String>(
// itemBuilder: (BuildContext context) {
// return [
// PopupMenuItem(
// value: 'info',
// child: ListTile(
// leading: Icon(Icons.info),
// title: Text('معلومات المتجر'),
// subtitle: Text('عرض تفاصيل المتجر'),
// ),
// ),
// PopupMenuItem(
// value: 'edit',
// child: ListTile(
// leading: Icon(Icons.edit),
// title: Text('تعديل معلومات المتجر'),
// subtitle: Text('تعديل تفاصيل المتجر'),
// ),
// ),
// ];
// },
// onSelected: (String value) {
// if (value == 'info') {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// ShopInfo(shopid: storeid),
//
// ),
// );                      } else if (value == 'edit') {
//
// }
// },
// ),
// ] : [],
// // ... rest of your code
// ),
// body:
// Container(
// color: Colors.white60,
// child: Column(
// children: [
// Expanded(
// child: GridView.builder(
// padding: EdgeInsets.all(16),
// itemCount:  getProductmodel?.productsData?.length ??0,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: (MediaQuery.of(context).size.width > 600) ? 3 : 2,
// childAspectRatio: 0.70,
// crossAxisSpacing: 16,
// mainAxisSpacing: 16,
// ),
// itemBuilder: (BuildContext context, int index) {
// return Stack(
// children: [
// Card(
// color: Colors.white70,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// AspectRatio(
// aspectRatio: 1,
// child: Image.network(
// imageProductUrl+
// (getProductmodel
//     ?.productsData![
// index]
//     .picture ??
// 'sd'),
// fit: BoxFit.cover,
// ),
// ),
// Padding(
// padding: EdgeInsets.all(8),
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: <Widget>[
// Text(
// getProductmodel?.productsData![index].name??'ds',
// style: TextStyle(
// fontSize: MediaQuery.of(context).size.width * 0.04,
// fontWeight: FontWeight.bold,
// ),
// ),
// SizedBox(height: 4),
// Text(
// '\$${getProductmodel?.productsData![index].price??'ds'
// }',
// style: TextStyle(
// fontSize: MediaQuery.of(context).size.width * 0.04,
// color: Colors.green,
// fontWeight: FontWeight.bold,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// Positioned(
// top: 170,
// left: 1,
// child: Visibility(
// visible: type == 'customer',
// child: IconButton(
// icon: CircleAvatar(
// radius: 15,
// backgroundColor: GetproductCubit.get(context).favourites[getProductmodel!.productsData?[index].id] == 1
// ? Colors.red
//     : Colors.grey,
// child: Icon(
// Icons.favorite,
// color: Colors.white,
// size: 19,
// ),
// ),
// onPressed: () {
// GetproductCubit.get(context).changefavourite(
// id: getProductmodel!.productsData?[index].id,
// );
// },
// ),
// ),
// ),
// ],
// );
// },
// ),
// ),
// ],
// ),
// ),
// floatingActionButton: type == 'vendor'
// ? FloatingActionButton(backgroundColor: secondaryColor,
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => AddProduct(id:storeid),
// ),
// );
// },
// child: Icon(Icons.add),
// )
//     : null,
//
//

// ):Center(child:CircularProgressIndicator());

////////////////////////////////////////////////
// body: Container(
// color: Colors.white60,
// child: LayoutBuilder(
// builder: (BuildContext context, BoxConstraints constraints) {
// return Column(
// children: [
// Expanded(
// child: GridView.builder(
// padding: EdgeInsets.all(16),
// itemCount: getProductmodel?.productsData?.length ?? 0,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
// childAspectRatio: 0.70,
// crossAxisSpacing: 16,
// mainAxisSpacing: 16,
// ),
// itemBuilder: (BuildContext context, int index) {
// String imageUrl = imageProductUrl +
// (getProductmodel?.productsData?[index]?.picture ?? 'sd');
// return Stack(
// children: [
// Card(
// color: Colors.grey,
// child: SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// AspectRatio(
// aspectRatio: 1,
// child: Image.network(
// imageUrl,
// fit: BoxFit.cover,
// ),
// ),
// Padding(
// padding: EdgeInsets.all(8),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text(
// getProductmodel?.productsData?[index]?.name ?? 'ds',
// style: TextStyle(
// fontSize: constraints.maxWidth * 0.04,
// fontWeight: FontWeight.bold,
// fontFamily: 'Cairo'
// ),
// ),
// SizedBox(height: 2),
// Text(
// '\$${getProductmodel?.productsData?[index]?.price ?? 'ds'}',
// style: TextStyle(
// fontSize: constraints.maxWidth * 0.04,
// color: Colors.green,
// fontWeight: FontWeight.bold,
// fontFamily: 'Cairo'
//
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ),
// Positioned(
// top: constraints.maxWidth * 0.28,
// left: constraints.maxWidth * 0.001,
// child: Visibility(
// visible: type == 'customer',
// child: IconButton(
// icon: CircleAvatar(
// radius: constraints.maxWidth * 0.025,
// backgroundColor: GetproductCubit.get(context).favourites[getProductmodel!.productsData?[index].id] == 1
// ? Colors.red
//     : Colors.grey,
// child: Icon(
// Icons.favorite,
// color: Colors.white,
// size: constraints.maxWidth * 0.03,
// ),
// ),
// onPressed: () {
// GetproductCubit.get(context).changefavourite(
// id: getProductmodel!.productsData?[index].id,
// );
// },
// ),
// ),
// ),
// ],
// );
// },
// ),
// ),
// ],
// );
// },
// ),
// ),
//////////////////////////////////////////////////////////
// body: Container(
// decoration: BoxDecoration(
// gradient: LinearGradient(
// colors: [Colors.white24, Colors.teal],
// begin: Alignment.topLeft,
// end: Alignment.bottomRight,
// ),
// ),
// child: LayoutBuilder(
// builder: (BuildContext context, BoxConstraints constraints) {
// return Padding(
// padding: EdgeInsets.all(16),
// child: Column(
// children: [
// Expanded(
// child: GridView.builder(
// padding: EdgeInsets.all(16),
// itemCount: getProductmodel?.productsData?.length ?? 0,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
// childAspectRatio: 0.60,
// crossAxisSpacing: 9,
// mainAxisSpacing: 14,
// ),
// itemBuilder: (BuildContext context, int index) {
// String imageUrl = imageProductUrl +
// (getProductmodel?.productsData?[index]?.picture ?? 'sd');
// return Stack(
// children: [
// Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15),
// ),
// elevation: 5,
// color: Colors.white,
// child: SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// AspectRatio(
// aspectRatio: 1,
// child: ClipRRect(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(15),
// topRight: Radius.circular(15),
// ),
// child: Image.network(
// imageUrl,
// fit: BoxFit.cover,
// ),
// ),
// ),
// Padding(
// padding: EdgeInsets.all(8),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text(
// getProductmodel?.productsData?[index]?.name ?? 'ds',
// style: TextStyle(
// fontSize: constraints.maxWidth * 0.04,
// fontWeight: FontWeight.bold,
// fontFamily: 'Cairo'
// ),
// ),
// SizedBox(height: 2),
// Text(
// '\$${getProductmodel?.productsData?[index]?.price ?? 'ds'}',
// style: TextStyle(
// fontSize: constraints.maxWidth * 0.04,
// color: Colors.green,
// fontWeight: FontWeight.bold,
// fontFamily: 'Cairo'
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ),
// Positioned(
// top: constraints.maxWidth * 0.48,
// left: constraints.maxWidth * 0.001,
// child: Visibility(
// visible: type == 'customer',
// child: IconButton(
// icon: CircleAvatar(
// radius: constraints.maxWidth * 0.030,
// backgroundColor: GetproductCubit.get(context).favourites[getProductmodel!.productsData?[index].id] == 1
// ? Colors.red
//     : Colors.grey,
// child: Icon(
// Icons.favorite,
// color: Colors.white,
// size: constraints.maxWidth * 0.05,
// ),
// ),
// onPressed: () {
// GetproductCubit.get(context).changefavourite(
// id: getProductmodel!.productsData?[index].id,
// );
// },
// ),
// ),
// ),
// ],
// );
// },
// ),
// ),
// ],
// ),
// );
// },
// ),
// ),