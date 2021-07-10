import 'package:flutter/material.dart';

class ComplaintScreen extends StatefulWidget {
  static String routeName = "/complaintScreen";
  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}
var appbar = AppBar(
  backgroundColor: Colors.green[900],
  title: Text(
    "Complaint Screen",
    style: TextStyle(
      color: Colors.yellow[800],
    ),
  ),
  elevation: 5,
);

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return Scaffold(
      appBar: appbar,
      body: Container(
        padding: EdgeInsets.all(20),
        width: mq.size.width,
        height: (mq.size.height-appbar.preferredSize.height - mq.padding.top) * 0.91,
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.edit,color: Colors.red[500],),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.green[900],
                      width: 3.0
                  ),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.7),
                labelText: "Title",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)
                ),
              ),

            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.edit,color: Colors.red[500],),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.green[900],
                      width: 3.0
                  ),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.7),
                labelText: "Description",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)
                ),
              ),

            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.edit,color: Colors.red[500],),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.green[900],
                      width: 3.0
                  ),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.7),
                labelText: "Title",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)
                ),
              ),

            ),
            SizedBox(
              height: 10.0,
            ),

          ],
        ),
      ),
    );
  }
}
