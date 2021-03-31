import 'package:fasten/Helpers/Network.dart';
import '../Models/AllAttributesModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllAttributesController {
  NetWork _netWork = NetWork();
  AllAttributesModel _allAttributesModel = AllAttributesModel();
  Future<AllAttributesModel> AllAttributes() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getString('token'));
    // List<Map<String, dynamic>> _header = [
    //   // {'Authorization': prefs.getString('token');
    //   // }
    // ];
    var data = await _netWork.getData(url: 'attributes-types');
    _allAttributesModel = AllAttributesModel.fromJson(data);
    return _allAttributesModel;
  }
}
