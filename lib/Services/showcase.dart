import 'package:flutter/material.dart';
import 'package:pgimer/global/drawer.dart';
import 'package:pgimer/Services/images.dart';
import 'package:pgimer/Services/videos.dart';
import 'package:pgimer/global/bottomNavBar.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/main.dart';
class ShowCase extends StatefulWidget {
  @override
  _ShowCaseState createState() => _ShowCaseState();
}

class _ShowCaseState extends State<ShowCase> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
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
                //padding: const EdgeInsets.only(top: 15),
                child: Stack(
                  children: [
                    //Align(child: Image.asset('images/sample2.png',width: MediaQuery.of(context).size.width * 0.91,height: MediaQuery.of(context).size.height * 0.45,),alignment: Alignment.center,),
                    CustomAppbar(abc,'SHOWCASE'),],),
              ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                  CustomTile('images/image.png','Images',Images()),
                  SizedBox(width: MediaQuery.of(context).size.width*0.035,),
                  CustomTile('images/video.png','Videos',Videos()),
                  SizedBox(width: MediaQuery.of(context).size.width*0.035,),
              last(context)
        ],
        ),),
            drawer: CustomDrawer(),
            bottomNavigationBar: BottomBar()
      ),
    );
  }
}
class CustomTile extends StatelessWidget {
  final String item;
  final String caption;
  final Widget file;
  CustomTile(this.item,this.caption,this.file);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context)=>file));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 20, 5, 15),
        child: Material(
          elevation: 40,
          child: Container(
            // borderRadius: BorderRadius.all(Radius.circular(10.0)),
              decoration: BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.all( Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                  color: mainColor.withOpacity(0.6),
                  offset: Offset(MediaQuery.of(context).size.width*0.01,MediaQuery.of(context).size.width*0.01),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),],
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset(item,alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height*0.33,
                    fit: BoxFit.cover,),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      color: mainColor.withOpacity(0.5),
                      height: MediaQuery.of(context).size.height*0.1,
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          caption,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}