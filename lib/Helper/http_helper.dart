import 'dart:convert';

import 'package:http/http.dart' as http;

////same class  for api
/////nedd to integrate api
class NetworkData {
  /////constructor
  NetworkData(this.url);
  final String url;

  //await async  synchromise
  //////both work together

  //////future one time call
  ////////stream contineous data  no need to refreash
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
