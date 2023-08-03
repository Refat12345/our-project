import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    bool _showSettings = false;
    List<Product> _products = [
      Product(
          name: 'المنتج الاول',
          price: 10.00,
          image: 'images/shoes2.png',
          description: "A shoe is a type of footwear "),
      Product(
          name: 'المنتج الثاني',
          price: 20.00,
          image: 'images/shoes3.png',
          description: "A shoe is a type of footwear "),
      Product(
          name: 'المنتج الثالث',
          price: 40.00,
          image: 'images/shoes5.png',
          description: "A shoe is a type of footwear "),
      Product(
          name: 'المنتج الرابع',
          price: 50.00,
          image: 'images/shoes6.png',
          description: "A shoe is a type of footwear "),
      Product(
          name: 'المنتج الرابع',
          price: 50.00,
          image: 'images/shoes6.png',
          description: "A shoe is a type of footwear "),
      Product(
          name: 'المنتج الرابع',
          price: 50.00,
          image: 'images/shoes6.png',
          description: "A shoe is a type of footwear "),
      Product(
          name: 'المنتج الرابع',
          price: 50.00,
          image: 'images/shoes6.png',
          description: "A shoe is a type of footwear "),
      Product(
          name: 'المنتج الرابع',
          price: 50.00,
          image: 'images/shoes6.png',
          description: "A shoe is a type of footwear "),
      Product(
          name: 'المنتج الرابع',
          price: 50.00,
          image: 'images/shoes6.png',
          description: "A shoe is a type of footwear "),
      Product(
          name: 'المنتج الرابع',
          price: 50.00,
          image: 'images/shoes6.png',
          description: "A shoe is a type of footwear "),
    ];
    List<Map<String, dynamic>> _categories = const [
      {
        'name': 'الالبسة',
        'image': 'images/clothes.jpg',
      },
      {
        'name': 'الكهربائيات',
        'image': 'images/ele.jpg',
      },
      {
        'name': 'الطعام',
        'image': 'images/food.jpg',
      },
      {
        'name': 'الاحذية',
        'image': 'images/shoes.jpg',
      },
    ];
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
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
                children: <Widget>[
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
                          'المنتجات',
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
                    child: GridView.builder(
                        padding: EdgeInsets.all(screenWidth * 0.036),
                        itemCount: _products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.72,
                          crossAxisSpacing: screenWidth * 0.036,
                          mainAxisSpacing: screenWidth * 0.036,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.asset(
                                        _products[index].image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(screenWidth * 0.018),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[
                                          Text(
                                            _products[index].name,
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.03,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Cairo'
                                            ),
                                          ),
                                          SizedBox(height: screenWidth * 0.007),
                                          Text(
                                            '\$${_products[index].price
                                                .toStringAsFixed(
                                                2)}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,),),
                                        ],),),
                                  ],),),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          );
                        }
                    ),),
                ],
              ),
            ),
          );
        }
    );

}
}

class Product {
  final String name;
  final double price;
  final String image;
  final String description;

  Product({required this.name,
    required this.price,
    required this.image,
    required this.description});
}
