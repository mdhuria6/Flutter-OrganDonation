import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pgimer/Services/feedback.dart';
import 'package:pgimer/Services/notices.dart';
import 'package:pgimer/Services/showcase.dart';
import 'package:pgimer/global/my_flutter_app_icons.dart';
import 'package:pgimer/home/homepage.dart';
import 'package:pgimer/main.dart';
import 'package:pgimer/pledge/pledgenow.dart';
import 'package:pgimer/pledge/resetpassword.dart';
import 'package:pgimer/pledge/result.dart';
class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var isLoading = false;
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  var jsonResponse;
  String fname, lname, gender, email;
  var mobile;
  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  check()
  {
    Map pledge = jsonResponse['pledgeDetails'];
    if (jsonResponse['isPledged'] == true) {
      if (pledge['isApproved'] == true) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CheckStatus()));
        print('pledged and approved');
      } else {
        alertdisplay('Success',
            'You have Successfully Pledged for Organ Donation and your form has not yet been approved.');
        print('pledged and not approved');
      }
    } else {
      displayDialog();
    }
  }
  void displayDialog() => showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('!! Alert !!'),
      content: Text('You have not pledged yet.\n'
          'Do you wish to Pledge Now?'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PledgeNow()));
          },
          child: Text('YES'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()),
                    (Route<dynamic> route) => false);
          },
          child: Text('NO'),
        )
      ],
    ),
  );
  void alertdisplay(String a, String b) => showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('$a'),
      content: Text('$b'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text('DONE'),
        ),
      ],
    ),
  );
  Future fetchdata() async{
    setState(() {
      isLoading = true;
    });
    String value=await storage.read(key: "jwt");
    final response =
    await http.get("$url/api/user/profile", headers: {'Content-type': 'application/json', "x-auth-token": value, 'x-source': 'mobile'});
    jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    setState(() {
      fname = jsonResponse["firstName"];
      lname = jsonResponse["lastName"];
      email = jsonResponse["email"];
      mobile = jsonResponse["mobileNo"];
      gender = jsonResponse["gender"];
    });
    setState(() {
      var key = jsonResponse['isPledged'];
      print(key.toString());
      storage.write(key:"pledge", value:key.toString());
      isLoading = false;
    });
  }

  Material myitems(IconData icon, String heading, onTap,) {
    return Material(
      color: Colors.white,
      elevation: 10.0,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
        width: MediaQuery.of(context).size.width*0.4,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(heading,
                style: TextStyle(
                  color: mainColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            GestureDetector(
              onTap: onTap,
              child: Material(
                color: mainColor,
                borderRadius: BorderRadius.circular(10.0),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: abc,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Your Profile',
              style: TextStyle(
                fontFamily: 'Acme',
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: mainColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(MyFlutterApp.home),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        ),
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(),
        ): ListView(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(Icons.person,
                  size: MediaQuery.of(context).size.width*0.25,),
                  backgroundColor: mainColor,
                  radius: MediaQuery.of(context).size.width*0.18,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text('$fname $lname',
                        style: TextStyle(
                            fontFamily: 'Pangolin',
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('$mobile',
                        style: TextStyle(
                            fontFamily: 'Pangolin',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('$gender',
                        style: TextStyle(
                            fontFamily: 'Pangolin',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('$email',
                        style: TextStyle(
                            fontFamily: 'Pangolin',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: mainColor,
              height: 20.0,
              thickness: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    myitems(MyFlutterApp.file_contract, "Pledge Status", (){check();}),
                    SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                    myitems(Icons.feedback, "Feedback", (){Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>FeedBack()));}),
                  ],
                ),
                Column(
                  children: [
                    myitems(Icons.center_focus_strong, "Events", (){Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Notice()));}),
                    SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                    myitems(MyFlutterApp.menu_circle, "ShowCase", (){Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>ShowCase()));}),
                  ],
                )
              ],
            ),
            SizedBox(height: 10.0,),
            RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.account_box,
                  color: Colors.white,),
                  SizedBox(width: 10.0,),
                  Text('Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),),
                ],
              ),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>ResetPassword()));
              },
              color: mainColor,
              highlightColor: Colors.red,
            ),
            RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(MyFlutterApp.logout,
                    color: Colors.white,),
                  SizedBox(width: 10.0,),
                  Text('Log Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),),
                ],
              ),
              onPressed: (){
                displaydialog();
              },
              color: mainColor,
              highlightColor: Colors.red,
            ),
            last(context)
          ],
        ),
      ),
    );
  }
  void displaydialog() =>
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: Text('Log Out'),
              content: Text('Are You Sure you want to log out?'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () async {
                    await storage.delete(key: "jwt");
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);
                  },
                  child: Text('YES'),
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>UserProfile()));
                  },
                  child: Text('NO'),
                ),
              ],
            ),
      );
}
