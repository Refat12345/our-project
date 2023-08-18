class searchproductmodel {
  List<ProductsData>? productsData;

  searchproductmodel({this.productsData});

  searchproductmodel.fromJson(Map<String, dynamic> json) {
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
  var description;
 // Null? amountOfSale;
  String? picture;
  int? inFavorite;
 // Null? avgStars;

  ProductsData(
      {
        this.id,
        this.name,
        this.price,
        this.description,
        //this.amountOfSale,
        this.picture,
        this.inFavorite,
        //this.avgStars
      });

  ProductsData.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
   // amountOfSale = json['amount_of_sale'];
    picture = json['picture'];
    inFavorite = json['in_favorite'];
    //avgStars = json['avg_stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
   // data['amount_of_sale'] = this.amountOfSale;
    data['picture'] = this.picture;
    data['in_favorite'] = this.inFavorite;
   // data['avg_stars'] = this.avgStars;
    return data;
  }
}