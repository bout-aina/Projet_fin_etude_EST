import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app7/Connexion_Patient/databasehelper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
class CalendarScreen extends StatefulWidget {
  static const String id = 'calendar_screen';
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  DateTime _startController;
  DateTime _endController;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();


    _calendarController = CalendarController();
    _eventController = TextEditingController();
    _startController= DateTime(2020);
    _endController= DateTime(2020);
    _events = {};
    _selectedEvents = [];
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.get('events') ?? '{}')));
    });
  }

  // Encode Date Time Helper Method
  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  // decode Date Time Helper Method
  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    var dat=getdate();

    return Scaffold(
      appBar: AppBar(
        title: Text(' Prendre Rendez Vous'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(

              padding: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0, bottom: 10.0),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                elevation: 10.0,
                color: Colors.red[300],
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 24.0,),
                    Text("ATTENTION !", style:TextStyle(color: Colors.white,fontSize: 25) ),
                    Text("\n"),
                    SizedBox(height: 5.0,),
                    Text("Les rendez-vous prises avant la date d'aujourd'hui ",style: TextStyle( fontSize: 15,color: Colors.white),),
                    Text("ou bien le dimanche ne sont pas prises en charge",style: TextStyle( fontSize: 15,color: Colors.white),),
                    SizedBox(height: 16.0,),
                    Container(
                      height: 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[



                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            TableCalendar(

              events: _events,
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                markersColor: Colors.redAccent,

                todayColor: Colors.pinkAccent,
                selectedColor: Colors.blue ,


                todayStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              headerStyle: HeaderStyle(
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,

              calendarController: _calendarController,

              onDaySelected: (date, events) {
                _startController=date;
                _endController=date;
                setState(() {
                  //print(dat);
                  print("voila: ${_startController}");




                  print(date.toIso8601String());
                 // _selectedEvents = events;
                });
              },
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _showAddDialog();
        },
      ),
    );
  }
  void _showDialog1(){
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: "Remarque!",
      desc: "Veuillez prendre un rendez vous.",
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
  void _showDialog2(){
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.success,
      title: 'félicitation',
      desc: "Votre rendez vous a été bien enregistré",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () =>  Navigator.pop(context),
          color: Color.fromRGBO(0, 90, 134, 1.0),
          radius: BorderRadius.circular(30.0),
        ),
      ],
    ).show();
  }
  getdate() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "http://10.0.2.2/projet/public/api/countrdv/$_startController";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        });


    var status1 = response.body.contains('sorry');


    if(status1)
      {
        return 'sorry';
      }
    else
      return 'done';

    // print('Response status : ${response.statusCode}');
    // print('Response body : ${response.body}');

  }

  void _showDialog3(){
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: 'Desolé veuillez choisir un autre jour',
      desc: "Le nombre des rendez-vous de ce jour dépasse le nombre maximale",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () =>  Navigator.pop(context),
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
  _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Prendre un rendez vous:'),
        content: TextFormField(
          controller: _eventController,
          keyboardType: TextInputType.multiline,
          maxLines: 4,
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                color: Colors.indigo,
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),

                ),
                onPressed: () async {


                    if (_eventController.text.isNotEmpty) {
                      final prefs = await SharedPreferences.getInstance();
                      final key = 'token';
                      final value = prefs.get(key ) ?? 0;

                      String myUrl = "http://10.0.2.2/projet/public/api/countrdv/$_startController";
                      http.Response response = await http.get(myUrl,
                          headers: {
                            'Accept':'application/json',
                            'Authorization' : 'Bearer $value'
                          });


                       var status = response.body.contains('done');



                      if(status){

                       databaseHelper.addData(_eventController.text.trim(), _startController, _endController);
                       _showDialog2();
                       _eventController.clear();
                      }
                      else
                      {
                       _showDialog3();
                       _eventController.clear();
                      }






                  }
                    else
                      {
                        _showDialog1();
                      }


                },
              ),
              SizedBox(
                width: 10.0,
              ),
              FlatButton(
                color: Colors.grey,
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}