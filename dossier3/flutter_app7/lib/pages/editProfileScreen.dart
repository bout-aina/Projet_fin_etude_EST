

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app7/Connexion_Patient/databasehelper.dart';

import 'package:flutter_app7/models/user_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'myaccountspage.dart';



class Edit extends StatefulWidget {
  final name;

  final cin;

  final email;

//final password ;
  final  mobile;
  Edit(this.name, this.cin, this.email,
      this.mobile);
  @override

  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {

  UserModel _user =new UserModel();

  DatabaseHelper editUser = DatabaseHelper();
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  TextEditingController cinController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  _onPressed() async {
    final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = prefs.get(key ) ?? 0;

  String myUrl = "http://10.0.2.2/projet/public/api/user";
  http.Response response = await http.get(myUrl,
      headers: {
        'Accept':'application/json',
        'Authorization' : 'Bearer $value'
      });
  var jsonDecode = json.decode(response.body);
  _user = UserModel.fromJson(jsonDecode['data']);
    setState(()  async {


      if(nameController.text.trim().toLowerCase().isNotEmpty && mailController.text.trim().toLowerCase().isNotEmpty &&
          cinController.text.trim().toLowerCase().isNotEmpty &&
           phoneController.text.trim().toLowerCase().isNotEmpty
          ){

        editUser.editData(_user.id,nameController.text.trim(), mailController.text.trim(), phoneController.text.trim(),
            cinController.text.trim()).whenComplete(() async {
          if(editUser.status){
            _showDialog();

          }else{

            await Navigator.pushReplacementNamed(context, '/myaccountspage');



          }
        });


          }
      else
        {
          _showDialog1();
        }


    });
  }
  void initState() {
    // TODO: implement initState
    super.initState();

  }





  @override
  Widget build(BuildContext context) {

    nameController.text =  (widget.name == null) ? '' : widget.name;
    mailController.text =   (widget.email == null) ? '' : widget.email;
    phoneController.text =
    (widget.mobile == null) ? '' : widget.mobile;
    cinController.text = (widget.cin == null)
        ? ''
        : widget.cin;
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            /////////////  background/////////////

            /// //eho
            new Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.4, 0.9],
                  colors: [
                    Color(0xFF77b5fe),
                    Color(0xFF77b5fe),
                    Color(0xFF77b5fe),
                  ],
                ),
              ),
            ),

            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            /////////////// name////////////
                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: nameController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                ),
                                hintText: "Nom et Prénom",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// Email ////////////
                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: mailController,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Color(0xFF9b9b9b),

                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.grey,
                                ),
                                hintText: "Email ",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// password ////////////

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: cinController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.credit_card,
                                  color: Colors.grey,
                                ),
                                hintText: "cin",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              cursorColor: Color(0xFF9b9b9b),
                              controller: phoneController,
                              keyboardType: TextInputType.phone,

                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                ),
                                hintText: "Téléphone",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            /////////////// SignUp Button ////////////
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FlatButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    child: Text(
                                      'Enregistrer',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  color: Color(0xFF77b5fe),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(20.0)),
                                  onPressed: _onPressed),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /////////////// already have an account ////////////
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Home()));
                        },
                        child: Text(
                          'Mon Compte',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _showDialog1(){
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: "Remarque!",
      desc: "Veuillez remplir tous les champs convenables.",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 90, 134, 1.0),
          radius: BorderRadius.circular(30.0),
        ),
      ],
    ).show();
  }
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
  );
  //

  void _showDialog(){
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.error,
      title: "ERREUR!",
      desc: "Veuillez vérifier vos informations.",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 90, 134, 1.0),
          radius: BorderRadius.circular(30.0),
        ),
      ],
    ).show();
  }
}




