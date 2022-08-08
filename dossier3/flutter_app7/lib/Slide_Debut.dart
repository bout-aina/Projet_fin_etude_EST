import 'package:flutter/material.dart';

import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';


import 'Patient_Medecin.dart';



class SmartWalletOnboardingPage extends StatelessWidget {
  static final String path = "lib/src/pages/onboarding/smart_wallet_onboarding.dart";
  final pages = [
    PageViewModel(
      pageColor: Color(0xDCDCDC),
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('Bienvenue à vous au cabinet d ophtalmologie'),
          Text("\n"),
          Text(
            "POTEGEZ VOS YEUX,C'EST NOTRE BUT.",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0
            ),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/l1.png',
        width: 400.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      iconColor: null,
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('Ophtalmo Express'),
          Text("\n"),
          Text(
            'Allons-y battre pour protéger nos yeux',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 20.0
            ),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/l2.png',
        width: 500.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      iconColor: null,
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('Nous sommes là pour vous'),
          Text("\n"),
          Text(
            'Restez dans vos maisons et allons-y prendre un rendez-vous',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 20.0
            ),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/l3.png',
        width: 450.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => AuthThreePage()
                    )
                );
              },
              showSkipButton: true,
              doneText: Text("Commencer",),
              pageButtonsColor: Colors.indigo,
              pageButtonTextStyles: new TextStyle(
                // color: Colors.indigo,
                fontSize: 16.0,
                fontFamily: "Regular",
              ),
            ),

          ],
        ),
      ),
    );
  }
}