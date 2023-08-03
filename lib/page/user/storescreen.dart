import 'package:flutter/material.dart';
import 'package:project2/page/user/storeproduct.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    final List<Store> stores = [
      Store(
          name: 'المتجر الاول',
          image: 'images/shop1.jpg',
          rating: 3.5,
          address: "123 Main St"),
      Store(
          name: 'المتجر الثاني',
          image: 'images/shop2.jpg',
          rating: 4.5,
          address: "456 Market St"),
      Store(
          name: 'المتجر الثالث',
          image: 'images/shop3.jpg',
          rating: 5.0,
          address: "660 Kani Sr"),
      Store(
          name: 'المتجر الرابع',
          image: 'images/shop4.jpg',
          rating: 2.5,
          address: "123 Main St"),
    ];
    List<Map<String, dynamic>> _categories = const [
      {
        'name': 'الالبسة',
        'image': 'images/clothes.jpg',
      },
      {
        'name': 'كهربائيات',
        'image': 'images/ele.jpg',
      },
      {
        'name': 'طعام',
        'image': 'images/food.jpg',
      },
      {
        'name': 'احذية',
        'image': 'images/shoes.jpg',
      },
    ];
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        double screenWidth = MediaQuery
            .of(context)
            .size
            .width;
        double screenHeight = MediaQuery
            .of(context)
            .size
            .height;
        return Container(
          color: Colors.grey[200],

          child: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.07,
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.018),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.search_outlined,
                            size: screenWidth * 0.06,
                          ),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'البحث ',
                              hintStyle: TextStyle(fontSize: screenWidth * 0.04,fontFamily: 'Cairo'),
                              border: InputBorder.none,
                              // suffixIcon: GestureDetector(
                              //   onTap: () {
                              //
                              //   },
                              //   child: Container(
                              //
                              //     width: screenWidth * 0.1,
                              //     height: screenWidth * 0.1,
                              //     color: Colors.amber,
                              //     child: FittedBox(
                              //       fit: BoxFit.scaleDown,
                              //       child: Icon(
                              //         Icons.filter_alt_outlined,
                              //         color: Colors.deepPurple[300],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.027),
                      child: Text(
                        'التصنيفات',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: screenWidth * 0.055,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                  height: screenHeight * 0.120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.018),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  screenWidth * 0.053),
                              child: Container(
                                width: screenWidth * 0.220,
                                height: screenWidth * 0.170,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF2BC0E4),
                                      Color(0xFFEAECC6),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    _categories[index]['image'],
                                    width: screenWidth * 0.099,
                                    height: screenWidth * 0.099,
                                  ),

                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.003),
                            Text(
                              _categories[index]['name'],
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'Cairo'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.027),
                      child: Text(
                        'المتاجر',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: screenWidth * 0.055,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
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
                              itemCount: stores.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: MediaQuery.of(context).size.width * 0.35,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => StoreProduct(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF4F4F4),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: Image.asset(
                                              stores[index].image,
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
                                                  stores[index].name,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Icon(Icons.location_on),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      stores[index].address,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey[600],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [

                                                    Icon(
                                                        Icons.star,
                                                        color:
                                                        Colors.yellow

                                                    ),
                                                    Text(stores[index].rating.toString(),
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.grey[600],)),
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
              ],
            ),
          ),
        );

      }

    );
  }
}


class Store {
  String name;
  String image;
  double rating;
  String address;

  Store(
      {required this.name,
      required this.image,
      required this.rating,
      required this.address});
}


