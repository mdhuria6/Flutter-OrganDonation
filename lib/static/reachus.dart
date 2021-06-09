import 'dart:ui';
import 'package:pgimer/global/drawer.dart';
import 'package:pgimer/global/bottomNavBar.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:pgimer/main.dart';
class ReachUs extends StatefulWidget {
  @override
  _ReachUsState createState() => _ReachUsState();
}

class _ReachUsState extends State<ReachUs> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: abc,
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
                  CustomAppbar(abc, 'Reach Us'),
                ],),
            ),
            head(context,'Address'),
            CustomTile(
                'REGIONAL ORGAN AND TISSUE TRANSPLANT ORGANIZATION (ROTTO)',
                'ROOM NO. 6001-03, 6TH FLOOR, RESEARCH BLOCK-B, PGIMER,\nSECTOR-12, CHANDIGARH-160012, PHONE-0172-2755291 & 2755292'),
            head(context,'Contact Us'),
            CustomTile('Nodal Officer','Dr.Vipin Koushal \n 7087009611\n(drvipinkoushal@gmail.com)'),
            CustomTile('Consultant Media and IEC','Ms.Saryu\n7087008001'),
            CustomTile('Consultant Data Management and Statistics','Mr. Milan\n7087003302'),
            CustomTile('Transplant Coordinator','Ms.Nilakshi–7087008002\nMs.Simmi-7087003303'),
            CustomTile('Office Numbers: ','0172-2755291\n0172-2755292'),
            last(context)
          ],
            ),
          drawer: CustomDrawer(),
          bottomNavigationBar: BottomBar()
      ),
    );
  }
  Widget head(BuildContext context,String cap){
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.015,10,MediaQuery.of(context).size.width*0.015,10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.all(8),
          //color: Colors.green[900],
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.only(topRight: Radius.circular(MediaQuery.of(context).size.width*0.08),bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.04)),
            color: mainColor,
            boxShadow: [BoxShadow(
              color: mainColor,
              offset: Offset(MediaQuery.of(context).size.width*0.02,MediaQuery.of(context).size.width*0.02),
              spreadRadius: 1,
              blurRadius: 3,
            ),],
          ),
          child: Padding(padding: EdgeInsets.all(8),
            child:Text(cap,style: TextStyle(fontFamily: 'Acme',
              fontSize: MediaQuery.of(context).size.width*0.06,
              fontWeight: FontWeight.bold,
              color: Colors.white,),),),
        ),
      ),
    );
  }

}
class CustomTile extends StatelessWidget {
  // String bullet = "\u2022 ";
  final String A,B;
  CustomTile(this.A,this.B);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [BoxShadow(
              color: mainColor.withOpacity(0.8),
              offset: Offset(MediaQuery.of(context).size.width*0.02,MediaQuery.of(context).size.width*0.02),
              spreadRadius: 1,
              blurRadius: 3,
            ),],
          ),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text('$A',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.left,),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(B,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,),
              ),
              // SizedBox(height: 10,),
            ],
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}