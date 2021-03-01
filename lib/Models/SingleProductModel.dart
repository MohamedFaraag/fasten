class SingleProductModel {
  bool success;
  Data data;
  String message;

  SingleProductModel({this.success, this.data, this.message});

  SingleProductModel.fromJson(Map<String, dynamic> json) {
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
  String body;
  int featured;
  int adViews;
  String lat;
  String lng;
  int distance;
  Null conversation;
  List<AttributesData> attributesData;
  AdType adType;
  List<String> contactTypes;
  String price;
  String averageRating;
  bool isFav;
  User user;
  Category category;
  List<Images> images;
  var video;
  List comments;
  String createdAt;
  String updatedAt;
  String status;

  Data(
      {this.id,
        this.name,
        this.body,
        this.featured,
        this.adViews,
        this.lat,
        this.lng,
        this.distance,
        this.conversation,
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
        this.createdAt,
        this.updatedAt,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    body = json['body'];
    featured = json['featured'];
    adViews = json['ad_views'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'];
    conversation = json['conversation'];
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
      comments = new List();
      json['comments'].forEach((v) {
        comments.add(new Data.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['body'] = this.body;
    data['featured'] = this.featured;
    data['ad_views'] = this.adViews;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['distance'] = this.distance;
    data['conversation'] = this.conversation;
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    return data;
  }
}

class AttributesData {
  int attributeId;
  String name;
  List<SelectedOptions> selectedOptions;

  AttributesData({this.attributeId, this.name, this.selectedOptions});

  AttributesData.fromJson(Map<String, dynamic> json) {
    attributeId = json['attribute_id'];
    name = json['name'];
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
    if (this.selectedOptions != null) {
      data['selected_options'] =
          this.selectedOptions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SelectedOptions {
  int id;
  int optionId;
  int attributeId;
  int adId;

  SelectedOptions({this.id, this.optionId, this.attributeId, this.adId});

  SelectedOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    optionId = json['option_id'];
    attributeId = json['attribute_id'];
    adId = json['ad_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['option_id'] = this.optionId;
    data['attribute_id'] = this.attributeId;
    data['ad_id'] = this.adId;
    return data;
  }
}

class AdType {
  int id;
  String name;

  AdType({this.id, this.name});

  AdType.fromJson(Map<String, dynamic> json) {
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
  var type;

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
        this.cityId,
        this.type});

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
    type = json['type'];
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
    data['type'] = this.type;
    return data;
  }
}

class Category {
  int id;
  Name name;
  var parentId;
  String createdAt;
  String updatedAt;

  Category({this.id, this.name, this.parentId, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Name {
  String en;
  String ar;

  Name({this.en, this.ar});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
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
