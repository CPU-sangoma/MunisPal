
import 'package:munis_pal/Screens/Registration/Login_Screen.dart';
import 'package:munis_pal/Widgets/BackgroundEffect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munis_pal/Providers/UserReg/RegistrationClasses.dart';
import 'package:munis_pal/Widgets/BackgroundEffect.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = "/signupScreen";

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signupform = GlobalKey<FormState>();
  final _emailnode = FocusNode();
  final _nameNode = FocusNode();
  final _lastnamenode = FocusNode();
  final _phoneNumbernode = FocusNode();
  final _firstNamenode = FocusNode();
  final _accountnode = FocusNode();
  final _provincenode = FocusNode();
  final _passwordnode = FocusNode();
  final _conpasswordnode = FocusNode();
  final _localmuninode = FocusNode();
  var _password1C = TextEditingController();

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
  String dropDownVal = "Resident";

  @override
  void dispose() {
    _emailnode.dispose();
    _nameNode.dispose();
    _accountnode.dispose();
    _provincenode.dispose();
    _localmuninode.dispose();
    _firstNamenode.dispose();
    _lastnamenode.dispose();
    _passwordnode.dispose();
    _conpasswordnode.dispose();
    _phoneNumbernode.dispose();
    _password1C.dispose();
    super.dispose();

  }

  String _emptyVal(String val) {
    if (val.isEmpty) {
      return "make sure this field is not empty";
    }
    return null;
  }

  void _signUp() {
    final isValid = _signupform.currentState.validate();

    if (isValid) {
      print("mxm");
      _signupform.currentState.save();
      user.signup().then((val){
        print("awelele");
      });
    }

  }

  String passwordCheck(String no1, String no2){

    if(no1 != no2){
      return "password 1 does not match password Confirmation keng ka wena?";
    }
    return null;

  }

  @override
  Widget build(BuildContext context) {
    var MQ = MediaQuery.of(context);
    return Scaffold(
        body: BackGroundEffect(
          containerHeight: (MQ.size.height - MQ.padding.top) * 1,
          backgroundHeight: (MQ.size.height - MQ.padding.top) * 1,
          CurrentScreen:    SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    height: (MQ.size.height - MQ.padding.top) * 0.36,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Icon(
                            Icons.check_circle,
                            size: 50.0,
                            color: Colors.yellow[700],
                          ),
                        ),
                        Text(
                          "Signup",
                          style: TextStyle(
                            color: Colors.green[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: (MQ.size.height - MQ.padding.top) * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: Form(
                          key: _signupform,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                        width: 3.0
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.7),
                                  prefixIcon: Icon(Icons.person,color:Colors.red[500] ),
                                  labelText: "User Name",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.amber)),
                                ),
                                textInputAction: TextInputAction.next,
                                onSaved: (value) {
                                  user = UserReg(
                                    userName: value,
                                    province: user.province,
                                    password: user.password,
                                    email: user.email,
                                    confirmPassword: user.confirmPassword,
                                    userType: user.userType,
                                    phonenumbers: user.phonenumbers,
                                    localMuniciplaity: user.localMuniciplaity,
                                    firstName: user.firstName,
                                    lastName: user.lastName,
                                  );
                                  FocusScope.of(context).requestFocus(_firstNamenode);
                                },
                                validator: (value) {
                                  return _emptyVal(value);
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Colors.black,
                                          width: 3.0
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.7),
                                    prefixIcon: Icon(Icons.person,color:Colors.red[500]),
                                    labelText: "First Name",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.amber))),
                                textInputAction: TextInputAction.next,
                                focusNode: _firstNamenode,
                                onSaved: (value) {
                                  user = UserReg(
                                    userName: user.userName,
                                    province: user.province,
                                    password: user.password,
                                    email: user.email,
                                    confirmPassword: user.confirmPassword,
                                    userType: user.userType,
                                    phonenumbers: user.phonenumbers,
                                    localMuniciplaity: user.localMuniciplaity,
                                    firstName: value,
                                    lastName: user.lastName,
                                  );
                                  FocusScope.of(context).requestFocus(_lastnamenode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "field can not be left empty";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Colors.black,
                                          width: 3.0
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.7),
                                    prefixIcon: Icon(Icons.person,color:Colors.red[500]),
                                    labelText: "Last Name",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.amber))),
                                textInputAction: TextInputAction.next,
                                focusNode: _lastnamenode,
                                onSaved: (value) {
                                  user = UserReg(
                                    userName: user.userName,
                                    province: user.province,
                                    password: user.password,
                                    email: user.email,
                                    confirmPassword: user.confirmPassword,
                                    userType: user.userType,
                                    phonenumbers: user.phonenumbers,
                                    localMuniciplaity: user.localMuniciplaity,
                                    firstName: user.firstName,
                                    lastName: value,
                                  );
                                  FocusScope.of(context).requestFocus(_accountnode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "field can not be left empty";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              DropdownButtonFormField(
                                  elevation: 5,
                                  onSaved: (Val){
                                    user = UserReg(
                                      userName: user.userName,
                                      province: user.province,
                                      password: user.password,
                                      email: user.email,
                                      confirmPassword: user.confirmPassword,
                                      userType: Val,
                                      phonenumbers: user.phonenumbers,
                                      localMuniciplaity: user.localMuniciplaity,
                                      firstName: user.firstName,
                                      lastName: user.lastName,
                                    );
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color: Colors.black,
                                            width: 3.0
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.7),
                                      prefixIcon: Icon(Icons.person,color:Colors.red[500]),
                                      labelText: "User Type",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.amber))) ,
                                  value:dropDownVal,
                                  icon: Icon(Icons.arrow_downward,color: Colors.red),
                                  hint: Text(
                                      "User Type"
                                  ),
                                  onChanged: (Val){
                                    setState(() {
                                      dropDownVal = Val;
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem(
                                        child: Text("Resident"),
                                        value: "Resident"
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Admin"),
                                      value: "Admin",
                                    )
                                  ]
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                        width: 3.0
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.7),
                                  prefixIcon: Icon(Icons.email,color:Colors.red[500]),
                                  labelText: "Email",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.amber)),
                                ),
                                focusNode: _emailnode,
                                onSaved: (value) {
                                  user = UserReg(
                                    userName: user.userName,
                                    province: user.province,
                                    password: user.password,
                                    email: value,
                                    confirmPassword: user.confirmPassword,
                                    userType: user.userType,
                                    phonenumbers: user.phonenumbers,
                                    localMuniciplaity: user.email,
                                    firstName: user.firstName,
                                    lastName: user.lastName,
                                  );
                                  FocusScope.of(context).requestFocus(_phoneNumbernode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return " field cant be left empty, make sure all fields are filled up";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                        width: 3.0
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.7),
                                  prefixIcon: Icon(Icons.phone_android,color:Colors.red[500]),
                                  labelText: "Phone Numbers",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.amber)),
                                ),
                                focusNode: _phoneNumbernode,
                                onSaved: (value) {
                                  user = UserReg(
                                    userName: user.userName,
                                    province: user.province,
                                    password: user.password,
                                    email: user.email,
                                    confirmPassword: user.confirmPassword,
                                    userType: user.userType,
                                    phonenumbers: value,
                                    localMuniciplaity: user.localMuniciplaity,
                                    firstName: user.firstName,
                                    lastName: user.lastName,
                                  );
                                  FocusScope.of(context).requestFocus(_provincenode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return " field cant be left empty, make sure all fields are filled up";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                        width: 3.0
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.7),
                                  prefixIcon: Icon(Icons.location_on,color:Colors.red[500]),
                                  labelText: "Province",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.amber)),
                                ),
                                focusNode: _provincenode,
                                onSaved: (value) {
                                  user = UserReg(
                                    userName: user.userName,
                                    province: value,
                                    password: user.password,
                                    email: user.email,
                                    confirmPassword: user.confirmPassword,
                                    userType: user.userType,
                                    phonenumbers: user.phonenumbers,
                                    localMuniciplaity: user.localMuniciplaity,
                                    firstName: user.firstName,
                                    lastName: user.lastName,
                                  );
                                  FocusScope.of(context).requestFocus(_localmuninode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return " field cant be left empty, make sure all fields are filled up";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                        width: 3.0
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.7),
                                  prefixIcon: Icon(Icons.location_on,color:Colors.red[500]),
                                  labelText: "Local Municipality",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.amber)),
                                ),
                                focusNode: _localmuninode,
                                onSaved: (value) {
                                  user = UserReg(
                                    userName: user.userName,
                                    province: user.province,
                                    password: user.password,
                                    email: user.email,
                                    confirmPassword: user.confirmPassword,
                                    userType: user.userType,
                                    phonenumbers: user.phonenumbers,
                                    localMuniciplaity: value,
                                    firstName: user.firstName,
                                    lastName: user.lastName,
                                  );
                                  FocusScope.of(context).requestFocus(_passwordnode);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return " field cant be left empty, make sure all fields are filled up";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Colors.black,
                                          width: 3.0
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.7),
                                    prefixIcon: Icon(Icons.location_on,color:Colors.red[500],),
                                    labelText: "Password",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.amber))),
                                focusNode: _passwordnode,
                                onSaved: (value) {
                                  user = UserReg(
                                    userName: user.userName,
                                    province: user.province,
                                    password: value,
                                    email: user.email,
                                    confirmPassword: user.confirmPassword,
                                    userType: user.userType,
                                    phonenumbers: user.phonenumbers,
                                    localMuniciplaity: user.localMuniciplaity,
                                    firstName: user.firstName,
                                    lastName: user.lastName,
                                  );
                                  FocusScope.of(context).requestFocus(_conpasswordnode);
                                },
                                controller: _password1C,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return " field cant be left empty, make sure all fields are filled up";
                                  }
                                  if (value.length <= 7) {
                                    return "password too short, 8 digits minimum";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                        width: 3.0
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.7),
                                  prefixIcon: Icon(Icons.lock,color: Colors.red[500],),
                                  labelText: "Confirm password",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.amber)),
                                ),
                                focusNode: _conpasswordnode,
                                onFieldSubmitted: (value) {
                                  user = UserReg(
                                    userName: user.userName,
                                    province: user.province,
                                    password: user.password,
                                    email: user.email,
                                    confirmPassword: value,
                                    userType: user.userType,
                                    phonenumbers: user.phonenumbers,
                                    localMuniciplaity: user.localMuniciplaity,
                                    firstName: user.firstName,
                                    lastName: user.lastName,
                                  );
                                  _signUp();
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return " field cant be left empty, make sure all fields are filled up";
                                  }
                                  if(_password1C.text != value){
                                    return "Passwords don't match";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(      decoration: BoxDecoration(
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
                    elevation: 7.0,
                    onPressed: () {
                      _signUp();
                    },
                    color: Colors.green[500],
                    icon: Icon(Icons.done,color: Colors.white,),
                    label: Text(
                      "Sign-Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                  child: Text(
                    "Already Have an Account",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
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

