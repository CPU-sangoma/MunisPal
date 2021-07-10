import 'package:flutter/material.dart';
import 'package:munis_pal/Providers/UserClass.dart';
import 'package:munis_pal/Screens/Insides/TicketDetails.dart';
import 'package:provider/provider.dart';

class ComplaintWig extends StatelessWidget {
  final List<Ticket> data;
  final int index;

  ComplaintWig({
    @required this.data,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    var munis = Provider.of<MunisData>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(TicketDetailsScreen.routeName,arguments: {'obj':this.data[this.index]});
      },
      child: Card(
        color: Colors.yellow,
        elevation: 10,
        child: ListTile(
          title: Text(
            this.data[this.index].category,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.delete, size: 30, color: Colors.red[900]),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      elevation: 10,
                      title: Text("Delete Complaint"),
                      content:
                          Text("Are you sure you want to delete this Ticket?"),
                      actions: <Widget>[
                        FlatButton.icon(
                            onPressed: () {
                              munis.deleteTicket(this.data[index].id).then((value){
                                Navigator.of(context).pop();
                              });
                            },
                            icon: Icon(Icons.delete,color: Colors.yellow[800],),
                            label: Text("yes")),
                        FlatButton.icon(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.cancel,color: Colors.yellow[800],),
                            label: Text("no")),
                      ],
                    );
                  });
            },
          ),
          subtitle: Text(
            "Status: ${this.data[this.index].progress}",
            style: TextStyle(
              color: Colors.green[900],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
