import 'dart:ui' as ui;

import 'package:flutter_app7/Connexion_Patient/databasehelper.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';



class ShowData extends StatefulWidget{

  List list;
  int index;
  ShowData({this.index , this.list}) ;


  @override
  ShowDataState  createState() => ShowDataState();
}

class ShowDataState extends State<ShowData> {
  DatabaseHelper databaseHelper = new DatabaseHelper();




  Widget _buildContent(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAvatar(),
          _buildInfo(),
          _buildVideoScroller(),
          _buildbuton(context),
        ],
      ),
    );
  }

  Widget _buildbuton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          color: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            'Retour',
            style: TextStyle(color: Colors.white70),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 110.0,
      height: 110.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white30),
      ),
      margin: const EdgeInsets.only(top: 32.0, left: 16.0),
      padding: const EdgeInsets.all(3.0),
     child: CircleAvatar(
        radius: 24.0,
        backgroundImage:  AssetImage('assets/doctor.jpg'),
      ),

    );
  }

  Widget _buildInfo() {
    var date= widget.list[widget.index]['created_at'] ;
    var d=DateTime.parse(date);
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
          'Docteur',
              style: TextStyle(
                color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
            ),
          ),
          Text('\n'),
          Text(
            'Absamad Baala',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 29.0,
            ),
          ),
          Text('\n'),Text('\n'),

          Text(
            DateFormat.yMd().add_jms().format(d),
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white.withOpacity(0.85),
              fontWeight: FontWeight.w500,
            ),
          ),

          Container(
            color: Colors.white.withOpacity(0.85),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: 345.0,
            height: 1.0,
          ),
          Text(
              " ${widget.list[widget.index]['message']}",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white.withOpacity(0.85),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoScroller() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox.fromSize(
        size: Size.fromHeight(245.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),

          itemBuilder: (BuildContext context, int index) {

          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1100.0,
        height: 1100.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/message.jpg'),
            fit: BoxFit.cover,

          ),
        ),

        child: BackdropFilter(

          filter: ui.ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }
}



