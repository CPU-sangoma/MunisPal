import 'package:munis_pal/Screens/Insides/HomePage_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munis_pal/Screens/Registration/Signup_Screen.dart';
import 'package:munis_pal/Providers/UserReg/RegistrationClasses.dart';
import 'package:munis_pal/Widgets/BackgroundEffect.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _passwordNode = FocusNode();
  final _loginformKey = GlobalKey<FormState>();
  var user = UserReg(
    userType: "",
    confirmPassword: "",
    email: "",
    password: "",
    province: "",
    firstName: "",
    lastName: "",
    localMuniciplaity: "",
    phonenumbers: "",
    userName: "",
  );


  @override
  void dispose() {
    _passwordNode.dispose();
    super.dispose();
  }

  void _savelogin(){
    final isvalid = _loginformKey.currentState.validate();
    if(isvalid){
      _loginformKey.currentState.save();
      user.logIn();
      Navigator.of(context).pushNamed(HomeScreen.routeName);

    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var MQ = MediaQuery.of(context);
    return Scaffold(
        body: BackGroundEffect(
          backgroundHeight: MQ.size.height * 1,
          containerHeight: MQ.size.height* 1 ,
          CurrentScreen: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    height: (MQ.size.height - MQ.padding.top) * 0.36,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Icon(Icons.lock,size: 50.0,color: Colors.yellow[700],),
                        ),
                        Text(
                          "Login Screen",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.green[900]
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(
                  height: (MQ.size.height - MQ.padding.top)*0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Form(
                        key: _loginformKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person,color: Colors.red[500],),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.green[900],
                                      width: 3.0
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.7),
                                labelText: "Username",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amber)
                                ),
                              ),
                              onFieldSubmitted: (_){
                                FocusScope.of(context).requestFocus(_passwordNode);
                              },
                              onSaved: (value){
                                user = UserReg(
                                  userName: value,
                                );
                              },
                              validator: (value){
                                if(value.isEmpty){
                                  return "cant leave the email field empty";
                                }
                                else{
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              validator: (value){
                                if(value.isEmpty){
                                  return "cant leave password field empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock,color: Colors.red[500],),
                                  labelText: "Password",
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.7),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.green[900],
                                        width: 3.0
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.amber)
                                  )
                              ),
                              focusNode: _passwordNode,
                              onSaved: (value){
                                user = UserReg(
                                  userName: user.userName,
                                  password: value,
                                );
                              },
                              onFieldSubmitted:(_){
                                _savelogin();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FlatButton(
                        onPressed: (){},
                        child: Text(
                          "Forgot PassWord?",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green[500],
                          blurRadius: 30.0,
                          spreadRadius: 3.0,

                        )
                      ]
                  ),
                  width: MQ.size.width * 0.5,
                  child: RaisedButton.icon(
                    onPressed: (){
                      _savelogin();
                    },
                    color: Colors.green[900],
                    icon: Icon(Icons.done),
                    label: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed(SignupScreen.routeName);
                  },
                  child: Text(
                    "Don't have an account? signup",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
          ),
        )

    );
  }
}
