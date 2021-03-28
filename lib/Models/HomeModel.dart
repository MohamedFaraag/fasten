import 'package:fasten/Models/AllCitiesModel.dart';

class HomeModel {
  bool success;
  Data data;
  String message;

  HomeModel({this.success, this.data, this.message});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  List<Sliders> sliders;
  List<Types> types;
  List<FeaturedAds> featuredAds;
  List<LatestAds> latestAds;

  Data({this.sliders, this.types, this.featuredAds, this.latestAds});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = new List<Sliders>();
      json['sliders'].forEach((v) {
        sliders.add(new Sliders.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = new List<Types>();
      json['types'].forEach((v) {
        types.add(new Types.fromJson(v));
      });
    }
    if (json['featuredAds'] != null) {
      featuredAds = new List<FeaturedAds>();
      json['featuredAds'].forEach((v) {
        featuredAds.add(new FeaturedAds.fromJson(v));
      });
    }
    if (json['latestAds'] != null) {
      latestAds = new List<LatestAds>();
      json['latestAds'].forEach((v) {
        latestAds.add(new LatestAds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sliders != null) {
      data['sliders'] = this.sliders.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    if (this.featuredAds != null) {
      data['featuredAds'] = this.featuredAds.map((v) => v.toJson()).toList();
    }
    if (this.latestAds != null) {
      data['latestAds'] = this.latestAds.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sliders {
  int id;
  String image;
  int adId;

  Sliders({this.id, this.image, this.adId});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    adId = json['ad_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['ad_id'] = this.adId;
    return data;
  }
}

class Types {
  int id;
  String name;
  String image;

  Types({this.id, this.name, this.image});

  Types.fromJson(Map<String, dynamic> json) {
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

class FeaturedAds {
  int id;
  String name;
  String body;
  int featured;
  int adViews;
  var conversation;
  var lat;
  var lng;
  int distance;
  List<AttributesData> attributesData;
  Types adType;
  List<String> contactTypes;
  String price;
  String averageRating;
  bool isFav;
  User user;
  Category category;
  List<Images> images;
  String video;
  List<Comments> comments;
  String status;
  Images lastImage;
  String createdAt;
  String updatedAt;

  FeaturedAds(
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

  FeaturedAds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    body = json['body'];
    featured = json['featured'];
    adViews = json['ad_views'];
    conversation = json['conversation'];
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
        json['ad_type'] != null ? new Types.fromJson(json['ad_type']) : null;
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
    data['conversation'] = this.conversation;
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
  List childs;

  Category({this.id, this.name, this.childs});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['childs'] != null) {
      childs = new List();
      json['childs'].forEach((v) {
        childs.add(new Category.fromJson(v));
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

class UserData {
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

  UserData(
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

  UserData.fromJson(Map<String, dynamic> json) {
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

class LatestAds {
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
  Types adType;
  List<String> contactTypes;
  String price;
  String averageRating;
  bool isFav;
  User user;
  Category category;
  List<Images> images;
  var video;
  List comments;
  String status;
  Images lastImage;
  String createdAt;
  String updatedAt;

  LatestAds(
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

  LatestAds.fromJson(Map<String, dynamic> json) {
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
        json['ad_type'] != null ? new Types.fromJson(json['ad_type']) : null;
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
      comments = new List();
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

class CategoryD {
  int id;
  String name;
  List<Childs> childs;

  CategoryD({this.id, this.name, this.childs});

  CategoryD.fromJson(Map<String, dynamic> json) {
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
