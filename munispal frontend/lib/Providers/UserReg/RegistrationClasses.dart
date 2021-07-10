import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserReg with ChangeNotifier{
  String userName;
  String firstName;
  String lastName;
  String email;
  String userType;
  String phonenumbers;
  String province;
  String localMuniciplaity;
  String password;
  String confirmPassword;

  UserReg(
      {@required this.userName,
        @required this.email,
        @required this.firstName,
        @required this.lastName,
        @required this.province,
        @required this.userType,
        @required this.localMuniciplaity,
        @required this.password,
        @required this.phonenumbers,
        @required this.confirmPassword});


  Future<void> signup() async{

    const String url = "http://192.168.43.50:8000/popsyman/auth/register";

    Map body = {
      "email": this.email,
      "username": this.userName,
      "user_type": this.userType,
      "last_name": this.lastName,
      "first_name": this.firstName,
      "phone_number": this.phonenumbers,
      "province": this.province,
      "local_municipality": this.localMuniciplaity,
      "password": this.password,
      "password2": this.confirmPassword,
    };

    var result = await http.post(url,body: jsonEncode(body),headers:{
      "Content-type": "application/json",
    });

    print(result.body);

  }

  Future<void> logIn() async{

    SharedPreferences token = await SharedPreferences.getInstance();
    SharedPreferences type = await SharedPreferences.getInstance();

    const String url = "http://192.168.43.50:8000/popsyman/auth/login";

    Map<String,String> body ={

      "username": this.userName,
      "password": this.password,
    };

    var result = await http.post(url,body: jsonEncode(body),headers: {
      "Content-type": "application/json"
    });

    var res = jsonDecode(result.body);

    token.setString('Token', res['token']);
    token.setString('Type', res['user_type']);

    print(res['token']);
    print(token.getString('Type'));


  }
}
