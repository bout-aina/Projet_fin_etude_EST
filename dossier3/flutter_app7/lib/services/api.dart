import 'dart:async';


import 'package:flutter_app7/Connexion_Patient/databasehelper.dart';
import 'package:http/http.dart' as http;

class Api {
  static final Api _api = Api._internal();


  final String url = "192.168.0.104";
  final String path = "/projet/public/api";
  DatabaseHelper databaseHelper= new DatabaseHelper();
  String token  ;
  factory Api() {
    return _api;
  }
  Api._internal();

  Future<http.Response> httpPost(String endPath, Object body) {
    Uri uri = Uri.http(url, "$path/$endPath", null);
    return http.post(uri, body: body, headers: {
      'Authorization': 'Bearer $token',
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
  }
  //3awd executi tel rah t9Il

  Future<http.Response> httpGet(String endPath, {Map<String, String> query}) {
    Uri uri = Uri.http(url, "$path/$endPath");
    if (query != null) {
      uri = Uri.http(url, "$path/$endPath", query);
    }
    print(uri);
    return http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
  }
}
