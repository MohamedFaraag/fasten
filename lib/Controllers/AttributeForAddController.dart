import 'package:fasten/Helpers/Network.dart';
import 'package:fasten/Models/AttributeForAddModel.dart';

class AttributeForAddController {
  NetWork _netWork = NetWork();
  AttributeForAddModel _attributeForAddModel = AttributeForAddModel();
  Future<AttributeForAddModel> getAttModel() async {
    List<Map<String, dynamic>> _header = [];
    var data = await _netWork.getData(url: 'attributes');
    _attributeForAddModel = AttributeForAddModel.fromJson(data);
    return _attributeForAddModel;
  }
}
