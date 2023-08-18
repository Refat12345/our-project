class ProductDetailsModel {
  ProductInfo? productInfo;

  ProductDetailsModel({this.productInfo});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    productInfo = json['productInfo'] != null
        ? ProductInfo.fromJson(json['productInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productInfo != null) {
      data['productInfo'] = productInfo!.toJson();
    }
    return data;
  }
}

class ProductInfo {
  int? id;
  int? shopId;
  String? name;
  String? description;
  var price;
  List<String>? pictures;
  int? quantity;
  int? inFavorite;

  ProductInfo({
    this.id,
    this.shopId,
    this.name,
    this.description,
    this.price,
    this.pictures,
    this.quantity,
    this.inFavorite,
  });

  ProductInfo.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    shopId = json['shop_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    pictures = json['pictures'].cast<String>();
    quantity = json['quantity'];
    inFavorite = json['in_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['shop_id'] = shopId;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['pictures'] =pictures;
    data['quantity'] = quantity;
    data['in_favorite'] = inFavorite;

    return data;
  }
}
