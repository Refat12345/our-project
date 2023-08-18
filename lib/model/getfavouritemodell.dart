class getfavouritemodel {
  List<FavoriteProductsData>? favoriteProductsData;

  getfavouritemodel({this.favoriteProductsData});

  getfavouritemodel.fromJson(Map<String, dynamic> json) {
    if (json['favoriteProductsData'] != null) {
      favoriteProductsData = <FavoriteProductsData>[];
      json['favoriteProductsData'].forEach((v) {
        favoriteProductsData!.add(new FavoriteProductsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.favoriteProductsData != null) {
      data['favoriteProductsData'] =
          this.favoriteProductsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavoriteProductsData {
  int? productId;
  var price;
  String? name;
  String? picture;
  var description;

  FavoriteProductsData(
      {this.productId, this.price, this.name, this.picture, this.description});

  FavoriteProductsData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    price = json['price'];
    name = json['name'];
    picture = json['picture'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['price'] = this.price;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['description'] = this.description;
    return data;
  }
}