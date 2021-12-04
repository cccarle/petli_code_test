import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> httpGet(
    url, {
    headers,
    body,
  }) async {
    http.Response res = await http.get(Uri.parse(url));

/* 
Mock of a backend response with msg.
 */

    if (res.statusCode == 200) {
      return {
        "succes": true,
        "msg": 'Succesfully fethched data',
        "body": jsonDecode(res.body)
      };
    } else {
      return {
        "succes": false,
        "msg": 'Something went wrong when fetching data'
      };
    }
  }
}
