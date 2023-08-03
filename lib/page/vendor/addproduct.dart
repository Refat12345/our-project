import 'package:flutter/material.dart';

import '../../textfield.dart';
class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    const Color green=Color(0xFF169956);
    const Color secondaryColor = Color(0xFF1F9E67);
    final _nametextcontroller = TextEditingController();
    final _descriptiontextcontroller = TextEditingController();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/shop3.jpg',
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'اسم المنتج ',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 16,
                      color: secondaryColor
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormFieldCompany(controller: _nametextcontroller, hintText: 'اسم المنتج'),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    'ادخل التوصيف  ',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 16,
                        color: secondaryColor

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormFieldCompany(controller: _descriptiontextcontroller, hintText: 'ادخل التوصيف '),
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
                        color: secondaryColor

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormFieldCompany(controller: _descriptiontextcontroller, hintText: 'ادخل السعر '),
                  ),
                  const Text(
                    'ادخل الكمية  ',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 16,
                        color: secondaryColor

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormFieldCompany(controller: _descriptiontextcontroller, hintText: 'ادخل الكمية '),
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
      ),
    );
  }
}
