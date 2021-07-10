import 'package:flutter/material.dart';
import 'package:munis_pal/Screens/Insides/ComplaintScreen.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = "/categoryscreen";
  var appbar = AppBar(
    backgroundColor: Colors.green[900],
    title: Text(
      "Type of Problem",
      style: TextStyle(
        color: Colors.yellow[800],
      ),
    ),
    elevation: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2,
            mainAxisSpacing: 7.0,
            crossAxisSpacing: 7.0,
          ),
          children: <Widget>[
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(ComplaintScreen.routeName,arguments: {'type':"Roads and Transport"});
              },
              child: GridTile(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                    color: Colors.grey[800],
                    child: Center(
                        child: 
                        Text(
                            "Roads and Transport",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                footer: Container(
                  height: 40.0,
                  color: Colors.black.withOpacity(0.3),
                  child: IconButton(
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Roads and Transport"),
                            content: Text("All matters related to roads and transportation example, port holes,worn out bridges etc"),
                          );
                        }
                      );
                    },
                    icon: Icon(Icons.info,color: Colors.pink[500],),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(ComplaintScreen.routeName,arguments: {"type":"Sewage and Sanitation"});
              },
              child: GridTile(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.brown[800],
                    child: Center(
                        child:
                        Text(
                          "Sewage and Sanitation",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                footer: Container(
                  height: 40.0,
                  color: Colors.black.withOpacity(0.3),
                  child: IconButton(
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Sewage and Sanitation"),
                              content: Text("Your well being and overall health is our priority, report drainage problems, leaking drains and overall heavily polluted water you think might be affecting your health and that of your community"),
                            );
                          }
                      );
                    },
                    icon: Icon(Icons.info,color: Colors.pink[500],),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(ComplaintScreen.routeName,arguments:{"type":"Water related issues"} );
              },
              child: GridTile(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.blue[700],
                    child: Center(
                        child:
                        Text(
                          "Water related issues",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                footer: Container(
                  height: 40.0,
                  color: Colors.black.withOpacity(0.3),
                  child: IconButton(
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Water related issues"),
                              content: Text("tell us about all the water troubles you are facing and let us fix them, cracked underground water pipes wont stop leaking? broke water taps at parks? we solve those too"),
                            );
                          }
                      );
                    },
                    icon: Icon(Icons.info,color: Colors.pink[500],),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(ComplaintScreen.routeName,arguments: {"type":"Electricity problems"} );
              },
              child: GridTile(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.yellow[800],
                    child: Center(
                        child:
                        Text(
                          "Electricity problems",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                footer: Container(
                  height: 40.0,
                  color: Colors.black.withOpacity(0.3),
                  child: IconButton(
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Electricity issues"),
                              content: Text("Apollos and street lights not working anymore? loose electricity cables that migth be dangerous to your community members? report it"),
                            );
                          }
                      );
                    },
                    icon: Icon(Icons.info,color: Colors.pink[500],),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(ComplaintScreen.routeName,arguments: {"type": "Garbage/Refuse Removal"});
              },
              child: GridTile(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.green[800],
                    child: Center(
                        child:
                        Text(
                          "Garbage/Refuse Removal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                footer: Container(
                  height: 40.0,
                  color: Colors.black.withOpacity(0.3),
                  child: IconButton(
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Waste Removal"),
                              content: Text("Want to report an illegal dumping sites, is the bush in you community getting to big? lodge a complaint"),
                            );
                          }
                      );
                    },
                    icon: Icon(Icons.info,color: Colors.pink[500],),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(ComplaintScreen.routeName,arguments: {"type":"Others"});
              },
              child: GridTile(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.black,
                    child: Center(
                        child:
                        Text(
                          "Others",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    )
                ),
                footer: Container(
                  height: 40.0,
                  color: Colors.black.withOpacity(0.3),
                  child: IconButton(
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Others"),
                              content: Text("Not particularly sure which category your problem is? that's fine lodge a complaint and we will tell wherether it's something we can help with"),
                            );
                          }
                      );
                    },
                    icon: Icon(Icons.info,color: Colors.pink[500],),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
