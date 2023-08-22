import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/getproductshopid/getproduct_cubit.dart';
import '../../component/helper.dart';
import '../../component/textfield.dart';

class AddProduct extends StatelessWidget {
  int id;

  AddProduct({super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    const Color green = Color(0xFF169956);
    const Color secondaryColor = Color(0xFF1F9E67);
    final _nametextcontroller = TextEditingController();
    final _descriptiontextcontroller = TextEditingController();
    final _pricecontroller = TextEditingController();
    final _quantitycontroller = TextEditingController();
    final _weightcontroller = TextEditingController();
    final _brandtextcontroller = TextEditingController();

    return BlocProvider(
      create: (context) => GetproductCubit(),
      child: BlocConsumer<GetproductCubit, GetproductState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AddProductSuccessState) {
            flutterToast(state.model.message ?? '', "sucess");
          }
        },
        builder: (context, state) {
          File? image = GetproductCubit.get(context).addImage;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: green,
              title: Text(
                'اضافة منتج',
                style: TextStyle(
                  fontFamily: 'Cairo',
                ),
              ),
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              GetproductCubit.get(context).getImage();
                            },
                            child: Image(
                              image: image == null
                                  ? const AssetImage('images/shop3.jpg')
                                  : FileImage(image) as ImageProvider<Object>,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: constraints.maxHeight / 3,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'اسم المنتج ',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 16,
                              color: secondaryColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormFieldCompany(
                              controller: _nametextcontroller,
                              hintText: 'اسم المنتج'),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Text(
                          'ادخل التوصيف  ',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 16,
                              color: secondaryColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormFieldCompany(
                              controller: _descriptiontextcontroller,
                              hintText: 'ادخل التوصيف '),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'ادخل السعر  ',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 16,
                              color: secondaryColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormFieldCompany(
                              controller: _pricecontroller,
                              hintText: 'ادخل السعر '),
                        ),
                        const Text(
                          'ادخل الكمية  ',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 16,
                              color: secondaryColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormFieldCompany(
                              controller: _quantitycontroller,
                              hintText: 'ادخل الكمية '),
                        ),

                        const Text(
                          'ادخل الماركة  ',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 16,
                              color: secondaryColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormFieldCompany(
                              controller: _brandtextcontroller,
                              hintText: 'ادخل الماركة '),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: constraints.maxWidth * 0.4,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                GetproductCubit.get(context).addproduct(
                                  name: _nametextcontroller.text,
                                  description: _descriptiontextcontroller.text,
                                  price: _pricecontroller.text,
                                  quantity: _quantitycontroller.text,
                                  brand_name: _brandtextcontroller.text,
                                  shopid: id,
                                );
                              },
                              icon: const Icon(Icons.add),
                              label: const Text(
                                'اضافة',
                                style: TextStyle(fontFamily: 'Cairo'),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: green,
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
