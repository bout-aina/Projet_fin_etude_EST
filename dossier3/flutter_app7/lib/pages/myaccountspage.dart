import 'dart:convert';
import 'package:flutter_app7/Connexion_Patient/databasehelper.dart';

import 'package:flutter_app7/models/user_model.dart';
import 'package:flutter_app7/services/patient_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app7/sidebar/sidebar_layout.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'editProfileScreen.dart';



// ignore: must_be_immutable
class Home extends StatefulWidget {
  int id;
  String name;

  String cin;

  String email;


  String mobile;

  Home(
      {this.name,
        this.cin,
        this.email,
        this.mobile});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  UserModel _user = UserModel();
  DatabaseHelper databaseHelper = new DatabaseHelper();
  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  String serverUrl = "http://10.0.2.2/projet/public/api";
  void _getUserInfo() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/user";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        });
    var jsonDecode = json.decode(response.body);
    _user = UserModel.fromJson(jsonDecode['data']);
    setState(() {});
    print(_user.toJson());


  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ////////////// 1st card///////////
                Card(
                  elevation: 4.0,
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 40, bottom: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ////////////  first name ////////////


                        ////////////// last name //////////////
                        Card(
                          elevation: 4.0,
                          color: Colors.white,
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding:
                            EdgeInsets.only(left: 15, top: 10, bottom: 10),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.account_circle,
                                        color: Color(0xFF77b5fe),
                                      ),
                                    ),
                                    Text(
                                      'Nom et prénom',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 17.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                               
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Text( '${_user.name}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ////////////  Email/////////
                        Card(
                          elevation: 4.0,
                          color: Colors.white,
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding:
                            EdgeInsets.only(left: 15, top: 10, bottom: 10),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.mail,
                                        color: Color(0xFF77b5fe),
                                      ),
                                    ),
                                    Text(
                                      'Email',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 17.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Text('${_user.email}', 
                                 
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ////////////////////// phone ///////////
                        Card(
                          elevation: 4.0,
                          color: Colors.white,
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding:
                            EdgeInsets.only(left: 15, top: 10, bottom: 10),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.phone,
                                        color: Color(0xFF77b5fe),
                                      ),
                                    ),
                                    Text(
                                      'Téléphone',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 17.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Text(
                                   '${_user.mobile}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ////////////end  part////////////
                        Card(
                          elevation: 4.0,
                          color: Colors.white,
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding:
                            EdgeInsets.only(left: 15, top: 10, bottom: 10),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.credit_card,
                                        color: Color(0xFF77b5fe),
                                      ),
                                    ),
                                    Text(
                                      'Cin',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 17.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ), // wati sabri
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Text(
                                   '${_user.cin}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4.0,
                          color: Colors.white,
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding:
                            EdgeInsets.only(left: 15, top: 10, bottom: 10),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.watch_later,
                                        color: Color(0xFF77b5fe),
                                      ),
                                    ),
                                    Text(
                                      'Crée le ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 17.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ), // wati sabri
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Text(
                                    '${_user.createdAt}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(

                          padding: const EdgeInsets.only(top: 10, left: 30, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              /////////// Edit Button /////////////
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FlatButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 10, left: 10, right: 10),
                                    child: Text(
                                      'Modifier mes informations',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  color: Color(0xFF77b5fe),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(20.0)),
                                  onPressed: () {
                                     Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Edit(

                                              widget.name,
                                              widget.cin,
                                              widget.email,
                                              widget.mobile,
                                            )));

                                  },
                                ),
                              ),

                              ////////////// logout//////////

                            ],
                          ),
                        ),

                      ],
                    ),

                  ),

                ),

                /////////////// Button////////////


                      ////////////// logout//////////


                /////////////// Button////////////

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 8, bottom: 10, left: 100, right: 100),
                      child: Text(
                        '           Menu          ',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    color: Color(0xFF77b5fe),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => SideBarLayout()));
                    },
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}