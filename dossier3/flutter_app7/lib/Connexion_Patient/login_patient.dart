import 'dart:convert';
import 'package:flutter_app7/Connexion_Patient/insert_email.dart';
import 'package:flutter_app7/models/user_model.dart';

import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:flutter_app7/services/patient_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app7/Connexion_Patient/signup_patient.dart';



import 'package:flutter_app7/sidebar/sidebar_layout.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'databasehelper.dart';


class LoginTwoPage extends StatefulWidget{

  LoginTwoPage({Key key , this.title}) : super(key : key);
  final String title;

  @override
  LoginTwoPageState  createState() => LoginTwoPageState();
}
class LoginTwoPageState extends State<LoginTwoPage> {


  


  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    if(value != '0'){
      Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context) => new SideBarLayout(),
          )
      );
    }
  }


  @override

  void initState() {
    super.initState();
     read();

  }
  
  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

   _onPressed(){
   setState(() {
  if(_emailController.text.trim().toLowerCase().isNotEmpty &&
     _passwordController.text.trim().isNotEmpty ){
      databaseHelper.loginData(_emailController.text.trim().toLowerCase(),
           _passwordController.text.trim()).whenComplete(() async {
          if(databaseHelper.status){
           _showDialog();
           msgStatus = 'Vérifiez vos informations';
       }else{

          await Navigator.pushReplacementNamed(context, '/sidebar_layout');



        }
        });
      }
  else
    {
      _showDialog1();
    }
    });
  }








            Widget _buildPageContent(BuildContext context) {
              return Container(

                color: Colors.blue.shade100,
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 30.0,),
                    CircleAvatar(child:   Image(image:  AssetImage('assets/lo.png')),
                      maxRadius: 50, backgroundColor: Colors.transparent,),
                    SizedBox(height: 20.0,),
                    _buildLoginForm(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Vous n'avez pas un compte?",style: TextStyle(color: Colors.blue, fontSize: 18.0)),
                          FlatButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) => SignupOnePage()
                            ));
                          }, child: Text('Créer Un Compte',style: TextStyle(color: Colors.blue, fontSize: 19.0)))
                        ],


                    )
                  ],

                ),
              );
            }

            Container _buildLoginForm() {
              return Container(
                padding: EdgeInsets.all(20.0),
                child: Stack(
                  children: <Widget>[
                    ClipPath(
                      clipper: RoundedDiagonalPathClipper(),
                      child: Container(
                        height: 400,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 90.0,),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(color: Colors.blue),
                                  decoration: InputDecoration(
                                      hintText: "Addresse Email ",
                                      hintStyle: TextStyle(color: Colors.blue.shade200),
                                      border: InputBorder.none,
                                      icon: Icon(Icons.email, color: Colors.blue,)
                                  ),
                                )
                            ),
                            Container(child: Divider(color: Colors.blue.shade400,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                  controller: _passwordController,
                                  style: TextStyle(color: Colors.blue),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Mot De Passe",
                                      hintStyle: TextStyle(color: Colors.blue.shade200),
                                      border: InputBorder.none,
                                      icon: Icon(Icons.lock, color: Colors.blue,)
                                  ),
                                )
                            ),
                            Container(child: Divider(color: Colors.blue.shade400,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FlatButton( onPressed: () => url_launcher.launch('http://10.0.2.2:8000/password/reset'),
                                    child: Text('Mot de passe oublié',style: TextStyle(color: Colors.grey, fontSize: 13.0)))
                              ],
                            ),
                            SizedBox(height: 10.0,),

                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(child:   Image(image:  AssetImage('assets/logo.png')),
                          maxRadius: 50, backgroundColor: Colors.transparent,),
                      ],
                    ),

                    Container(
                      height: 420,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RaisedButton(
                          onPressed: _onPressed,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                          child: Text("Connexion", style: TextStyle(color: Colors.white70)),
                          color: Colors.blue,
                        ),
                      ),
                    ),

                  ],

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
            @override
            Widget build(BuildContext context) {
              return Scaffold(
                body: _buildPageContent(context),
              );
            }
          }




