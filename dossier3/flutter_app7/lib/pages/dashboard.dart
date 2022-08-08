import 'package:flutter/material.dart';
import 'package:flutter_app7/Connexion_Patient/databasehelper.dart';

import 'package:flutter_app7/pages/showdata.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:shared_preferences/shared_preferences.dart';


class Dashboard extends StatefulWidget{

  Dashboard({Key key , this.title}) : super(key : key);
  final String title;

  @override
  DashboardState  createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {

  DatabaseHelper databaseHelper = new DatabaseHelper();







  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Contatct',
      home: Scaffold(
          appBar: AppBar(
            title:  Text('Messages'),
            actions: <Widget>[

            ],
          ),

          body: new FutureBuilder<List>(
            future: databaseHelper.getData(),
            builder: (context ,snapshot){
              if(snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? new ItemList(list: snapshot.data)
                  : new Center(child: new CircularProgressIndicator(),);
            },
          )
      ),
    );
  }


}

class ItemList extends StatelessWidget {

  List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {


    return new ListView.builder(
        itemCount: list==null?0:list.length,
        itemBuilder: (context,i){
          var date= list[i]['created_at'] ;
          var d=DateTime.parse(date);
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: ()=>



                Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new ShowData(list:list , index:i,) ),

              ) ,


              child: new Card(

                child: ListTile(
                  leading: CircleAvatar(
                    radius: 24.0,
                    backgroundImage:  AssetImage('assets/doctor.jpg'),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text('Docteur'),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        DateFormat.yMd().add_jms().format(d),

                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  subtitle: Text('Message : ${list[i]['message']}'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14.0,
                  ),
                ),
          ),
             /* child: new Card(
                child: new ListTile(
                  title: new Text('Docteur'),
                  leading: new Icon(Icons.apps),
                  subtitle: new Text('Message : ${list[i]['message']}'),
                ),
              ),*/

            ),
          );

        }
    );
  }

}