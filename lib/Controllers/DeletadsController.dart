import '../Helpers/Network.dart';
import '../Models/DeletadsModel.dart';

import 'package:dio/dio.dart';

class DeletadsController {
  NetWork _network = NetWork();
  DeletadsModel _deletadsModel = DeletadsModel();
  Future<void> deletads({String adsid}) async {
    List<Map<String, dynamic>> _headers = [
      {
        'Authorization':
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZm9zdGFuLmRlbW8uYXNvbC10ZWMuY29tXC9hcGlcL3YxXC9sb2dpbiIsImlhdCI6MTYxNDA5NjQ4MSwibmJmIjoxNjE0MDk2NDgxLCJqdGkiOiJ3VHNxemdLQlRLT1I3U2xuIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.1puShp0jCnbnVPzm1VBWgOLzoUckh6hEZWE2wWF2gas",
      }
      // {'Authorization': prefs.getString('token');
      // }
    ];
    var response =
        await _network.deleteData(url: 'ads/$adsid', headers: _headers);
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
      _deletadsModel = DeletadsModel.fromJson(response);
      return {
        "result": _deletadsModel.message,
        "err": _deletadsModel.message,
        "success": true,
      };
    }
    return {
      "result": _deletadsModel.message,
      "err": _deletadsModel.message,
      "success": false,
    };
  }
}
