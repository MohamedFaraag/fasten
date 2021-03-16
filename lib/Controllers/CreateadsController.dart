import 'package:dio/dio.dart';
import 'package:fasten/Helpers/Network.dart';
import 'package:fasten/Models/CreateadsModel.dart';
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
    var attributes1,
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
        'name': name,
        'body': body,
        'contact_types[1]': "whatsapp",
        'contact_types[2]': "chat",
        'contact_types[3]': "phone",
        'category_id': category_Id,
        'ad_type': ad_typeId,
        'price': price,
        'attributes[1][$attributes1]': attributes1,
        'attributes[2][$attributes2]': attributes2,
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
    } else if (response['success']) {
      _createadModel = CreateadsModel.fromJson(response);
      return {
        "result": _createadModel.message,
        "err": _createadModel.message,
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
