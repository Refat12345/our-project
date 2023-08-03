import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productDescription;
  final double productPrice;

  ProductDetailsScreen({
    required this.imageUrl,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [

                    IconButton(onPressed: (){}, icon:Icon(Icons.minimize_rounded) ),
                    Text(
                      '44',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: (){}, icon:Icon(Icons.add) ),
                    SizedBox(width: 95,),
                    Text(
                      productName,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                  ],
                ),
                SizedBox(height: 2.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 8.0),
                    Text('5.0', style: TextStyle(fontSize: 16.0)),
                    SizedBox(width: 7,),

                  ],
                ),
                SizedBox(height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '\$${productPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 160,),
                    Container(
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Container(
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Container(
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),


                    SizedBox(width: 7,),

                  ],
                ),
                SizedBox(height: 20.0),


                SizedBox(height: 16.0),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 22.0),
                ),
                SizedBox(height: 10,),
                Text(
                  productDescription,
                  style: TextStyle(fontSize: 16.0,color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
