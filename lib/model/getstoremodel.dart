// class GetStoreModel {
//   List<Data>? data;
//
//   GetStoreModel({this.data});
//
//   GetStoreModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   int? id;
//   String? name;
//   String? description;
//   String? phoneNumber;
//   String? photo;
//   int? isOpen;
//   int? shopState;
//   Location? location;
//   Vendor? vendor;
//   String? avgStars;
//
//   Data(
//       {this.id,
//         this.name,
//         this.description,
//         this.phoneNumber,
//         this.photo,
//         this.isOpen,
//         this.shopState,
//         this.location,
//         this.vendor,
//         this.avgStars});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     phoneNumber = json['phone_number'];
//     photo = json['photo'];
//     isOpen = json['is_open'];
//     shopState = json['shop_state'];
//     location = json['location'] != null
//         ? new Location.fromJson(json['location'])
//         : null;
//     vendor =
//     json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
//     avgStars = json['avg_stars'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['phone_number'] = this.phoneNumber;
//     data['photo'] = this.photo;
//     data['is_open'] = this.isOpen;
//     data['shop_state'] = this.shopState;
//     if (this.location != null) {
//       data['location'] = this.location!.toJson();
//     }
//     if (this.vendor != null) {
//       data['vendor'] = this.vendor!.toJson();
//     }
//     data['avg_stars'] = this.avgStars;
//     return data;
//   }
// }
//
// class Location {
//   int? id;
//   String? street;
//   String? city;
//   String? building;
//   String? floor;
//   String? latitude;
//   String? longitude;
//   String? createdAt;
//   String? updatedAt;
//
//   Location(
//       {this.id,
//         this.street,
//         this.city,
//         this.building,
//         this.floor,
//         this.latitude,
//         this.longitude,
//         this.createdAt,
//         this.updatedAt});
//
//   Location.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     street = json['street'];
//     city = json['city'];
//     building = json['building'];
//     floor = json['floor'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['street'] = this.street;
//     data['city'] = this.city;
//     data['building'] = this.building;
//     data['floor'] = this.floor;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class Vendor {
//   int? id;
//   String? phoneNumber;
//   String? password;
//   String? createdAt;
//   String? updatedAt;
//
//   Vendor(
//       {this.id,
//         this.phoneNumber,
//         this.password,
//         this.createdAt,
//         this.updatedAt});
//
//   Vendor.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     phoneNumber = json['phone_number'];
//     password = json['password'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['phone_number'] = this.phoneNumber;
//     data['password'] = this.password;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
class GetStoreModel {
  List<ShopsData>? shopsData;

  GetStoreModel({this.shopsData});

  GetStoreModel.fromJson(Map<String, dynamic> json) {
    if (json['shopsData'] != null) {
      shopsData = <ShopsData>[];
      json['shopsData'].forEach((v) {
        shopsData!.add(new ShopsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shopsData != null) {
      data['shopsData'] = this.shopsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShopsData {
  int? id;
  String? name;
  String? description;
  String? phoneNumber;
  String? photo;
  int? isOpen;
  int? shopState;
  Location? location;
  Vendor? vendor;
  String? avgStars;
  int? inFavorite;

  ShopsData(
      {this.id,
        this.name,
        this.description,
        this.phoneNumber,
        this.photo,
        this.isOpen,
        this.shopState,
        this.location,
        this.vendor,
        this.avgStars,
        this.inFavorite});

  ShopsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    inFavorite = json['in_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    data['in_favorite'] = this.inFavorite;
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