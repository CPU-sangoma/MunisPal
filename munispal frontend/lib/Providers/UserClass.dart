import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MunisData extends ChangeNotifier {
  List<Ticket> MyTicketList = [];
  List<Announcement> myAnnouncementsList =[];

  Future<List<Ticket>> getMyTickets() async {
    SharedPreferences token = await SharedPreferences.getInstance();
    String toks = token.getString('Token');
    String url = "http://192.168.43.50:8000/popsyman/ticket/getmytickets";

    var result = await http.get(url, headers: {
      'Content-type': 'application/json',
      'Authorization': 'Token $toks',
    });

    List data = jsonDecode(result.body);

    List<Ticket> newdata = [];

    data.forEach((element) {
      newdata.add(
        Ticket(
            province: element['province'],
            description: element['description'],
            at_home: element['at_home'],
            author: element['author'],
            category: element['category'],
            id: element['id'],
            progress: element['progress'],
            latitude: element['latitude'],
            local_municipality: element['local_municipality'],
            longitude: element['longitude'],
            picture: element['picture'],
            priority: element['priority'],
            time: element['time'],
            video: element['video'],
            voice_note: element['voice_note']),
      );
    });


    MyTicketList = newdata;
    return [...MyTicketList];
  }

  Future<http.Response> deleteTicket(int id) async {
    SharedPreferences token = await SharedPreferences.getInstance();
    String toks = token.get('Token');
    String url = "http://192.168.43.50:8000/popsyman/ticket/deletemyticket/$id";

    return http.post(url, headers: {
      'Content-type': 'application/json',
      'Authorization': 'Token $toks',
    }).then((value) {
      notifyListeners();
    });
  }

  Future<Map<String, dynamic>> getStatus(int id) async {
    SharedPreferences token = await SharedPreferences.getInstance();
    String toks = token.get('Token');

    String url = "http://192.168.43.50:8000/popsyman/ticket/statusdetails/$id";

    var result = await http.get(url, headers: {
      'Content-type': 'application/json',
      'Authorization': 'Token $toks',
    });

    Map<String, dynamic> data = jsonDecode(result.body);


    return data;
  }


  Future<List<Announcement>> getMyAnnouncements() async {
    SharedPreferences token = await SharedPreferences.getInstance();
    String toks = token.get('Token');

    String url = "http://192.168.43.50:8000/popsyman/ticket/myannouncements";

    var result = await http.get(url, headers: {
      'Content-type': 'application/json',
      'Authorization': 'Token $toks',
    });

    List data = jsonDecode(result.body);

    List<Announcement> newData = [];

    data.forEach((element) {
      newData.add(Announcement(
          id: element['id'],
          title: element['title'],
        author: element['author'],
        message: element['message'],
        datetime:element['datetime'],
        local_municipality: element['local_municipality'],
      ));
    });

    myAnnouncementsList = newData;

    print(newData[0].author['last_name']);
    return [...myAnnouncementsList];

  }
}


class Ticket {
  final Map<String, dynamic> author;
  final String category;
  final int id;
  final String description;
  final String time;
  final String picture;
  final String voice_note;
  final String video;
  final String latitude;
  final String longitude;
  final String province;
  final String local_municipality;
  final int priority;
  final String progress;
  final bool at_home;

  Ticket({
    @required this.province,
    @required this.description,
    @required this.progress,
    @required this.at_home,
    @required this.author,
    @required this.category,
    @required this.latitude,
    @required this.id,
    @required this.local_municipality,
    @required this.longitude,
    @required this.picture,
    @required this.priority,
    @required this.time,
    @required this.video,
    @required this.voice_note,
  });
}

class Status {
  final int id;
  final Map<String, dynamic> ticket;
  final int stage;
  final String description;
  final double weight;

  Status({
    @required this.description,
    @required this.id,
    @required this.stage,
    @required this.ticket,
    @required this.weight,
  });
}

class Announcement {

  final int id;
  final String title;
  final String message;
  final String datetime;
  final Map<String,dynamic> author;
  final String local_municipality;

  Announcement({
    @required this.id,
    @required this.local_municipality,
    @required this.title,
    @required this.author,
    @required this.message,
    @required this.datetime,
  });

}
