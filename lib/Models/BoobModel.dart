class BoobModel {
  bool success;
  Data data;
  String message;

  BoobModel({this.success, this.data, this.message});

  BoobModel.fromJson(Map<String, dynamic> json) {
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
  String aboutus;
  String introOne;
  String introTwo;
  String introThree;
  String loginDataDescription;
  String approveTerms;
  String terms;
  String facebook;
  String twitter;
  String instgram;
  String whatsapp;
  String phone;
  String emailAddress;
  String andiord;
  String ios;
  String blockListWords;

  Data(
      {this.aboutus,
      this.introOne,
      this.introTwo,
      this.introThree,
      this.loginDataDescription,
      this.approveTerms,
      this.terms,
      this.facebook,
      this.twitter,
      this.instgram,
      this.whatsapp,
      this.phone,
      this.emailAddress,
      this.andiord,
      this.ios,
      this.blockListWords});

  Data.fromJson(Map<String, dynamic> json) {
    aboutus = json['aboutus'];
    introOne = json['intro_one'];
    introTwo = json['intro_two'];
    introThree = json['intro_three'];
    loginDataDescription = json['login_data_description'];
    approveTerms = json['approve_terms'];
    terms = json['terms'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    instgram = json['instgram'];
    whatsapp = json['whatsapp'];
    phone = json['phone'];
    emailAddress = json['email_address'];
    andiord = json['andiord'];
    ios = json['ios'];
    blockListWords = json['block_list_words'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aboutus'] = this.aboutus;
    data['intro_one'] = this.introOne;
    data['intro_two'] = this.introTwo;
    data['intro_three'] = this.introThree;
    data['login_data_description'] = this.loginDataDescription;
    data['approve_terms'] = this.approveTerms;
    data['terms'] = this.terms;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['instgram'] = this.instgram;
    data['whatsapp'] = this.whatsapp;
    data['phone'] = this.phone;
    data['email_address'] = this.emailAddress;
    data['andiord'] = this.andiord;
    data['ios'] = this.ios;
    data['block_list_words'] = this.blockListWords;
    return data;
  }
}
