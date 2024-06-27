import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  ApiProvider.instance();

  static String baseUrl = "https://apiv2stg.promilo.com/";

  // Post data for login api
  static Future<http.Response> postLoginApi(String postUrl, Map<String, dynamic> body) async {
    var headers = _getHeader();
    var uri = Uri.parse("$baseUrl$postUrl");

    var response = await http.post(uri, body: body, headers: headers).timeout(const Duration(seconds: 60));

    if (response.statusCode != 200 && response.statusCode != 201) {
      var jsonData = jsonDecode(response.body);

      throw (jsonData['status']['message'] ?? "Error while login try again");
    }
    return response;
  }

  static Map<String, String> _getHeader() {
    return {'Content-Type': 'application/x-www-form-urlencoded', 'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg=='};
  }
}
