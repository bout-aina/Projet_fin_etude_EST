
import 'package:flutter/material.dart';

import 'package:flutter_app7/sidebar/sidebar_layout.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'databasehelper.dart';
import 'package:http/http.dart' as http;

class Email extends StatefulWidget{

  Email({Key key , this.title}) : super(key : key);
  final String title;

  @override
  EmailState  createState() => EmailState();
}
class EmailState extends State<Email> {










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
    //_getUserInfo();
  }

  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _emailController = new TextEditingController();


  _onPressed(){
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty){
        databaseHelper.create(_emailController.text.trim().toLowerCase()).whenComplete(() async {
          if(databaseHelper.status){

            _showDialog1();
          }else{


           _showDialog();


          }
        });
      }
      else
      {
        _showDialog2();
      }
    });
  }








  Widget _buildPageContent(BuildContext context) {
    return Container(

      color: Colors.blue.shade100,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 30.0,),
          CircleAvatar(child:   Image(image:  AssetImage('assets/l.jpg')),
            maxRadius: 50, backgroundColor: Colors.transparent,),
          SizedBox(height: 20.0,),
          _buildLoginForm(),

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


                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.blue.shade600,
                child: Icon(Icons.person),
              ),
            ],
          ),
          Container(
            height: 420,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed:_onPressed,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                child: Text("Envoyer", style: TextStyle(color: Colors.white70)),
                color: Colors.blue,
              ),
            ),
          ),

        ],

      ),
    );
  }
  void _showDialog2(){
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: "Remarque!",
      desc: "Veuillez saisir votre adresse email",
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
  void _showDialog1(){
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.success,
      title: "",
      desc: "Un message a été envoyé dans votre boite gmail",
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
      desc: "Cet utilisateur n'existe pas",
      buttons: [
        DialogButton(
          child: Text(
            "Annuler",
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




