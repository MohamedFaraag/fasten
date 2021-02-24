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
  int currentPage;
  List<MyData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  var nextPageUrl;
  String path;
  int perPage;
  var prevPageUrl;
  int to;
  int total;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<MyData>();
      json['data'].forEach((v) {
        data.add(new MyData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class MyData {
  int id;
  String name;
  String body;
  Null video;
  String status;
  List<String> contactTypes;
  String lat;
  String lng;
  int featured;
  int adViews;
  String price;
  int userId;
  int adType;
  int categoryId;
  String createdAt;
  String updatedAt;
  bool isFav;
  String averageRating;
  Category category;
  List<Images> images;
  List comments;
  List<AttributesData> attributesData;
  Images lastImage;
  int distance;
  User user;

  MyData(
      {this.id,
      this.name,
      this.body,
      this.video,
      this.status,
      this.contactTypes,
      this.lat,
      this.lng,
      this.featured,
      this.adViews,
      this.price,
      this.userId,
      this.adType,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.isFav,
      this.averageRating,
      this.category,
      this.images,
      this.comments,
      this.attributesData,
      this.lastImage,
      this.distance,
      this.user});

  MyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    body = json['body'];
    video = json['video'];
    status = json['status'];
    contactTypes = json['contact_types'].cast<String>();
    lat = json['lat'];
    lng = json['lng'];
    featured = json['featured'];
    adViews = json['ad_views'];
    price = json['price'];
    userId = json['user_id'];
    adType = json['ad_type'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isFav = json['isFav'];
    averageRating = json['averageRating'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = new List<Null>();
      json['comments'].forEach((v) {
        comments.add(new Data.fromJson(v));
      });
    }
    if (json['attributesData'] != null) {
      attributesData = new List<AttributesData>();
      json['attributesData'].forEach((v) {
        attributesData.add(new AttributesData.fromJson(v));
      });
    }
    lastImage = json['lastImage'] != null
        ? new Images.fromJson(json['lastImage'])
        : null;
    distance = json['distance'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['body'] = this.body;
    data['video'] = this.video;
    data['status'] = this.status;
    data['contact_types'] = this.contactTypes;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['featured'] = this.featured;
    data['ad_views'] = this.adViews;
    data['price'] = this.price;
    data['user_id'] = this.userId;
    data['ad_type'] = this.adType;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['isFav'] = this.isFav;
    data['averageRating'] = this.averageRating;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    if (this.attributesData != null) {
      data['attributesData'] =
          this.attributesData.map((v) => v.toJson()).toList();
    }
    if (this.lastImage != null) {
      data['lastImage'] = this.lastImage.toJson();
    }
    data['distance'] = this.distance;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Category {
  int id;
  Name name;
  Null parentId;
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

class User {
  int id;
  String name;
  String phone;
  Null deviceId;
  String email;
  Null avatar;
  Null emailVerifiedAt;
  String status;
  String createdAt;
  String updatedAt;
  Null countryId;
  Null cityId;

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
