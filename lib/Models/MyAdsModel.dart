import 'package:fasten/Models/AllCitiesModel.dart';

class MyAdsModel {
  bool success;
  Data data;
  String message;

  MyAdsModel({this.success, this.data, this.message});

  MyAdsModel.fromJson(Map<String, dynamic> json) {
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
  List<DataUser> data;
  Links links;
  Meta meta;

  Data({this.data, this.links, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<DataUser>();
      json['data'].forEach((v) {
        data.add(new DataUser.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class DataUser {
  int id;
  String name;
  String body;
  int featured;
  int adViews;
  Conversation conversation;
  String lat;
  String lng;
  int distance;
  List<AttributesData> attributesData;
  AdType adType;
  List<String> contactTypes;
  String price;
  String averageRating;
  bool isFav;
  User user;
  Category category;
  List<Images> images;
  Null video;
  List<Comments> comments;
  String status;
  Images lastImage;
  String createdAt;
  String updatedAt;

  DataUser(
      {this.id,
        this.name,
        this.body,
        this.featured,
        this.adViews,
        this.conversation,
        this.lat,
        this.lng,
        this.distance,
        this.attributesData,
        this.adType,
        this.contactTypes,
        this.price,
        this.averageRating,
        this.isFav,
        this.user,
        this.category,
        this.images,
        this.video,
        this.comments,
        this.status,
        this.lastImage,
        this.createdAt,
        this.updatedAt});

  DataUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    body = json['body'];
    featured = json['featured'];
    adViews = json['ad_views'];
    conversation = json['conversation'] != null
        ? new Conversation.fromJson(json['conversation'])
        : null;
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'];
    if (json['attributesData'] != null) {
      attributesData = new List<AttributesData>();
      json['attributesData'].forEach((v) {
        attributesData.add(new AttributesData.fromJson(v));
      });
    }
    adType =
    json['ad_type'] != null ? new AdType.fromJson(json['ad_type']) : null;
    contactTypes = json['contact_types'].cast<String>();
    price = json['price'];
    averageRating = json['averageRating'];
    isFav = json['isFav'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    video = json['video'];
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    status = json['status'];
    lastImage = json['lastImage'] != null
        ? new Images.fromJson(json['lastImage'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['body'] = this.body;
    data['featured'] = this.featured;
    data['ad_views'] = this.adViews;
    if (this.conversation != null) {
      data['conversation'] = this.conversation.toJson();
    }
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['distance'] = this.distance;
    if (this.attributesData != null) {
      data['attributesData'] =
          this.attributesData.map((v) => v.toJson()).toList();
    }
    if (this.adType != null) {
      data['ad_type'] = this.adType.toJson();
    }
    data['contact_types'] = this.contactTypes;
    data['price'] = this.price;
    data['averageRating'] = this.averageRating;
    data['isFav'] = this.isFav;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['video'] = this.video;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    if (this.lastImage != null) {
      data['lastImage'] = this.lastImage.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Conversation {
  int id;
  int toId;
  int adId;
  int fromId;
  String createdAt;
  String updatedAt;

  Conversation(
      {this.id,
        this.toId,
        this.adId,
        this.fromId,
        this.createdAt,
        this.updatedAt});

  Conversation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    toId = json['to_id'];
    adId = json['ad_id'];
    fromId = json['from_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['to_id'] = this.toId;
    data['ad_id'] = this.adId;
    data['from_id'] = this.fromId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AttributesData {
  int attributeId;
  String name;
  String type;
  List<SelectedOptions> selectedOptions;

  AttributesData(
      {this.attributeId, this.name, this.type, this.selectedOptions});

  AttributesData.fromJson(Map<String, dynamic> json) {
    attributeId = json['attribute_id'];
    name = json['name'];
    type = json['type'];
    if (json['selected_options'] != null) {
      selectedOptions = new List<SelectedOptions>();
      json['selected_options'].forEach((v) {
        selectedOptions.add(new SelectedOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attribute_id'] = this.attributeId;
    data['name'] = this.name;
    data['type'] = this.type;
    if (this.selectedOptions != null) {
      data['selected_options'] =
          this.selectedOptions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SelectedOptions {
  int id;
  String name;
  int attributeId;
  int optionId;
  int adId;

  SelectedOptions(
      {this.id, this.name, this.attributeId, this.optionId, this.adId});

  SelectedOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    attributeId = json['attribute_id'];
    optionId = json['option_id'];
    adId = json['ad_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['attribute_id'] = this.attributeId;
    data['option_id'] = this.optionId;
    data['ad_id'] = this.adId;
    return data;
  }
}

class AdType {
  int id;
  String name;
  String image;

  AdType({this.id, this.name, this.image});

  AdType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class User {
  int id;
  String name;
  String phone;
  var deviceId;
  String email;
  var avatar;
  var emailVerifiedAt;
  String status;
  String createdAt;
  String updatedAt;
  var countryId;
  var cityId;

  User(
      {this.id,
        this.name,
        this.phone,
        this.deviceId,
        this.email,
        this.avatar,
        this.emailVerifiedAt,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.countryId,
        this.cityId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    deviceId = json['device_id'];
    email = json['email'];
    avatar = json['avatar'];
    emailVerifiedAt = json['email_verified_at'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    countryId = json['country_id'];
    cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['device_id'] = this.deviceId;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    return data;
  }
}

class Category {
  int id;
  String name;
  List<Childs> childs;

  Category({this.id, this.name, this.childs});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['childs'] != null) {
      childs = new List<Childs>();
      json['childs'].forEach((v) {
        childs.add(new Childs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.childs != null) {
      data['childs'] = this.childs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childs {
  int id;
  String name;

  Childs({this.id, this.name});

  Childs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Images {
  int id;
  String name;
  String size;
  String file;
  String path;
  String fullFile;
  String mimeType;
  String fileType;
  String relationId;
  String createdAt;
  String updatedAt;

  Images(
      {this.id,
        this.name,
        this.size,
        this.file,
        this.path,
        this.fullFile,
        this.mimeType,
        this.fileType,
        this.relationId,
        this.createdAt,
        this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    size = json['size'];
    file = json['file'];
    path = json['path'];
    fullFile = json['full_file'];
    mimeType = json['mime_type'];
    fileType = json['file_type'];
    relationId = json['relation_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['size'] = this.size;
    data['file'] = this.file;
    data['path'] = this.path;
    data['full_file'] = this.fullFile;
    data['mime_type'] = this.mimeType;
    data['file_type'] = this.fileType;
    data['relation_id'] = this.relationId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Comments {
  int id;
  String body;
  User user;
  String createdAt;
  String updatedAt;

  Comments({this.id, this.body, this.user, this.createdAt, this.updatedAt});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class UserDe {
  int id;
  String name;
  String email;
  var averageRating;
  String phone;
  String avatar;
  String deviceId;
  String role;
  City city;
  Country country;
  int favoritesCount;
  int adsCount;
  String status;
  var phoneVerifiedAt;

  UserDe(
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

  UserDe.fromJson(Map<String, dynamic> json) {
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

class Links {
  String first;
  String last;
  Null prev;
  Null next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
