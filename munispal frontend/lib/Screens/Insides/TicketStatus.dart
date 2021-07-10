import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munis_pal/Providers/UserClass.dart';
import 'package:munis_pal/Screens/Insides/Announcements.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';


class TicketStatus extends StatefulWidget {
  static String routeName = "/Tickstatus";
  @override
  _TicketStatusState createState() => _TicketStatusState();
}
var appbar = AppBar(

);

class _TicketStatusState extends State<TicketStatus> {
  @override
  Widget build(BuildContext context) {
    var muni = Provider.of<MunisData>(context);
    Map<String,int> datas = ModalRoute.of(context).settings.arguments as Map<String,int>;
    var mq = MediaQuery.of(context);
    muni.getStatus(9);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(
          "Status",
          style: TextStyle(
            color: Colors.yellow[800],
          ),
        ),
        elevation: 5,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notification_important,color: Colors.yellow[800],size: 30.0,),
            onPressed: (){
              Navigator.of(context).pushNamed(AnnouncementScreen.routeName);
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: (mq.size.height -appbar.preferredSize.height - mq.padding.top) *1,
        width: mq.size.width *1,
        child: FutureBuilder<Map<String,dynamic>>(
          future: muni.getStatus(datas['id']),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData == true){
                  return ListView(
                    children: <Widget>[
                      CircularPercentIndicator(
                        radius: 200,
                        progressColor: Colors.deepPurple,
                        animation: true,
                        animationDuration: 20,
                        header: Text(
                          "Complete",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.green[900]
                          ),
                        ),
                        percent: double.parse(snapshot.data['weight']) / 100,
                        center: Text(
                          "${snapshot.data['weight']}%",
                          style: TextStyle(
                              color: Colors.red[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(12.0),
                        width: mq.size.width * 1,
                        color: Colors.deepPurple,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Message",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data['description'],
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
                    ],
                  );
                }else{
                  return Center(
                    child: Text("Something went wrong"),
                  );
                }
              }else{
                return  Center(
                  child: Text("Something went wrong"),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
