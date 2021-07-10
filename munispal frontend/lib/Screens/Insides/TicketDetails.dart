import 'package:flutter/material.dart';
import 'package:munis_pal/Providers/UserClass.dart';
import 'package:munis_pal/Screens/Insides/Announcements.dart';
import 'package:munis_pal/Screens/Insides/TicketStatus.dart';
class TicketDetailsScreen extends StatefulWidget {
  static String routeName = "/ticketscreen";

  @override
  _TicketDetailsScreenState createState() => _TicketDetailsScreenState();
}



var appbar = AppBar(
  backgroundColor: Colors.green[900],
  title: Text(
    "Ticket Details",
    style: TextStyle(
      color: Colors.yellow[800],
    ),
  ),
  elevation: 5,
  actions: <Widget>[
    IconButton(
  icon: Icon(
        Icons.notification_important,
        color: Colors.yellow[800],
        size: 30.0,
      ),
      onPressed: () {

      },
    ),
  ],
);

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    var obj = ModalRoute.of(context).settings.arguments as Map<String,Ticket>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(
          "Ticket Details",
          style: TextStyle(
            color: Colors.yellow[800],
          ),
        ),
        elevation: 5,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notification_important,
              color: Colors.yellow[800],
              size: 30.0,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AnnouncementScreen.routeName);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            width: mq.size.width * 1,
            height: (mq.size.height -
                    appbar.preferredSize.height -
                    mq.padding.top) *
                0.91,
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 250.0,
                    width: 250.0,
                    color: Colors.black,
                    child: Image.network("http://192.168.43.50:8000${obj['obj'].picture}",fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  width: mq.size.width * 1,
                  color: Colors.green[400],
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Description",
                        style: TextStyle(
                          color: Colors.brown[900],
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        obj['obj'].description,
                        style: TextStyle(
                          color: Colors.brown[900],
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  width: mq.size.width * 1,
                  color: Colors.yellow[400],
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Province",
                        style: TextStyle(
                          color: Colors.brown[900],
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        obj['obj'].province,
                        style: TextStyle(
                          color: Colors.brown[900],
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  width: mq.size.width * 1,
                  color: Colors.red[400],
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Municipality",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        obj['obj'].local_municipality,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  width: mq.size.width * 1,
                  color: Colors.yellow[400],
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Time lodged",
                        style: TextStyle(
                          color: Colors.brown[900],
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        obj['obj'].time,
                        style: TextStyle(
                          color: Colors.brown[900],
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),

              ],

            ),
          ),
          Spacer(),
          Container(
            width: mq.size.width * 1,
            height: (mq.size.height -
                mq.padding.top -
                appbar.preferredSize.height) *
                0.09,
            child: Container(
              padding: EdgeInsets.all(12.0),
              color: Colors.deepPurple,
              child: Row(
                children: <Widget>[
                  Text(
                    "Check Status",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  RaisedButton.icon(
                    color: Colors.white,
                    onPressed: () {
                     Navigator.of(context).pushNamed(TicketStatus.routeName,arguments: {'id':obj['obj'].id});
                    },
                    icon: Icon(
                      Icons.timeline,
                      color: Colors.deepPurple,
                    ),
                    label: Text(
                      "Status",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
