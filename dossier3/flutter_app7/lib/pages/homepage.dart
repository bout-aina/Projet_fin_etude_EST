import 'package:flutter/material.dart';
import 'package:flutter_app7/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:intl/intl.dart';



class HomePage extends StatelessWidget with NavigationStates {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
      ),

      body: HeaderFooterwidget(
        header: _buildDateHeader(DateTime.now()),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20.0),
              _buildTaskTwo(),
            ],
          ),
        ),
        footer: _buildBottomBar(),
      ),
    );
  }

  Container _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 10.0),
          Text(
            "Votre Vue   ...    ! "
                " C'est Notre Vision",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
          IconButton(
            color: Colors.white70,
            icon: Icon(Icons.remove_red_eye),
            onPressed: () {
            },
          )
        ],
      ),
    );
  }

  Widget _buildDateHeader(DateTime date) {
    final TextStyle boldStyle = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        letterSpacing: 2.0);

    return Row(

      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: MaterialButton(
            minWidth: 0,
            elevation: 0,
            highlightElevation: 0,
            textColor: Colors.blueGrey,
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 8.0,
            ),
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {},
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(DateFormat.d().format(date).toUpperCase()),
                const SizedBox(height: 10.0),
                Text(
                  DateFormat.y().format(date),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 20.0),

        Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat.yMd().add_jms().format(DateTime.now()),

              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              "Aujourd'hui".toUpperCase(),
              style: boldStyle,
            ),

          ],
        ),

      ],
    );
  }

  Widget _buildTaskTwo() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
        color: Colors.white70,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 26.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Nom Du Cabinet",
            style: TextStyle(letterSpacing: 2.5, color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16.0),
          ),
          const SizedBox(height: 5.0),
          Text(
            "Ophtalmo Express",
            style: TextStyle(

                color: Colors.blue,
                fontSize: 16.0),
          ),

          const SizedBox(height: 5.0),
          Divider(color: Colors.blue,),
          Text(
            "    ",
            style: TextStyle(letterSpacing: 2.5, color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16.0),
          ),
          Text(
            "Nom Du Docteur",
            style: TextStyle(letterSpacing: 2.5, color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16.0),
          ),
          const SizedBox(height: 5.0),
          Text(
            "Mrs Abdessamad Baalla",
            style: TextStyle(

                color: Colors.blue,
                fontSize: 16.0),
          ),

          const SizedBox(height: 5.0),
          Divider(color: Colors.blue,),
          Text(
            "    ",
            style: TextStyle(letterSpacing: 2.5, color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16.0),
          ),
          Text(
            "Contact Du Docteur",
            style: TextStyle(letterSpacing: 2.5, color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16.0),
          ),
          const SizedBox(height: 5.0),
          Text(
            "-Tel         :+212 661 433015",

            style: TextStyle(

                color: Colors.blue,
                fontSize: 16.0),
          ),
          Text(

            "-Fix         :+212 522 485032",
            style: TextStyle(

                color: Colors.blue,
                fontSize: 16.0),
          ),
          Text(

            "-Email     :contact@ophtamologie.com",
            style: TextStyle(

                color: Colors.blue,
                fontSize: 16.0),
          ),

          const SizedBox(height: 5.0),
          Divider(color: Colors.blue,),
          Text(
            "    ",
            style: TextStyle(letterSpacing: 2.5, color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16.0),
          ),
          Text(
            "Horaire Du Travaille",
            style: TextStyle(letterSpacing: 2.5, color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16.0),
          ),
          const SizedBox(height: 5.0),
                   Text(
            "Continue        :De 9h-16h",
            style: TextStyle(

                color: Colors.blue,
                fontSize: 16.0),
          ),


          const SizedBox(height: 5.0),
          Divider(color: Colors.blue,),

        ],
      ),
    );

  }

  Container _buildTask({Color color = Colors.blue}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: color,
      ),

      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "10:30 - 11:30AM",
            style: TextStyle(letterSpacing: 2.5, color: Colors.white),
          ),
          const SizedBox(height: 5.0),
          Text(
            "Meeting With",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.white),
          ),
          Text("John Doe")
        ],
      ),
    );
  }
}

class HeaderFooterwidget extends StatelessWidget {
  final Widget header;
  final Widget footer;
  final Widget body;
  final Color headerColor;
  final Color footerColor;
  final double headerHeight;

  const HeaderFooterwidget(
      {Key key,
        this.header,
        this.footer,
        this.body,
        this.headerColor = Colors.blue,
        this.footerColor = Colors.grey
        ,
        this.headerHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Stack _buildBody() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 20,
          bottom: 120,
          right: 0,
          width: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(color: headerColor),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 120,
          child: DecoratedBox(
            decoration: BoxDecoration(color: footerColor),
          ),
        ),
        Positioned(
          bottom: 100,
          right: 0,
          width: 10,
          height: 60,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: headerColor,
                borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(20.0))),
          ),
        ),
        Column(
          children: <Widget>[
            _buildHeader(),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: body,
              ),
            ),
            const SizedBox(height: 10.0),
            footer,
          ],
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      height: headerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0)),
        color: headerColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: header,
    );
  }
}