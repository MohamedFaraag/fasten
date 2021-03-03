import '../Helpers/Network.dart';
import '../Models/AllCountriesModel.dart';

class AllCountriesController {
  NetWork _netWork = NetWork();
  AllCountriesModel _allCountriesModel = AllCountriesModel();
  Future<AllCountriesModel> getAllCountries() async {
    // List<Map<String, dynamic>> _headers=[
    //   {
    //     'Ath':""
    //   }
    // ];
    var data = await _netWork.getData(url: 'countries');
    _allCountriesModel = AllCountriesModel.fromJson(data);
    return _allCountriesModel;
  }
}
