import 'package:flutter/material.dart';
import 'package:munis_pal/Providers/UserClass.dart';


class AnnounceScreenDetail extends StatefulWidget {
  static String routeName = "/announcedetail";
  @override
  _AnnounceScreenDetailState createState() => _AnnounceScreenDetailState();
}

var appbar = AppBar(
  backgroundColor: Colors.green[900],
  title: Text(
    "Announcement Details",
    style: TextStyle(
      color: Colors.yellow[800],
    ),
  ),
  elevation: 5,
);

class _AnnounceScreenDetailState extends State<AnnounceScreenDetail> {
  @override
  Widget build(BuildContext context) {
    Map<String,Announcement> obj = ModalRoute.of(context).settings.arguments as Map<String,Announcement>;
    return Scaffold(
      appBar:appbar,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                obj['obj'].datetime,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0 ,
            ),
            Container(
              height: 400.00,
              child: ListView(
                children: <Widget>[
                  Text(
                     obj['obj'].message,
                    style: TextStyle(
                      fontSize: 18.0,
                      wordSpacing: 4.0,
                    ),
                  ),
                ],
              )
            ),
            Spacer(),
            Container(
              child: Column(
                children: <Widget>[
                  Text("${obj['obj'].local_municipality} Municipality Admin",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("${obj['obj'].author['first_name']} ${obj['obj'].author['last_name']}")
                ],
              )
            ),

          ],
        ),
      ),

    );
  }
}
