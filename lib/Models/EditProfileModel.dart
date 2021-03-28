class EditProfileModel {
  bool success;
  Data data;
  String message;

  EditProfileModel({this.success, this.data, this.message});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int id;
  String name;
  String email;
  String averageRating;
  String phone;
  String avatar;
  String deviceId;
  String role;
  City city;
  Country country;
  int favoritesCount;
  int adsCount;
  String status;
  Null phoneVerifiedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.averageRating,
        this.phone,
        this.avatar,
        this.deviceId,
        this.role,
        this.city,
        this.country,
        this.favoritesCount,
        this.adsCount,
        this.status,
        this.phoneVerifiedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    averageRating = json['averageRating'];
    phone = json['phone'];
    avatar = json['avatar'];
    deviceId = json['device_id'];
    role = json['role'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    favoritesCount = json['favorites_count'];
    adsCount = json['ads_count'];
    status = json['status'];
    phoneVerifiedAt = json['phone_verified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['averageRating'] = this.averageRating;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['device_id'] = this.deviceId;
    data['role'] = this.role;
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country.toJson();
    }
    data['favorites_count'] = this.favoritesCount;
    data['ads_count'] = this.adsCount;
    data['status'] = this.status;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    return data;
  }
}

class City {
  int id;
  String name;
  int countryId;
  String createdAt;
  String updatedAt;

  City({this.id, this.name, this.countryId, this.createdAt, this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Country {
  int id;
  String name;
  List<Cities> cities;
  String createdAt;
  String updatedAt;

  Country({this.id, this.name, this.cities, this.createdAt, this.updatedAt});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['cities'] != null) {
      cities = new List<Cities>();
      json['cities'].forEach((v) {
        cities.add(new Cities.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.cities != null) {
      data['cities'] = this.cities.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
class Cities {
  int id;
  String name;
  int countryId;
  String createdAt;
  String updatedAt;

  Cities({this.id, this.name, this.countryId, this.createdAt, this.updatedAt});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
