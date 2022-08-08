import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app7/Connexion_Patient/databasehelper.dart';
import 'package:flutter_app7/Connexion_Patient/login_patient.dart';
import 'package:flutter_app7/pages/CalendarScreen.dart';
import 'package:flutter_app7/pages/dashboard.dart';
import 'package:flutter_app7/pages/files.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app7/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutter_app7/models/user_model.dart';
import 'package:flutter_app7/pages/myaccountspage.dart';

import 'package:flutter_app7/services/patient_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../sidebar/menu_item.dart';

class SideBar extends StatefulWidget {

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {

  UserModel _user = UserModel();

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




  DatabaseHelper databaseHelper = new DatabaseHelper();
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
     _getUserInfo();
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(

                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: const Color(0xFF262AAA),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),

                      ListTile(
                        title: Text(
                          '${_user.name}',
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          '${_user.email}',
                          style: TextStyle(
                            color: Color(0xFF1BB5FD),
                            fontSize: 18,
                          ),
                        ),
                        leading:  CircleAvatar(child:   Image(image:  AssetImage('assets/logo.png')),
                          maxRadius: 30, backgroundColor: Colors.transparent,),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "Acceuil",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.person,
                        title: "Mon Compte",
                        onTap: () {

                          onIconPressed();

                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder: (BuildContext context) => new Home(





                                ),
                              )
                          );

                        },
                      ),
                      MenuItem(
                        icon: Icons.attach_file,
                        title: "Dossier Médical",
                        onTap: () {
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder: (BuildContext context) => new File(),
                              )
                          );

                        },
                      ),
                      MenuItem(
                        icon: Icons.access_time,
                        title: "Prendre RDV",
                        onTap: () {
                          onIconPressed();
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder: (BuildContext context) => new CalendarScreen(),
                              )
                          );
                        },
                      ),
                      MenuItem(
                        icon:  Icons.notifications,

                        title: "Notifications",
                        onTap: () {
                          onIconPressed();

                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder: (BuildContext context) => new Dashboard(),
                              )
                          );
                        },
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),

                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: "Déconnexion",
                     
                        onTap: () async{
                         
                       _save('0');
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                builder: (BuildContext context) => new LoginTwoPage(),
                              )
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xFF262AAA),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF1BB5FD),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}