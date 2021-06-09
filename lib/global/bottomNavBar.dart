import 'package:flutter/material.dart';
import 'package:pgimer/global/my_flutter_app_icons.dart';
import 'package:pgimer/home/homepage.dart';
import 'package:pgimer/main.dart';
import 'package:pgimer/pledge/pledgenow.dart';
import 'package:pgimer/pledge/result.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  String key;
  getStatus()async
  {
    String a = await storage.read(key: "pledge");
    setState(() {
      key = a;
    });
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
  void initState()
  {
    super.initState();
    getStatus();
  }
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: mainColor,
      child:FlatButton(onPressed: (){
      if (key == "true") {
        if (key == "true") {
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
      },
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(MyFlutterApp.file_contract,
          color: Colors.white,
          size: MediaQuery.of(context).size.width*0.07,
          ),
          Text('Pledge Status',
          style: TextStyle(
          fontFamily:'BreeSerif',
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w300,
          fontSize: MediaQuery.of(context).size.width*0.07,
          color: Colors.white),
          textAlign: TextAlign.center,),
        ],
      ),)
    );
  }
}
