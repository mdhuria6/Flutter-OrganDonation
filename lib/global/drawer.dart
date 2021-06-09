import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pgimer/Services/notices.dart';
import 'package:pgimer/Services/stats.dart';
import 'package:pgimer/loginpage.dart';
import 'package:pgimer/main.dart';
import 'package:pgimer/pledge/pledgenow.dart';
import 'package:pgimer/Services/showcase.dart';
import 'package:pgimer/pledge/profile.dart';
import 'package:pgimer/static//reachus.dart';
import 'package:pgimer/Services/feedback.dart';

class Gap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          color: Colors.green[900],
          thickness: MediaQuery.of(context).size.height*0.002,
        ),
      ],
    );
  }
}


class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  CustomListTile(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        child: InkWell(
          //splashColor: Colors.blueAccent,
          onTap: onTap,
          child: Material(
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
               // border: Border.all(color: Colors.green[800],width: 2),
                borderRadius: BorderRadius.only(topRight: Radius.circular(MediaQuery.of(context).size.width*0.04),bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.04)),
                /*boxShadow: [BoxShadow(
                  color: Colors.green[700],
                  offset: Offset(MediaQuery.of(context).size.width*0.01,MediaQuery.of(context).size.width*0.01),
                  spreadRadius: 0.5,
                  blurRadius: 1,
                ),],*/
              ),
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: 10.0,),
                      Icon(icon,color: mainColor,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(text,
                        style: TextStyle(color: Colors.green[900],
                          fontSize: 16.0
                        ),),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_right,color: Colors.green[900],),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        //color: Colors.lightGreenAccent[100],
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            DrawerHeader(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(MediaQuery.of(context).size.width*0.08),bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.04)),
                    color: mainColor,
                    boxShadow: [BoxShadow(
                      color: mainColor.withOpacity(0.5),
                      offset: Offset(MediaQuery.of(context).size.width*0.02,MediaQuery.of(context).size.width*0.02),
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),],
                  ),
                  child: Column(
                   // mainAxisAlignment: MainAxisAlignment.,
                    children: <Widget>[
                      //SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                height: MediaQuery.of(context).size.width*0.14,
                                child: Image.asset('images/rotto.png')
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height*0.1,
                              // width: MediaQuery.of(context).size.width*0.52,
                              child: Align(
                                child: Text(" ROTTO PGIMER",style: TextStyle(fontFamily:'acme',decoration: TextDecoration.none,color: Colors.white,fontSize: MediaQuery.of(context).size.width*0.07),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),

                          ],
                        ),
                      ),
                      Text('BE THE CHANGE\n BE AN ORGAN DONOR',style: TextStyle(fontFamily:'BreeSerif',decoration: TextDecoration.none,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.04,color: Colors.white),textAlign: TextAlign.center,),
                    ],
                  ),
                )
            ),
            Gap(),
            // CustomListTile(Icons.home, 'Home', () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context)=>HomePage()));
            // }),
            // //SizedBox(height: 5),
            // Gap(),
            CustomListTile(Icons.person, 'User', () async {
              String value = await storage.read(key: "jwt");
              bool hasExpired = JwtDecoder.isExpired(value);
              if(hasExpired) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>LoginPage()));
              }
              else{
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>UserProfile()));
              }
            }),
           // SizedBox(height: 5),
            Gap(),
            CustomListTile(Icons.star, 'Pledge Status', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>PledgeNow()));
            }),
            //SizedBox(height: 5),
            Gap(),
            CustomListTile(Icons.album, 'News and Events', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Notice()));
            }),
            //SizedBox(height: 5),
            Gap(),
            // CustomListTile(Icons.highlight, 'News', () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context)=>News()));
            // }),
            //SizedBox(height: 5),
            // Gap(),
            CustomListTile(Icons.insert_chart, 'Statistics', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Stats()));
            }),
            //SizedBox(height: 5),
            Gap(),
            CustomListTile(Icons.photo_album, 'Gallery', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>ShowCase()));
            }),
            //SizedBox(height: 5),
            Gap(),
            CustomListTile(Icons.import_contacts, 'Reach Us', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>ReachUs()));
            }),
            //SizedBox(height: 5),
            Gap(),
            CustomListTile(Icons.feedback, 'FeedBack', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>FeedBack()));
            }),
            //SizedBox(height: 5),
            Gap(),
            last(context)
          ],
        ),
      ),
    );
  }
}
