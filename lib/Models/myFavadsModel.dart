class MyFavAdsModel {
  bool success;
  Data data;
  String message;

  MyFavAdsModel({this.success, this.data, this.message});

  MyFavAdsModel.fromJson(Map<String, dynamic> json) {
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
  int countFavorites;
  List favorites;

  Data({this.countFavorites, this.favorites});

  Data.fromJson(Map<String, dynamic> json) {
    countFavorites = json['count_favorites'];
    if (json['favorites'] != null) {
      favorites = new List<Null>();
      json['favorites'].forEach((v) {
        favorites.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_favorites'] = this.countFavorites;
    if (this.favorites != null) {
      data['favorites'] = this.favorites.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
