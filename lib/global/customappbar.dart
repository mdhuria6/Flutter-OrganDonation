import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pgimer/Services/notices.dart';
import 'package:pgimer/home/homepage.dart';
import 'package:pgimer/global/my_flutter_app_icons.dart';
import 'package:pgimer/loginpage.dart';
import 'package:pgimer/main.dart';
import 'package:pgimer/pledge/pledgenow.dart';
import 'package:pgimer/pledge/profile.dart';
import 'package:url_launcher/url_launcher.dart';
class CustomAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> abc;
  CustomAppBar(this.abc);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mainColor.withOpacity(0.8),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      //padding: const EdgeInsets.only(top: 15),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(child: Image.asset('images/bgblue.png',
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
              alignment: Alignment.center,),
          ),
          Column(
            children: <Widget>[
              HomeAppbar(abc,''),
              Header(),
            ],
          ),],),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //CustomAppbar(),
        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('ORGAN DONATION',style:TextStyle(
            fontFamily: 'Acme',
            fontSize: MediaQuery.of(context).size.width*0.06,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Without the organ donor there is no story, no hope, no transplant. But when there is an organ donor, life springs from death, sorrow turns to hope and a terrible loss becomes a gift.',
            style:TextStyle(
                fontFamily: 'Courgette',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.5,
                fontSize: MediaQuery.of(context).size.width*0.045
            ),),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.04,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>PledgeNow()));
              },//call1();},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all( Radius.circular(MediaQuery.of(context).size.width*0.06)),
                  boxShadow: [BoxShadow(
                    color: mainColor,
                    offset: Offset(MediaQuery.of(context).size.width*0.02,MediaQuery.of(context).size.width*0.02),
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),],
                ),
                width: MediaQuery.of(context).size.width * 0.47,
                height: MediaQuery.of(context).size.height*0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(MyFlutterApp.file_contract,color: mainColor,size: MediaQuery.of(context).size.width*0.049,),
                    Text('  Pledge Now',style: TextStyle(fontFamily:'BreeSerif',decoration: TextDecoration.none,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.049,color: mainColor),textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                _makePhoneCall("tel:01722755291");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red[500],
                  borderRadius: BorderRadius.all( Radius.circular(MediaQuery.of(context).size.width*0.06)),
                  boxShadow: [BoxShadow(
                    color: mainColor,
                    offset: Offset(MediaQuery.of(context).size.width*0.02,MediaQuery.of(context).size.width*0.02),
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),],
                ),
                width: MediaQuery.of(context).size.width * 0.47,
                height: MediaQuery.of(context).size.height*0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.call,color: Colors.white,size: MediaQuery.of(context).size.width*0.049,),
                    Text('  Emergency Call',style: TextStyle(fontFamily:'BreeSerif',decoration: TextDecoration.none,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.045,color: Colors.white),textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.04,),
      ],
    );
  }
}
class HomeAppbar extends StatelessWidget {
  final GlobalKey<ScaffoldState> abc;
  final String cap;
  HomeAppbar(this.abc,this.cap);

  @override
  Widget build(BuildContext context) {
    //GlobalKey <ScaffoldState> abc=new GlobalKey();
    return Row(
      //key: abc,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: (){abc.currentState.openDrawer();},
          child: Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.all(8),
            child: Icon(
              MyFlutterApp.menu_outline,
              color: Colors.white,
              //size: MediaQuery.of(context).size.height*0.025,
            ),
          ),
        ),
        Text(cap,style:TextStyle(
          fontFamily: 'Acme',
          fontSize: MediaQuery.of(context).size.width*0.06,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
        Row(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Notice()));
              },
              child: Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.fromLTRB(0,8,8,8),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  //size: MediaQuery.of(context).size.height*0.025,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
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
              },
              child: Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.fromLTRB(0,8,8,8),
                child: Icon(
                  MyFlutterApp.user_outline,
                  color: Colors.white,
                  //size: MediaQuery.of(context).size.height*0.025,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CustomAppbar extends StatelessWidget {
  final GlobalKey<ScaffoldState> abc;
  final String cap;
  CustomAppbar(this.abc,this.cap);
  @override
  Widget build(BuildContext context) {
    //GlobalKey <ScaffoldState> abc=new GlobalKey();
    return Row(
      //key: abc,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            width: 50,
            //margin: EdgeInsets.all(8),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              //size: MediaQuery.of(context).size.height*0.025,
            ),
          ),
        ),
        Text(cap,style:TextStyle(
          fontFamily: 'Acme',
          fontSize: MediaQuery.of(context).size.width*0.06,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>HomePage()));
              },
              child: Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.fromLTRB(0,8,8,8),
                child: Icon(
                  MyFlutterApp.home,
                  color: Colors.white,
                  //size: MediaQuery.of(context).size.height*0.025,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
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
              },
              child: Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.fromLTRB(0,8,8,8),
                child: Icon(
                  MyFlutterApp.user_outline,
                  color: Colors.white,
                  //size: MediaQuery.of(context).size.height*0.025,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}