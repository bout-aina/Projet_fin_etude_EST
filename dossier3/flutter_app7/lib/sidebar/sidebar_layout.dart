import 'package:flutter/material.dart';
import 'package:flutter_app7/Connexion_Patient/databasehelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app7/bloc/navigation_bloc/navigation_bloc.dart';
import 'sidebar.dart';

class SideBarLayout extends StatefulWidget{

  SideBarLayout({Key key , this.title}) : super(key : key);
  final String title;

  @override
  SideBarLayoutState  createState() => SideBarLayoutState();
}
class SideBarLayoutState extends State<SideBarLayout> {
  DatabaseHelper databaseHelper = new DatabaseHelper();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}