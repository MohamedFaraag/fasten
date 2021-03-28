import '../Helpers/Network.dart';
import '../Models/AllCitiesModel.dart';

class AllCitiesController {
  NetWork _netWork = NetWork();
  AllCitiesModel _allCitiesModel = AllCitiesModel();
  Future<AllCitiesModel> getAllcities(String id) async {
    List<Map<String, dynamic>> _headers = [{}];
    var data = await _netWork.getData(url: 'countries/$id');
    _allCitiesModel = AllCitiesModel.fromJson(data);
    return _allCitiesModel;
  }
}
