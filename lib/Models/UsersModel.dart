class UsersModel {
  bool success;
  Data data;
  String message;

  UsersModel({this.success, this.data, this.message});

  UsersModel.fromJson(Map<String, dynamic> json) {
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
  User user;
  String token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int id;
  String name;
  String email;
  String averageRating;
  String phone;
  String avatar;
  String deviceId;
  String role;
  var city;
  var country;
  int favoritesCount;
  int adsCount;
  String status;
  var phoneVerifiedAt;

  User(
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

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    averageRating = json['averageRating'];
    phone = json['phone'];
    avatar = json['avatar'];
    deviceId = json['device_id'];
    role = json['role'];
    city = json['city'];
    country = json['country'];
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
    data['city'] = this.city;
    data['country'] = this.country;
    data['favorites_count'] = this.favoritesCount;
    data['ads_count'] = this.adsCount;
    data['status'] = this.status;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    return data;
  }
}
