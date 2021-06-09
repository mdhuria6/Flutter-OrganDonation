import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pgimer/home/homepage.dart';
import 'package:pgimer/loginpage.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/main.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  final _formKey = GlobalKey<FormState>();
  int _radioValue1 = -1;
  Register register= Register();
  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
      if(_radioValue1==0)
        {
          register.gender="Male";
        }
      if(_radioValue1==1)
        {
          register.gender="Female";
        }
      if(_radioValue1==2)
        {
          register.gender="__";
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        key: abc,
          body: ListView(//crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Stack(
                    children: [
                      CustomAppbar(abc,'REGISTER HERE'),],),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                Center(
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height*0.1,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/rotto.png'),
                  ),
                ),
            Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.025, left: 20.0, right: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'FIRST NAME',
                            labelStyle: TextStyle(
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: mainColor))),
                        validator: (value) {
                          if(value.isEmpty)
                          {
                            return('Please Enter First Name');
                          }
                          return null;
                        },
                        onSaved: (value){
                          register.firstName = value;
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.0125),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'MIDDLE NAME',
                            labelStyle: TextStyle(
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: mainColor))),
                        onSaved: (value){
                          register.middleName = value;
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.0125),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'LAST NAME',
                            labelStyle: TextStyle(
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: mainColor))),
                        onSaved: (value){
                          register.lastName = value;
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.0125),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL ID ',
                            labelStyle: TextStyle(
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: mainColor))),
                        validator: (value) {
                          if(value.isEmpty)
                          {
                            return('Please Enter EmailId');
                          }
                          return null;
                        },
                        onSaved: (value){
                          register.emailId = value;
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.0125),
                      Text('GENDER',
                      style: TextStyle(
                        fontSize: 18.0,
                          fontFamily: 'Pangolin',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      textAlign: TextAlign.left,),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 0,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          Text(
                            'MALE',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          Text(
                            'FEMALE',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          Text(
                            'PREFER NOT TO ANSWER',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.0125),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'PHONE NUMBER',
                            labelStyle: TextStyle(
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: mainColor))),
                        validator: (value) {
                          if(value.length<10)
                          {
                            return('Please Enter a Valid Phone Number');
                          }
                          return null;
                        },
                        maxLength: 10,
                        onSaved: (value){
                          register.mobileNo = value;
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.0125),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD ',
                            labelStyle: TextStyle(
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: mainColor))),
                        obscureText: true,
                        validator: (value) {
                          if(value.length<6)
                          {
                            return('Password length should be 6 minimum');
                          }
                          return null;
                        },
                        onSaved: (value){
                          register.password= value;
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.0125),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'CONFIRM PASSWORD ',
                            labelStyle: TextStyle(
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: mainColor))),
                        obscureText: true,
                        validator: (value) {
                          if(value.length<6)
                          {
                            return('Password length should be 6 minimum');
                          }
                          return null;
                        },
                        onSaved: (value){
                          register.repassword= value;
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
                      Container(
                          height: MediaQuery.of(context).size.height*0.05,
                          child: Material(
                            borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*0.025),
                            shadowColor: mainColor,
                            color: mainColor,
                            elevation: 7.0,
                            child: InkWell(
                              onTap: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  if(register.password==register.repassword)
                                    {
                                      signUp(register.firstName,register.middleName,register.lastName,register.emailId,register.gender,register.mobileNo,register.password);

                                    }
                                  else
                                    {
                                      displayDialog(context, "Error", "Password did not match");
                                    }
                                }
                              },
                              child: Center(
                                child: Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'BreeSerif'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: MediaQuery.of(context).size.height*0.025),
                      Container(
                        height: MediaQuery.of(context).size.height*0.05,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.5),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.05)),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text('Go Back',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'BreeSerif')),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      last(context),
                    ],
                  ),
                )),

          ])),
    );
  }
  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
                title: Text(title),
                content: Text(text)
            ),
      );
  void displaydialog() =>
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: Text('Account Created'),
              content: Text('Check your email for activation.\n\n'
                  'LogIn now?\n '),
              actions: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
                  },
                  child: Text('YES'),
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);
                  },
                  child: Text('NO'),
                )
              ],
            ),
      );
  Future signUp (String firstName, String middleName, String lastName, String emailId, String gender, var mobileNo, String password) async {
    Map data = {
          "firstName": firstName,
          "middleName": middleName,
          "lastName": lastName,
          "email": emailId,
          "password": password,
          "gender": gender,
          "mobileNo": mobileNo,
        };

    var jsonResponse;
    print(data);
    final response = await http.post(
        "$url/api/user/register",body: data, headers: {"x-source": "mobile"});
    jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse['success'] == true) {
        displaydialog();

      }
      else {
        displayDialog(context, "Error", "${jsonResponse['msg']}");
      }
  }
}
class Register {
  String firstName;
  String middleName;
  String lastName;
  String emailId;
  String gender;
  var mobileNo;
  String password;
  String repassword;

  Register({this.firstName, this.middleName, this.lastName, this.emailId, this.gender, this.mobileNo, this.password, this.repassword});
}


