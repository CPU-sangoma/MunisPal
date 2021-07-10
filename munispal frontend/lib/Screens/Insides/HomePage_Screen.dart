import 'package:flutter/material.dart';
import 'package:munis_pal/Screens/Insides/Announcements.dart';
import 'package:munis_pal/Screens/Insides/SelectCategory.dart';
import 'package:munis_pal/Widgets/ComplaintWidget.dart';
import 'package:provider/provider.dart';
import 'package:munis_pal/Providers/UserClass.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homePage";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var appbar = AppBar(

  );

  @override
  Widget build(BuildContext context) {
    var munis = Provider.of<MunisData>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(
          "My Complaints",
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
        child: FutureBuilder<List<Ticket>>(
          future: munis.getMyTickets(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
            }else{
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.data.length > 0){
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,index){
                      return ComplaintWig(
                        data: snapshot.data,
                        index: index,
                      );
                    },
                  );
                }else{
                  return Center(
                    child: Text("You have no complaints yet"),
                  );
                }
              }else{
                return Center(
                  child: Text("Something went wrong"),
                );
              }
            }
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,size: 30,),
        backgroundColor: Colors.purple[900],
        onPressed: (){
          Navigator.of(context).pushNamed(CategoryScreen.routeName);
        },
      ),
    );
  }
}
