import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import '../../bloc/editstoree/editstoree_cubit.dart';
import '../../component/textfield.dart';
import '../../model/getshopinfo.dart';
import '../../network/endpoint.dart';

class EditStore extends StatelessWidget {
  int id;

  EditStore({super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditstoreeCubit()..getshopinfo(id: id),
      child: BlocConsumer<EditstoreeCubit, EditstoreeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          getshopinfomodel? Getshopmodel =
              EditstoreeCubit.get(context).Getshopinfomodel;

          File? image = EditstoreeCubit.get(context).addImage;
          final _nametextcontroller = TextEditingController();
          _nametextcontroller.text = Getshopmodel?.shopData?.name ?? '';
          final _descriptiontextcontroller = TextEditingController();
          _descriptiontextcontroller.text =
              Getshopmodel?.shopData?.description ?? '';
          final _phonenumbercontroller = TextEditingController();
          _phonenumbercontroller.text =
              Getshopmodel?.shopData?.phoneNumber ?? '';

          final _citycontroller = TextEditingController();
          _citycontroller.text = Getshopmodel?.shopData?.location?.city ?? '';

          const Color green = Color(0xFF169956);


          return Getshopmodel != null
              ? Scaffold(
                  appBar: AppBar(
                    backgroundColor: green,
                    title: const Text('تعديل متجر'),
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
                                    EditstoreeCubit.get(context).getImage();
                                  },
                                  child: Image(
                                    image: image == null
                                        ? NetworkImage(
                                            imageShopUrl +
                                                (Getshopmodel
                                                        .shopData?.photo ??
                                                    'sd'),
                                          )
                                        : FileImage(image)
                                            as ImageProvider<Object>,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: constraints.maxHeight / 3,
                                  )),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                'اسم المتجر ',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormFieldCompany(
                                    controller: _nametextcontroller,
                                    hintText: 'ادخل اسم المتجر '),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                'ادخل التوصيف  ',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormFieldCompany(
                                    controller: _descriptiontextcontroller,
                                    hintText: 'ادخل التوصيف '),
                              ),
                              const Text(
                                'ادخل رقم الهاتف  ',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormFieldCompany(
                                    controller: _phonenumbercontroller,
                                    hintText: 'ادخل رقم الهاتف '),
                              ),
                              const Text(
                                'ادخل المدينة  ',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormFieldCompany(
                                    controller: _citycontroller,
                                    hintText: 'ادخل المدينة '),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: constraints.maxWidth * 0.4,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      EditstoreeCubit.get(context).editstore(
                                        name: _nametextcontroller.text,
                                        description:
                                            _descriptiontextcontroller.text,
                                        phonenumber:
                                            _phonenumbercontroller.text,
                                        city: _citycontroller.text,
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
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
