class getproductbycategorymodel {
  List<ProductsData>? productsData;

  getproductbycategorymodel({this.productsData});

  getproductbycategorymodel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  var price;
  String? picture;
  String? shopName;
  int? inFavorite;
  String? date;

  ProductsData(
      {this.id,
        this.name,
        this.price,
        this.picture,
        this.shopName,
        this.inFavorite,
        this.date});

  ProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    picture = json['picture'];
    shopName = json['shop_name'];
    inFavorite = json['in_favorite'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['picture'] = this.picture;
    data['shop_name'] = this.shopName;
    data['in_favorite'] = this.inFavorite;
    data['date'] = this.date;
    return data;
  }
}