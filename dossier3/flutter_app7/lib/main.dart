import 'package:flutter/material.dart';
import 'package:flutter_app7/Connexion_Patient/insert_email.dart';
import 'package:flutter_app7/pages/CalendarScreen.dart';
import 'package:flutter_app7/pages/myaccountspage.dart';
import 'package:flutter_app7/sidebar/sidebar_layout.dart';
import 'Connexion_Patient/login_patient.dart';
import 'Connexion_Patient/signup_patient.dart';
import 'Slide_Debut.dart';



void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  final String title='';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OPHTA EXPRESS',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SmartWalletOnboardingPage(),
      routes: <String,WidgetBuilder>{
        '/sidebar_layout' : (BuildContext context) => new SideBarLayout(title:title),
         '/CalendarScreen' : (BuildContext context) => new CalendarScreen(),
        '/insert_email': (BuildContext context) => new Email(),
        '/myaccountspage': (BuildContext context) => new Home(),
        '/register' : (BuildContext context) => new SignupOnePage(title:title),
        '/login' : (BuildContext context) => new LoginTwoPage(title:title),
      },
    );
  }
}


