import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:promilo/core/constant/url_constant.dart';
import 'package:promilo/model/login_response_model.dart';

import '../core/common_utils/my_encryption.dart';
import '../core/common_utils/shared_pref_utils.dart';
import '../core/constant/app_constant.dart';
import '../core/network_service/http_services.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isSubmitEnabled = false;
  bool get isSubmitEnabled => _isSubmitEnabled;
  set setSubmitEnabled(bool value) {
    _isSubmitEnabled = value;
    notifyListeners();
  }

  Future<String?> login(BuildContext context, String email, String password) async {
    try {
      String pass = MyEncryption.encrypt(password);

      var postData = {"username": email, "password": pass, "grant_type": "password"};
      debugPrint(postData.toString());
      http.Response response = await ApiProvider.postLoginApi(UrlConstant.login, postData);
      var jsonData = jsonDecode(response.body);
      var loginResponse = LoginResponseModel.fromJson(jsonData);
      bool success = (loginResponse.status?.code == 200 || loginResponse.status?.code == 201);
      debugPrint(loginResponse.toRawJson());
      if (success) {
        await SharedPrefUtils.setSecuredValue(AppConstant.token, loginResponse.response?.accessToken);
        return null;
      }
      if (!success) return loginResponse.status?.message ?? "Login Failed";
    } catch (e) {
      return e.toString();
    }
    return null;
  }
}
