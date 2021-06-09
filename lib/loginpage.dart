import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pgimer/forgotpw.dart';
import 'package:pgimer/global/drawer.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/main.dart';
import 'package:pgimer/pledge/profile.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  var userJsonResponse;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                //padding: const EdgeInsets.only(top: 15),
                child: Stack(
                  children: [
                    //Align(child: Image.asset('images/sample2.png',width: MediaQuery.of(context).size.width * 0.91,height: MediaQuery.of(context).size.height * 0.45,),alignment: Alignment.center,),
                    CustomAppbar(abc,'LOGIN NOW'),],),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05),
              Center(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.height*0.1,
                  backgroundImage: AssetImage('images/rotto.png'),
                  backgroundColor: Colors.white,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.025, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          focusColor: mainColor,
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: mainColor))),
                        validator: (emailController){
                          if(emailController.isEmpty)
                          {
                            return('Please Enter First Name');
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.025),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: mainColor))),
                        obscureText: true,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.00125),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>Forgot()));
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Pangolin',
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40.0,
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: RaisedButton(
                            onPressed:(){
                              signIn(emailController.text, passwordController.text);
                            },
                          color: mainColor,
                            child: Text("LogIn",
                              style: TextStyle(
                              color: Colors.white
                              ),),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              ),
                          ),
                      ),
                    ],
                  )),
              SizedBox(height: MediaQuery.of(context).size.height*0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New User ?',
                    style: TextStyle(fontFamily: 'Pangolin',fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>SignupPage()));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: mainColor,
                          fontFamily: 'Pangolin',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              last(context)
            ],
          ),
        drawer: CustomDrawer()
      ),
    );
  }
  Future signIn(String email, String pass) async {
    Map data = {
      "email": email,
    "password": pass,
    };
    var jsonResponse;
    var response = await http.post(
        "$url/api/user/login", body:data,  headers: {"x-source": "mobile"});
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse['success'] == true) {
        displaydialog();
        String jwt = jsonResponse['msg'];
        storage.write(key:"jwt", value:jwt);
      }
      else {
        displayDialog(context, "Error", "${jsonResponse['msg']}");
      }
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
              title: Text('Success'),
              content: Text('Login Successful'),
              actions: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.push(context,
                         MaterialPageRoute(builder: (context) => UserProfile()));
                  },
                  child: Text('Next'),
                )
              ],
            ),
      );
  }
