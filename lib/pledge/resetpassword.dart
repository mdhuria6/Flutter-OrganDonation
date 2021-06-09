import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/main.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  final TextEditingController oldp = new TextEditingController();
  final TextEditingController newp = new TextEditingController();

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
                    CustomAppbar(abc,'Reset Password'),],),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.025, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: oldp,
                      decoration: InputDecoration(
                          labelText: 'OLD PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Pangolin',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                          validator: (oldp){
                            if(oldp.isEmpty)
                            {
                              return('Please Enter old Password');
                            }
                            return null;
                          },
                      obscureText: true,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.025),
                    TextFormField(
                      controller: newp,
                      decoration: InputDecoration(
                          labelText: 'NEW PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Pangolin',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: mainColor))),
                          validator: (newp){
                            if(newp.isEmpty)
                            {
                              return('Please Enter new Password');
                            }
                            return null;
                          },
                      obscureText: true,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.05),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40.0,
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: RaisedButton(
                        onPressed:(){
                          displaydialog();
                          reset(oldp.text, newp.text);
                        },
                        color: mainColor,
                        child: Text("Reset",
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
              last(context),
            ],
          ),
        )
      ),
    );
  }
  Future reset(String oldpa,String newpa) async {
    Map data = {
      "oldPassword": oldpa,
      "newPassword": newpa
    };
    var jsonResponse;
    String token = await storage.read(key: "jwt");
    print(token);
    final response = await http.put(
        "$url/api/user/changePassword", body: data,
        headers: {'x-auth-token': token, 'x-source':'mobile'});
    print('here');
    jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if (jsonResponse['success'] == true) {
      displayDialog(context, "Success", "Password Reset Successfully");
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
                content: Text(text)
            ),
      );
  void displaydialog() =>
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: Text('Reset Password'),
              content: Text('Are You Sure you want to reset your Password?'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () async {
                    reset(oldp.text, newp.text);
                  },
                  child: Text('YES'),
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('NO'),
                )
              ],
            ),
      );
}
