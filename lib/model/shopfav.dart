class getfavuritestoremodel {
  List<FavoriteShopData>? favoriteShopData;

  getfavuritestoremodel({this.favoriteShopData});

  getfavuritestoremodel.fromJson(Map<String, dynamic> json) {
    if (json['favoriteShopData'] != null) {
      favoriteShopData = <FavoriteShopData>[];
      json['favoriteShopData'].forEach((v) {
        favoriteShopData!.add(new FavoriteShopData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.favoriteShopData != null) {
      data['favoriteShopData'] =
          this.favoriteShopData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavoriteShopData {
  int? isOpen;
  Location? location;
  int? shopId;
  String? name;
  String? photo;
  String? description;

  FavoriteShopData(
      {this.isOpen,
        this.location,
        this.shopId,
        this.name,
        this.photo,
        this.description});

  FavoriteShopData.fromJson(Map<String, dynamic> json) {
    isOpen = json['is_open'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    shopId = json['shop_id'];
    name = json['name'];
    photo = json['photo'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_open'] = this.isOpen;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['shop_id'] = this.shopId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['description'] = this.description;
    return data;
  }
}

class Location {
  String? city;

  Location({this.city});

  Location.fromJson(Map<String, dynamic> json) {
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    return data;
  }
}