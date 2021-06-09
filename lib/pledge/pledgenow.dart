import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pgimer/Services/feedback.dart';
import 'package:pgimer/home/homepage.dart';
import 'package:pgimer/loginpage.dart';
import 'package:pgimer/main.dart';
import 'package:pgimer/pledge/PledgePage1.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/global/drawer.dart';
import 'package:pgimer/global/my_flutter_app_icons.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:pgimer/pledge/result.dart';
import 'package:pgimer/static/AboutUs.dart';
import 'package:pgimer/static/faqs.dart';
import 'package:pgimer/static/reachus.dart';

class PledgeNow extends StatefulWidget {
  @override
  _PledgeNowState createState() => _PledgeNowState();
}

class _PledgeNowState extends State<PledgeNow> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    fetchData();
  }

  Future checkLoginStatus() async {
    String value = await storage.read(key: "jwt");
    bool hasExpired = JwtDecoder.isExpired(value);
    print(hasExpired);
    if (hasExpired) {
      displaydialog();
    }
  }

  Future fetchData() async {
    var jsonResponse;
    String value = await storage.read(key: "jwt");
    final response = await http.get("$url/api/user/profile", headers: {
      'Content-type': 'application/json',
      "x-auth-token": value,
      'x-source': 'mobile'
    });
    jsonResponse = json.decode(response.body);
    Map pledge = jsonResponse['pledgeDetails'];
    if (jsonResponse['isPledged'] == true) {
      if (pledge['isApproved'] == true) {
        alertDisplay('Success',
            'You have Successfully Pledged for Organ Donation and your form has been approved.');
        print('pledged and approved');
      } else {
        alertdisplay('Success',
            'You have Successfully Pledged for Organ Donation and your form has not yet been approved.');
        print('pledged and not approved');
      }
    } else {
      print('Not Yet Pledged');
    }
  }

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
  void alertDisplay(String a, String b) => showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('$a'),
      content: Text('$b'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CheckStatus()));
          },
          child: Text('CHECK'),
        ),
      ],
    ),
  );
  void displaydialog() => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Notice'),
          content: Text('You are not Logged In.'
              'Do you wish to logIn Now?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
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
                    CustomAppbar(abc, 'PLEDGE NOW'),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                'FOR ORGAN OR TISSUE PLEDGING',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                '(To be filled by individual of age 18 year or above)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'acme',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Note:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.065,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'acme',
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              CustomTile(
                  '1. Organ donation is a family decision. Therefore, it is important that you discuss your decision with family members and loved ones so that it will be easier for them to follow through with your wishes. '),
              CustomTile(
                  '2. One copy of the pledge form/pledge card to be with respective networking organisation, one copy to be retained by institution where the pledge is made.'),
              CustomTile(
                  '3. The person making the pledge has the option to withdraw the pledge.'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PledgePage1()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.all(Radius.circular(
                        MediaQuery.of(context).size.width * 0.06)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(MediaQuery.of(context).size.width * 0.02,
                            MediaQuery.of(context).size.width * 0.02),
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.47,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        MyFlutterApp.file_contract,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.049,
                      ),
                      Text(
                        '   Next',
                        style: TextStyle(
                            fontFamily: 'BreeSerif',
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.049,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Need Help?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.065,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'acme',
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              FlatButton(
                onPressed: () {
                  // The menu can be handled programatically using a key
                  if (fabKey.currentState.isOpen) {
                    fabKey.currentState.close();
                  } else {
                    fabKey.currentState.open();
                  }
                },
                child: Icon(Icons.navigate_next),
              ),
              last(context)
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FabCircularMenu(
            key: fabKey,
            // Cannot be `Alignment.center`
            alignment: Alignment.bottomRight,
            ringColor: mainColor,
            ringDiameter: 400.0,
            ringWidth: 80.0,
            fabSize: 64.0,
            fabElevation: 8.0,
            fabColor: mainColor,
            fabOpenIcon: Icon(Icons.menu, color: Colors.white),
            fabCloseIcon: Icon(Icons.close, color: Colors.white),
            fabMargin: const EdgeInsets.all(16.0),
            animationDuration: const Duration(milliseconds: 800),
            animationCurve: Curves.easeInOutCirc,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeedBack()));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(
                  Icons.feedback,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReachUs()));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(
                  Icons.import_contacts,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => FAQ()));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(
                  Icons.question_answer,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.book, color: Colors.white, size: 40.0),
              )
            ],
          ),
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final String A;
  CustomTile(this.A);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            '$A',
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontFamily: 'acme',
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
