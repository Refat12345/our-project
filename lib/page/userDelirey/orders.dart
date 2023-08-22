import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../bloc/orders/orders_cubit.dart';
import '../../bloc/orders/orders_state.dart';
import '../../component/helper.dart';
import '../../model/orders/orders.dart';
import '../../network/local/cache.dart';
import '../../theme/colors.dart';
import 'oredr_details.dart';

class Orders extends StatelessWidget {
  Orders(this.type,{super.key});
  String type;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
        create: (context)
        {
          if(type=="orders")
          {
            return OrdersCubit()..getHistoryOrders()..soso(context)..intialstate(context);
          }else {
            return  OrdersCubit()..getApprovedOrders()..soso(context)..intialstate(context);
          }
        },
        child: BlocConsumer<OrdersCubit, OrdersState>(
          listener: (context, state) {},
          builder: (context, state) {
            OrdersCubit ordersCubit=OrdersCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: type=='orders'? const Text('الطلبات'):const Text('الطلبات المقبولة'),
                titleTextStyle:
                    TextStyle(fontFamily: "Cairo", fontSize: height * 0.023),
                backgroundColor: green,
                actions: [
                 type=='orders'&&CacheHelper.getData(key: 'type')=='delivery'? IconButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Orders('order')));
                 }, icon: const Icon(Icons.menu,)):const SizedBox()
                ],
              ),
              body: RefreshIndicator(
                color: Colors.white,
                backgroundColor: green,
                onRefresh: () async {
                  await context.read<OrdersCubit>().getHistoryOrders();
                },
                child: LayoutBuilder(
                  builder: (context, constrain) =>
                      OrdersCubit.get(context).ordersModel != null
                          ? (OrdersCubit.get(context)
                                      .ordersModel!
                                      .ordersInfo!
                                      .length !=
                                  0
                              ? Padding(
                                  padding: EdgeInsets.only(top: height * 0.023),
                                  child: ListView.separated(
                                      physics: const AlwaysScrollableScrollPhysics(),
                                      itemBuilder: (context, index) => item(ordersCubit,
                                          constrain.maxHeight,
                                          constrain.maxWidth,
                                          OrdersCubit.get(context)
                                              .ordersModel!
                                              .ordersInfo![index],
                                          context),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: constrain.maxWidth * 0.01 +
                                                constrain.maxHeight * 0.02,
                                          ),
                                      itemCount: OrdersCubit.get(context)
                                          .ordersModel!
                                          .ordersInfo!
                                          .length),
                                )
                              : Center(
                                  child: Text(
                                    "لا يوجد طلبات",
                                    style: TextStyle(
                                        fontFamily: "Cairo",
                                        fontSize: height * 0.02 + width * 0.02,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ))
                          : const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(green),
                              ),
                            ),
                ),
              ),
            );
          },
        ));
  }

  Widget item(OrdersCubit ordersCubit,double height, double width, OrdersInfo ordersInfo,
      BuildContext context) {
    String status = "";
    if (ordersInfo.orderState == "processing" ||
        ordersInfo.orderState == "approved") {
      status = "قيد المعالجة";
    } else if (ordersInfo.orderState == "delivered") {
      status = "تم التسليم";
    } else if (ordersInfo.orderState == "delivery") {
      status = "جاري التوصيل";
    } else if (ordersInfo.orderState == "rejected") {
      status = "تم الرفض";
    }
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.01 + height * 0.02,
          right: width * 0.01 + height * 0.02),
      child: ZoomTapAnimation(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrderDetails(type,ordersCubit,ordersInfo.id!)));
          },
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.white.withOpacity(0.85),
            child: Column(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                    height: height * 0.145 + width * 0.12,
                    width: double.infinity,
                    child: Image(
                      image:
                          NetworkImage(EndPoint.imageUrl + ordersInfo.image!),
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: height * 0.01, bottom: height * 0.01),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      CacheHelper.getData(key: 'type') == "customer"
                          ? Text(
                              ' : الحالة',
                              style: TextStyle(
                                  fontFamily: "Cairo",
                                  fontSize: height * 0.015 + width * 0.015),
                            )
                          : Text(
                              ' :الإسم',
                              style: TextStyle(
                                  fontFamily: "Cairo",
                                  fontSize: height * 0.015 + width * 0.015),
                            ),
                      CacheHelper.getData(key: 'type') == "customer"
                          ? Text(
                              status,
                              style: TextStyle(
                                  fontFamily: "Cairo",
                                  fontSize: height * 0.014 + width * 0.014,
                                  color: green,
                                  fontWeight: FontWeight.w700),
                            )
                          : Text(
                              '${ordersInfo.customerName} ',
                              style: TextStyle(
                                  fontFamily: "Cairo",
                                  fontSize: height * 0.014 + width * 0.014,
                                  color: green,
                                  fontWeight: FontWeight.w700),
                            ),
                      const Spacer(),
                      CacheHelper.getData(key: 'type') == "delivery"
                          ? Padding(
                              padding: EdgeInsets.only(left: height * 0.01),
                              child: Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    ' : الرقم',
                                    style: TextStyle(
                                        fontFamily: "Cairo",
                                        fontSize:
                                            height * 0.015 + width * 0.015),
                                  ),
                                  Text(
                                    ordersInfo.customerNumber!,
                                    style: TextStyle(
                                        fontFamily: "Cairo",
                                        fontSize:
                                            height * 0.014 + width * 0.014,
                                        color: green,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
