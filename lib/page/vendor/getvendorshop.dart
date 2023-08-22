import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/getstore/getstore_cubit.dart';
import '../../bloc/location/add_location_state.dart';
import '../../model/getvendorshop.dart';
import '../../network/endpoint.dart';
import '../../theme/colors.dart';
import '../user/storeproduct.dart';
import 'addstore.dart';

class GetVendorShop extends StatelessWidget {
  const GetVendorShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double screenHeight = MediaQuery.of(context).size.height;

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
                                  height: screenHeight * 0.01,
                                ),
                                SizedBox(
                                  height: screenHeight * 0.01,
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
