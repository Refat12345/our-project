import '../network/local/cache.dart';

class getproductmodel {
  List<ProductsData>? productsData;

  getproductmodel({this.productsData});

  getproductmodel.fromJson(Map<String, dynamic> json) {
    if (json['productsData'] != null) {
      productsData = <ProductsData>[];
      json['productsData'].forEach((v) {
        productsData!.add(new ProductsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productsData != null) {
      data['productsData'] = this.productsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsData {
  var id;
  var name;
  var quantity;
  var price;
  var picture;
  var inFavorite;
  var date;

  ProductsData(
      {this.id,
        this.name,
        this.quantity,
        this.price,
        this.picture,
        this.inFavorite,
        this.date});

  ProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    picture = json['picture'];
    if(CacheHelper.getData(key: 'type')=='customer'){
      inFavorite = json['in_favorite'];
    }
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['picture'] = this.picture;
    data['in_favorite'] = this.inFavorite;
    data['date'] = this.date;
    return data;
  }
}