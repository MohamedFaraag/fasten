import '../Helpers/Network.dart';
import '../Models/BoobModel.dart';

class BoobController {
  NetWork _netWork = NetWork();
  BoobModel _boobModel = BoobModel();
  Future<BoobModel> getBoobData() async {
    var data = await _netWork.getData(url: 'settings');
    _boobModel = BoobModel.fromJson(data);
    return _boobModel;
  }
}
