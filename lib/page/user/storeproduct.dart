import 'package:flutter/material.dart';
class StoreProduct extends StatelessWidget {
  const StoreProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> _products = [
      Product(
          name: 'Product 1',
          price: 10.00,
          image: 'images/shoes2.png',
          description: "A shoe is a type of footwear "),
      Product(
          name: 'Product 2',
          price: 20.00,
          image: 'images/shoes3.png',
          description: "A shoe is a type of footwear "),
      Product(
          name: 'Product 4',
          price: 40.00,
          image: 'images/shoes5.png',
          description: "A shoe is a type of footwear "),
      Product(
          name: 'Product 5',
          price: 50.00,
          image: 'images/shoes6.png',
          description: "A shoe is a type of footwear "),
    ];
    return Scaffold(
      body:
      Column(
        children: [
          SizedBox(height: 60,),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.72,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
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
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _products[index].name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '\$${_products[index].price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
class Product {
  final String name;
  final double price;
  final String image;
  final String description;

  Product(
      {required this.name,
        required this.price,
        required this.image,
        required this.description});
}