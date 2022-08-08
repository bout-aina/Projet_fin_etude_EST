
import 'package:flutter/cupertino.dart';
import 'package:flutter_app7/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';

class DatabaseHelper{

  String serverUrl = "http://10.0.2.2/projet/public/api";
  var status ;
 var status1;
  var token ;


  loginData(String email , String password) async{



    String myUrl = "$serverUrl/login1";
    final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json',

        },
        body: {
          "email": "$email",
          "password" : "$password"
        } );
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('My data : ${data["token"]}');

      _save(data["token"]);
    }

  }

  registerData(String name ,String email , String password,String cin,String mobile) async{

    String myUrl = "$serverUrl/register1";
    final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "name": "$name",
          "email": "$email",
          "password" : "$password",
          "cin" : "$cin",
          "mobile": "$mobile"
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }

  }

  Future<List> getfiles() async{

    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/file";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        });
    return json.decode(response.body);
  }




   editData(int id,String name , String email, String mobile,String cin) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/edituser/$id";
    final response = await  http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },

        body: {
          "name": "$name",
          "email" : "$email",
        "mobile" : "$mobile",
        "cin" : "$cin"

        });
    status = response.statusCode.toString().contains('422');



    if(status){

      print('error');
    }
    print('Response status : ${response.statusCode}');
    print('Response body : ${response.body}');








  }




  Future<List> getData() async{

    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/messages";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        });
    return json.decode(response.body);
  }

 addData(String description , DateTime start ,DateTime end) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/rendezvous";
    http.post(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "description": "$description",
          "start" : "$start",
          "end" : "$end"

        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

   getdate(DateTime start) async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/countrdv/$start";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        });


   status1 = response.body.contains('sorry');


return status1;

   // print('Response status : ${response.statusCode}');
   // print('Response body : ${response.body}');

   }





 /*create(String email ) async {


    String myUrl = "$serverUrl/create";
    http.Response response = await http.post(myUrl,

        headers: {
          "Content-Type":"application/json",
          'X-Requested-With' : 'XMLHttpRequest'
        },
        body: {
          "email": "$email",

        });
    print("${response.statusCode}");
    print("${response.body}");

  }*/
  Future<http.Response> create (String email) async {
    String myUrl = "$serverUrl/create";


    Map data = {
      'email': '$email'
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(myUrl,
        headers: {"Content-Type": "application/json",  'X-Requested-With' : 'XMLHttpRequest'},
        body: body
    );
    status = response.statusCode.toString().contains('200');


    print("${response.statusCode}");
    print("${response.body}");
   // print("${token}");

  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }


  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }






}