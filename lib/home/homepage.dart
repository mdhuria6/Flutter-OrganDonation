import 'package:flutter/material.dart';
import 'package:pgimer/global/drawer.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/home/bodyh.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: abc,
        body: ListView(
          children: <Widget>[
            CustomAppBar(abc),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Bodyh()
          ],
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}

