class getshopinfomodel {
  ShopData? shopData;

  getshopinfomodel({this.shopData});

  getshopinfomodel.fromJson(Map<String, dynamic> json) {
    shopData = json['shopData'] != null
        ? new ShopData.fromJson(json['shopData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shopData != null) {
      data['shopData'] = this.shopData!.toJson();
    }
    return data;
  }
}

class ShopData {
  String? name;
  String? description;
  String? phoneNumber;
  String? photo;
  int? isOpen;
  int? shopState;
  Location? location;
  Vendor? vendor;
  String? avgStars;

  ShopData(
      {this.name,
        this.description,
        this.phoneNumber,
        this.photo,
        this.isOpen,
        this.shopState,
        this.location,
        this.vendor,
        this.avgStars});

  ShopData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    phoneNumber = json['phone_number'];
    photo = json['photo'];
    isOpen = json['is_open'];
    shopState = json['shop_state'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    vendor =
    json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
    avgStars = json['avg_stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['phone_number'] = this.phoneNumber;
    data['photo'] = this.photo;
    data['is_open'] = this.isOpen;
    data['shop_state'] = this.shopState;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    data['avg_stars'] = this.avgStars;
    return data;
  }
}

class Location {
  int? id;
  String? street;
  String? city;
  String? building;
  String? floor;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;

  Location(
      {this.id,
        this.street,
        this.city,
        this.building,
        this.floor,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    street = json['street'];
    city = json['city'];
    building = json['building'];
    floor = json['floor'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['street'] = this.street;
    data['city'] = this.city;
    data['building'] = this.building;
    data['floor'] = this.floor;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Vendor {
  int? id;
  String? phoneNumber;
  String? password;
  String? createdAt;
  String? updatedAt;

  Vendor(
      {this.id,
        this.phoneNumber,
        this.password,
        this.createdAt,
        this.updatedAt});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}