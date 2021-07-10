import 'package:flutter/material.dart';
import 'package:munis_pal/Providers/UserClass.dart';
import 'package:munis_pal/Screens/Insides/AnnouncementDetail.dart';

class AnnounceWidget extends StatefulWidget {
  final List<Announcement> obj;
  final int index;


  AnnounceWidget({
    @required this.obj,
    @required this.index,
});
  @override
  _AnnounceWidgetState createState() => _AnnounceWidgetState();
}

class _AnnounceWidgetState extends State<AnnounceWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
          title: Text(
            widget.obj[widget.index].title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            widget.obj[widget.index].datetime,
          ),
          leading: CircleAvatar(
            child: Text("1",style: TextStyle(
                color: Colors.blue[900],
                fontWeight: FontWeight.bold
            ),),
            backgroundColor: Colors.pink[700],
          ),
          trailing: IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed(AnnounceScreenDetail.routeName,arguments: {'obj':widget.obj[widget.index]});
            },
            icon: Icon(Icons.arrow_forward,color: Colors.yellow[700],),
          )
      ),
    );
  }
}
