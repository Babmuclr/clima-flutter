import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);
  final Uri url;

  Future getData() async{
    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }else {
      print('network is crushed');
      print(response.statusCode);
      return Null;
    }
  }

}