import 'package:flutter/material.dart';
import 'package:flutter_app7/Connexion_Patient/databasehelper.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;


class File extends StatefulWidget{

  File({Key key , this.title}) : super(key : key);
  final String title;

  @override
  FileState  createState() => FileState();
}

class FileState extends State<File> {

  DatabaseHelper databaseHelper = new DatabaseHelper();







  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Contatct',
      home: Scaffold(
          appBar: AppBar(
            title:  Text('Mes fichiers'),
            actions: <Widget>[

            ],
          ),

          body: new FutureBuilder<List>(
            future: databaseHelper.getfiles(),
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
        var dossier=list[i]['file_url'];
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: () => url_launcher.launch('http://10.0.2.2/doctor/uploadFile/${dossier}'),


              child: new Card(

                child: ListTile(
                  leading: CircleAvatar(
                    radius: 24.0,
                    backgroundImage:  AssetImage('assets/pdf.webp'),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(''),
                      SizedBox(
                        width: 16.0,
                      ),

                    ],
                  ),
                  subtitle: Text(' ${list[i]['name']}'),
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