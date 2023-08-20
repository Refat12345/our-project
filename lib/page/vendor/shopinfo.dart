import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/getshopinfo/getshopinfo_cubit.dart';
import '../../model/getshopinfo.dart';
import '../../network/endpoint.dart';

class ShopInfo extends StatelessWidget {
  var shopid;

  ShopInfo({super.key,
    required this.shopid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetshopinfoCubit()..getshopinfo(id: shopid),
      child: BlocConsumer<GetshopinfoCubit, GetshopinfoState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          getshopinfomodel? Getshopmodel =
              GetshopinfoCubit.get(context).Getshopinfomodel;
          String storeStatus =
              Getshopmodel?.shopData?.isOpen == 0 ? 'مفتوح' : 'مغلق';
          const Color green = Color(0xFF169956);
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Getshopmodel != null
                  ? Scaffold(
                      appBar: AppBar(
                        backgroundColor: green,
                        title: const Text(
                          'تفاصيل المتجر',
                          style: TextStyle(fontFamily: 'Cairo'),
                        ),
                        centerTitle: true,
                      ),
                      body: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight * 0.3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      imageShopUrl +
                                          (Getshopmodel.shopData?.photo ??
                                              'sd'),
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                ':اسم المتجر',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                              Text(
                                Getshopmodel.shopData?.name ?? 'ds',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: green),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                ':رقم الهاتف',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                              Text(
                                ' ${Getshopmodel.shopData?.phoneNumber ?? 'ds'}',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    color: green),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                ':المدينة',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                              Text(
                                ' ${Getshopmodel.shopData?.location?.city ?? 'ds'}',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    color: green),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                ':حالة المتجر',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                              Text(
                                ' $storeStatus',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    color: green),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                ':التوصيف',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                              Text(
                                Getshopmodel.shopData?.description ?? 'ds',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    color: green),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                          child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(green),
                      )));
            },
          );
        },
      ),
    );
  }
}
