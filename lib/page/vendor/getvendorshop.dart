import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/account/delete/delete_cubit.dart';
import '../../bloc/account/delete/delete_state.dart';
import '../../bloc/account/logout/logout_cubit.dart';
import '../../bloc/account/logout/logout_state.dart';
import '../../bloc/getstore/getstore_cubit.dart';
import '../../bloc/location/add_location_state.dart';
import '../../component/helper.dart';
import '../../model/getvendorshop.dart';
import '../../network/endpoint.dart';
import '../../network/local/cache.dart';
import '../../theme/colors.dart';
import '../login.dart';
import '../user/storeproduct.dart';
import 'addstore.dart';

class GetVendorShop extends StatelessWidget {
  const GetVendorShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double height = MediaQuery.of(context).size.height;
            double width=MediaQuery.of(context).size.width;

            return BlocProvider(
              create: (context) => GetstoreCubit()..getvendorshop(),
              child: BlocConsumer<GetstoreCubit, GetstoreState>(
                listener: (context, state) {

                },
                builder: (context, state) {
                  const Color green = Color(0xFF169956);
                  const Color secondaryColor = Color(0xFF1F9E67);
                  GetVendorShopModel? getVendorShopModel =
                      GetstoreCubit.get(context).getVendorShopModel;

                  return getVendorShopModel != null
                      ? Scaffold(
                    drawer: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Drawer(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: <Widget>[
                            DrawerHeader(
                              decoration: const BoxDecoration(
                                color: primary,
                              ),
                              child: SizedBox(
                                height: height*0.3,
                                width: width*0.2,
                                child: getSvgIcon('welcome3.svg'),
                              ),
                            ),
                            BlocProvider(
                                create: (context)=>LogOutCubit(),
                                child:BlocConsumer<LogOutCubit,LogOutState>
                                  (
                                  listener: (context,state){
                                    if(state is LogOutSuccessState)
                                    {
                                      CacheHelper.removeData(key: 'token');
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()), (route) => false);
                                    }
                                  },
                                  builder: (context,state)
                                  {
                                    return  ConditionalBuilder(
                                        condition: state is !LogOutLoadingState,
                                        builder: (context)=>ListTile(
                                          leading:  Icon(Icons.logout_outlined,color: green,size: height*0.022+width*0.015,),
                                          title:  Text('تسجيل الخروج',style: TextStyle(fontFamily: "Cairo",fontSize:height*0.015+width*0.01,fontWeight: FontWeight.w700 ),),
                                          onTap: () {
                                            LogOutCubit.get(context).logout();
                                          },
                                        ),
                                        fallback: (context)=>const Center(child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(green),
                                        ),)
                                    );
                                  },
                                )
                            ),
                            BlocProvider(
                                create: (context)=>DeleteAccountCubit(),
                                child:BlocConsumer<DeleteAccountCubit,DeleteAccountState>
                                  (
                                  listener: (context,state){
                                    if(state is DeleteSuccessState)
                                    {
                                      CacheHelper.removeData(key: 'token');
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()), (route) => false);
                                    }
                                  },
                                  builder: (context,state)
                                  {
                                    return  ConditionalBuilder(
                                        condition: state is !DeleteLoadingState,
                                        builder: (context)=>ListTile(
                                          leading:  Icon(Icons.delete_outline_outlined,color: green,size: height*0.022+width*0.015,),
                                          title:  Text('حذف الحساب',style: TextStyle(fontFamily: "Cairo",fontSize:height*0.015+width*0.01,fontWeight: FontWeight.w700 ),),
                                          onTap: () {
                                            DeleteAccountCubit.get(context).deleteAccount();
                                          },
                                        ),
                                        fallback: (context)=>const Center(child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(green),
                                        ),)
                                    );
                                  },
                                )
                            ),
                            // إضافة قائمة العناصر الأخرى هنا
                          ],
                        ),
                      ),
                    ),
                    appBar: AppBar(
                        backgroundColor: green,
                        centerTitle: true,
                        title: const Text(
                          'متاجري',
                          style: TextStyle(fontFamily: 'Cairo'),
                        )),
                    body: RefreshIndicator(
                      color: Colors.white,
                      backgroundColor: green,
                      onRefresh: ()async=>context.read<GetstoreCubit>().getvendorshop(),
                      child: Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Column(
                            textDirection: TextDirection.rtl,
                            children: [
                              SizedBox(
                                height: height * 0.01,
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  child: Column(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxHeight: MediaQuery.of(context)
                                              .size
                                              .height -
                                              150,
                                        ),
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          itemCount: getVendorShopModel
                                              .shopsData?.length ??
                                              0,
                                          itemBuilder: (BuildContext context,
                                              int index) {
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
                                                      //  ShopInfo(shopid: getVendorShopModel?.shopsData![index].id ??0),
                                                      StoreProduct(
                                                        storeid:
                                                        getVendorShopModel
                                                            ?.shopsData![
                                                        index]
                                                            .id ??
                                                            0,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                    const Color(0xFFF4F4F4),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        15),
                                                  ),
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: Row(
                                                    textDirection:
                                                    TextDirection.rtl,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(15),
                                                        child: Image.network(
                                                          imageShopUrl +
                                                              (getVendorShopModel
                                                                  ?.shopsData![
                                                              index]
                                                                  .photo ??
                                                                  'sd'),
                                                          fit: BoxFit.cover,
                                                          width: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width *
                                                              0.35,
                                                          height:
                                                          double.infinity,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 20),
                                                      Expanded(
                                                        child: Column(
                                                          textDirection:
                                                          TextDirection.rtl,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 6,
                                                            ),
                                                            Text(
                                                              getVendorShopModel
                                                                  ?.shopsData![
                                                              index]
                                                                  .name ??
                                                                  'ds',
                                                              style:
                                                              const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            Row(
                                                              textDirection:
                                                              TextDirection
                                                                  .rtl,
                                                              children: [
                                                                const Icon(Icons
                                                                    .location_on),
                                                                const SizedBox(
                                                                    width: 10),
                                                                Text(
                                                                  getVendorShopModel
                                                                      ?.shopsData![
                                                                  index]
                                                                      .location
                                                                      ?.city ??
                                                                      'ds',
                                                                  style:
                                                                  TextStyle(
                                                                    fontSize:
                                                                    16,
                                                                    color: Colors
                                                                        .grey[
                                                                    600],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            Row(
                                                              textDirection:
                                                              TextDirection
                                                                  .rtl,
                                                              children: [
                                                                const Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .yellow),
                                                                Text(
                                                                    // getVendorShopModel
                                                                    //     ?.shopsData![
                                                                    // index]
                                                                    //     .avgStars ??
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
                                              (BuildContext context,
                                              int index) {
                                            return const SizedBox(height: 10);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                      : const Center(child: CircularProgressIndicator());
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddStore()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
