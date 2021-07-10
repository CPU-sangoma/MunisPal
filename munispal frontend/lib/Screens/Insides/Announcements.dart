import 'package:flutter/material.dart';
import 'package:munis_pal/Widgets/AnnouncementWidget.dart';
import 'package:provider/provider.dart';
import 'package:munis_pal/Providers/UserClass.dart';

class AnnouncementScreen extends StatefulWidget {
  static String routeName = "/Announcement";

  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

var appbar = AppBar(
  backgroundColor: Colors.green[900],
  title: Text(
    "Announcement",
    style: TextStyle(
      color: Colors.yellow[800],
    ),
  ),
  elevation: 5,
);

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    var munis = Provider.of<MunisData>(context);
    return Scaffold(
      appBar: appbar,
      body: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<List<Announcement>>(
            future: munis.getMyAnnouncements(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data.length > 0) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return AnnounceWidget(
                          index: index,
                          obj: snapshot.data,
                        );
                      },
                    );
                  } else {
                    return Center(
                        child: Text("You dont have any announcements"));
                  }
                } else {
                  return Center(child: Text("Something went wrong"));
                }
              }
            },
          )),
    );
  }
}
