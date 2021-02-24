import 'package:fasten/Helpers/Network.dart';
import 'package:fasten/Models/AllCategoryModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllCategoryController {
  NetWork _netWork = NetWork();
  AllCategoryModel _allCategoryModel = AllCategoryModel();
  Future<AllCategoryModel> getAllCategory() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getString('token'));
    // List<Map<String, dynamic>> _header = [
    //   // {'Authorization': prefs.getString('token');
    //   // }
    // ];
    var data = await _netWork.getData(url: 'categories');
    _allCategoryModel = AllCategoryModel.fromJson(data);
    return _allCategoryModel;
  }
}
