import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/addstore/addstore_state.dart';
import '../../bloc/location/add_location_cubit.dart';
import '../../bloc/location/add_location_state.dart';
import '../../component/helper.dart';
import '../../component/textfield.dart';
import '../../bloc/addstore/addstore_cubit.dart';
import 'dart:io';

class AddStore extends StatelessWidget {
  const AddStore({super.key});

  @override
  Widget build(BuildContext context) {
    final _nametextcontroller = TextEditingController();
    final _descriptiontextcontroller = TextEditingController();
    final _phonenumbercontroller = TextEditingController();
    final _citycontroller = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => AddstoreCubit()..getcategory(),
      child: BlocConsumer<AddstoreCubit, AddstoreState>(
        builder: (context, state) {
          File? image = AddstoreCubit.get(context).addImage;
          var listcubit = AddstoreCubit.get(context);
          const Color green = Color(0xFF169956);
          return Scaffold(
              appBar: AppBar(
                backgroundColor: green,
                centerTitle: true,
                title: const Text(
                  'اضافة متجر ',
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
                                AddstoreCubit.get(context).getImage();
                              },
                              child: ClipRRect(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image(
                                  image: image == null
                                      ? const AssetImage('images/shop3.jpg')
                                      : FileImage(image)
                                          as ImageProvider<Object>,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: constraints.maxHeight / 3,
                                ),
                              )

                              // Image.asset(
                              //   'images/shop3.jpg',
                              //  fit: BoxFit.contain,
                              // width: double.infinity,
                              // ),
                              ),
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
                          const Text(
                            'ادخل التصنيف ',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: DropdownButton(
                                hint: const Text(
                                  'اختر التصنيف ',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                  ),
                                ),
                                isExpanded: true,
                                underline: SizedBox(),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                ),
                                iconSize: 36,
                                style: const TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                value: listcubit.selectitem,
                                items: listcubit.items.map((valueitem) {
                                  return DropdownMenuItem(
                                    value: valueitem,
                                    child: Text(valueitem),
                                  );
                                }).toList(),
                                onChanged: (newvalue) {
                                  listcubit.changeitemselected(newvalue);
                                  listcubit.prints();

                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        BlocProvider(create: (context)=>AddLocationCubit(),
                        child: BlocConsumer<AddLocationCubit,AddLocationState>
                          (
                          listener: (context,state){
                            if(state is GetLocationSuccessState)
                            {
                              AddLocationCubit.get(context).addLocation();
                            }
                            if(state is AddLocationSuccessState)
                            {
                              AddstoreCubit.get(context).addstore(
                                latitude: state.latitude,
                                longitude: state.longitude,
                                name: _nametextcontroller.text,
                                description:
                                _descriptiontextcontroller.text,
                                phonenumber: _phonenumbercontroller.text,
                                city: _citycontroller.text,
                              );
                            }
                          },
                          builder: (context,state)
                          {
                            AddLocationCubit add=AddLocationCubit.get(context);
                            return ConditionalBuilder(
                                condition: state is ! GetLocationLoadingState,
                                builder: (context)=>Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: constraints.maxWidth * 0.4,
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        add.getLocation();
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
                                fallback: (context)=>const Center(child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(green),
                                ),)
                            );
                          },
                        ))
                        ],
                      ),
                    ),
                  );
                },
              ));
        },
        listener: (context, state) {
          if (state is SuccessState) {
            flutterToast(state.model.message ?? '', "sucess");
          }
        },
      ),
    );
  }
}
