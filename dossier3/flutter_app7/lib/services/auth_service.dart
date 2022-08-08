import 'dart:convert';

import 'package:flutter_app7/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
 
 Api _api= Api();

  
  Future<bool> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');
    if (token != null) {
      _api.token = token;
      return true;
    }
    return false;
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.setString('token', token);
    _api.token = token;
  }

  Future<bool> login(String email, password) async {
    var response = await _api.httpPost('login1', {'email': email, 'password': password}); 
    print(response.statusCode);
    print(response.body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      saveToken(data['token']);
      return true;
    } else if (response.statusCode == 400) {
      
      return false;
    }
    return false;
  }

  Future<void> logout() async {
  await _api.httpPost('logout1', {});

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}