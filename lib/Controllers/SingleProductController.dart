import '../Helpers/Network.dart';
import '../Models/SingleProductModel.dart';

class SingleProductContoller {
  NetWork _netWork = NetWork();
  SingleProductModel _singleProductModel = SingleProductModel();
  Future<SingleProductModel> getSingleProduct(int i) async {
    List<Map<String, dynamic>> _headers = [{

          'Authorization':
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZm9zdGFuLmRlbW8uYXNvbC10ZWMuY29tXC9hcGlcL3YxXC9sb2dpbiIsImlhdCI6MTYxNDU5OTMxNSwibmJmIjoxNjE0NTk5MzE1LCJqdGkiOiJwV3ZXRmk3WHRFbG1BakY3Iiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.pCYcW6HKOBaiGAIXpvhzjHRS2KWQxbsL38j2seHifws",

    }];
    var data = await _netWork.getData(url: 'ads/$i',headers: _headers);
    _singleProductModel = SingleProductModel.fromJson(data);
    return _singleProductModel;
  }
}

//eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZm9zdGFuLmRlbW8uYXNvbC10ZWMuY29tXC9hcGlcL3YxXC9sb2dpbiIsImlhdCI6MTYxNDU5OTMxNSwibmJmIjoxNjE0NTk5MzE1LCJqdGkiOiJwV3ZXRmk3WHRFbG1BakY3Iiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.pCYcW6HKOBaiGAIXpvhzjHRS2KWQxbsL38j2seHifws