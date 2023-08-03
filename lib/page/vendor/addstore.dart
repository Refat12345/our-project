import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/addstore/addstore_state.dart';
import '../../textfield.dart';
import '../../bloc/addstore/addstore_cubit.dart';

class AddStore extends StatelessWidget {
  const AddStore({super.key});



  @override
  Widget build(BuildContext context) {
    final _nametextcontroller = TextEditingController();
    final _descriptiontextcontroller = TextEditingController();
    const Color green=Color(0xFF169956);
    const Color secondaryColor = Color(0xFF1F9E67);
    return BlocProvider(
      create: (BuildContext context) => AddstoreCubit(),
      child: BlocConsumer<AddstoreCubit, AddstoreState>(
        listener: (context, state) {},
        builder: (context, state) {
          var listcubit = AddstoreCubit.get(context);
          const Color green=Color(0xFF169956);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: green,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'images/shop3.jpg',
                          fit: BoxFit.contain,
                          width: double.infinity,
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
                          child: TextFormFieldCompany(controller: _nametextcontroller, hintText: 'ادخل اسم المتجر '),
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
                          child: TextFormFieldCompany(controller: _descriptiontextcontroller, hintText: 'ادخل التوصيف '),
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
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: constraints.maxWidth * 0.4,
                            child: ElevatedButton.icon(
                              onPressed: () {},
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
            )
          );
        },
      ),
    );
  }
}




