import 'package:flutter/material.dart';

class Delivery_Show_Requist extends StatelessWidget {
  const Delivery_Show_Requist({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        const Color green=Color(0xFF169956);

        return Scaffold(
          appBar: AppBar(backgroundColor: green,
            title: const Text('استعراض الطلبات', style: TextStyle(
              fontFamily: 'Cairo',
            ),),

          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height - 150,
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.width * 0.30,
                            child: InkWell(
                              onTap: () {

                              },
                              child: Container(
                                decoration: BoxDecoration(

                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                width: double.infinity,
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        'images/dd.jpg',
                                        fit: BoxFit.cover,
                                        width: MediaQuery.of(context).size.width * 0.35,
                                        height: double.infinity,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 6,),
                                          Text(
                                            'رقم الطلب ',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.bold,
                                            ),
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
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 10);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),


        );
      },

    );
  }
}
