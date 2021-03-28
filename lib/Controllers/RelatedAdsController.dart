import '../Helpers/Network.dart';
import '../Models/RelatedAdsModel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class RelatedAdsController {
  NetWork _netWork = NetWork();
  RelatedAdsModel _relatedAdsModel = RelatedAdsModel();
  Future<RelatedAdsModel> getRelatedAds(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> _headers = [
      {'Authorization': prefs.getString('token')}
    ];
    var data = await _netWork.getData(url: 'related-ads/$id');
    _relatedAdsModel = RelatedAdsModel.fromJson(data);
    return _relatedAdsModel;
  }
}
