import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'databasehelper.dart';

class SignupOnePage extends StatefulWidget{

  SignupOnePage({Key key , this.title}) : super(key : key);
  final String title;

  @override
  SignupOnePageState  createState() => SignupOnePageState();
}
class SignupOnePageState extends State<SignupOnePage> {


  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _cinController = new TextEditingController();
  final TextEditingController _mobileController = new TextEditingController();



  _onPressed(){
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty ){
        databaseHelper.registerData(_nameController.text.trim(),_emailController.text.trim().toLowerCase(),

            _passwordController.text.trim(),_cinController.text.trim(),_mobileController.text.trim()).whenComplete((){
          if(databaseHelper.status){
            _showDialog();
            msgStatus = 'Vérifiez vos informations';
          }else{
            Navigator.pushReplacementNamed(context, '/sidebar_layout');


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
          CircleAvatar(child:   Image(image:  AssetImage('assets/loo.png')),
            maxRadius: 50, backgroundColor: Colors.transparent,),
          SizedBox(height: 20.0,),
          _buildLoginForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FloatingActionButton(
                mini: true,
                onPressed: (){
                  Navigator.pop(context);
                },
                backgroundColor: Colors.blue,
                child: Icon(Icons.arrow_back),
              )
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
                  SizedBox(height: 60.0,),
                  Container(child: Divider(color: Colors.blue.shade400,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                            hintText: "Nom et Prénom",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: Icon(Icons.person, color: Colors.blue,)
                        ),
                      )
                  ),

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

                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _cinController,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                            hintText: "Cin",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: Icon(Icons.credit_card, color: Colors.blue,)
                        ),
                      )
                  ),

                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _mobileController,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                            hintText: "Mobile",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: Icon(Icons.phone, color: Colors.blue,)
                        ),
                      )
                  ),

                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: Icon(Icons.lock, color: Colors.blue,)
                        ),
                      )
                  ),
                  Container(child: Divider(color: Colors.blue.shade400,), padding: EdgeInsets.only(left: 20.0,right: 20.0, bottom: 10.0),),

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
                child: Text("Créer Un Compte", style: TextStyle(color: Colors.white70)),
                color: Colors.blue,
              ),
            ),
          ),

        ],
      ),
    );
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }


}