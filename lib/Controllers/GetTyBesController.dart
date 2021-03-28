import '../Helpers/Network.dart';
import '../Models/GetTyBesModel.dart';

class GetTyBesController {
  NetWork _netWork = NetWork();
  GetTyBesModel _getTyBesModel = GetTyBesModel();
  Future<GetTyBesModel> getDataa(int id) async {
    List<Map<String, dynamic>> _headers = [{}];
    var data = await _netWork.getData(url: 'ads?ad_type=$id');
    _getTyBesModel = GetTyBesModel.fromJson(data);
    return _getTyBesModel;
  }
}
