import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/home/homepage.dart';
import 'package:pgimer/main.dart';

class Forgot extends StatefulWidget {
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  final TextEditingController email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: abc,
          body: Container(
              child: ListView(
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
                          CustomAppbar(abc,'Forgot Password'),],),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    Container(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.025, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                                labelText: 'Registered Email: ',
                                labelStyle: TextStyle(
                                    fontFamily: 'Pangolin',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: mainColor))),
                            validator: (email){
                              if(email.isEmpty)
                              {
                                return('Please Enter Your Email-ID');
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.025),
                          SizedBox(height: MediaQuery.of(context).size.height*0.00125),
                          SizedBox(height: MediaQuery.of(context).size.height*0.05),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40.0,
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: RaisedButton(
                              onPressed:(){
                                reset(email.text);
                              },
                              color: mainColor,
                              child: Text("Confirm",
                                style: TextStyle(
                                    color: Colors.white
                                ),),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    last(context)
                  ]))
      ),
    );
  }
  Future reset(String email) async {
    Map data = {
      "email": email
    };
    var jsonResponse;
    final response = await http.post(
        "$url/api/user/sendPasswordResetEmail", body: data,
        headers: {'x-source':'mobile'});
    print('here');
    print(response.body);
    jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if (jsonResponse['success'] == true) {
      displayDialog(context, "Success", "Email sent Successfully for resetting password");
    }
    else {
      displayDialog(context, "Error", "${jsonResponse['msg']}");
    }
    print(jsonResponse['msg']);

  }
  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
                title: Text(title),
                content: Text(text),
              actions: [
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);
                  },
                  child: Text('Next'),
                ),
              ],
            ),
      );

}
