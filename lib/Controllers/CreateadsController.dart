import 'package:dio/dio.dart';
import '../Helpers/Network.dart';
import '../Models/CreateadsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateadsController {
  NetWork _netWork = NetWork();
  CreateadsModel _createadModel = CreateadsModel();
  Future<Map<String, dynamic>> createads({
    String name,
    String body,
    var category_Id,
    var ad_typeId,
    String price,
    String contname,
    List<int> attributes1,
    var attributes2,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    List<Map<String, dynamic>> _headers = [
      // {
      //   'Authorization':
      //       "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZm9zdGFuLmRlbW8uYXNvbC10ZWMuY29tXC9hcGlcL3YxXC9sb2dpbiIsImlhdCI6MTYxNDA5NjQ4MSwibmJmIjoxNjE0MDk2NDgxLCJqdGkiOiJ3VHNxemdLQlRLT1I3U2xuIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.1puShp0jCnbnVPzm1VBWgOLzoUckh6hEZWE2wWF2gas",
      // }
      {'Authorization': prefs.getString('token')}
    ];
    FormData formData = FormData.fromMap(
      {
        'name': 'TestINANDROID',
        'body': "ANDROID",
        'contact_types':["whatsup","phone"],
        'category_id': 1,
        'ad_type': 1,
        'price': 411,
        'attributes[1]': ["1"],
        'attributes[2]': ["2"],
      },
    );
    var response = await _netWork.postData(
        url: 'ads', formData: formData, headers: _headers[0]);
    print(response);
    if (response == 'not found') {
      return {
        "result": null,
        "err": 'Failed',
        "success": false,
      };
    } else if (response == null) {
      return {
        "result": 'error',
        "err": 'Failed',
        "success": false,
      };
    } else if (response['success'] == true) {
      _createadModel = CreateadsModel.fromJson(response);
      return {
        "result": _createadModel.message,
        "id": _createadModel.data.id,
        "success": true,
      };
    }
    return {
      "result": _createadModel.message,
      "err": _createadModel.message,
      "success": false,
    };
  }
}
