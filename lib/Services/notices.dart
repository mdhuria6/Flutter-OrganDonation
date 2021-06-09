import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:pgimer/global/my_flutter_app_icons.dart';
import 'package:pgimer/home/homepage.dart';
import 'package:pgimer/main.dart';
import 'package:pgimer/pledge/profile.dart';
import 'package:getwidget/getwidget.dart';

class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  var isLoading = false;
  List<Photo> list = List();
  
  _fetchData() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get("$url/api/user/event",
        headers: {"x-source": "mobile"});
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      list = (jsonResponse['msg'] as List)
          .map((data) => new Photo.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      print('error occured');
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
    // getMessage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'News and Events',
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
            IconButton(
              icon: Icon(MyFlutterApp.user_outline),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
            )
          ],
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            :list.length==0?EmptyTile(): Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        var i = list.length - index -1 ;
                        return TextTile(
                            list[i].subject,
                            list[i].description,
                        list[i].timestamp);
                      }),
                )),
      ),
    );
  }
}
class EmptyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage(
                  'images/empty.png',
                ),
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Text('This Page has no news and events',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),)
          ],
        )
    );
  }
}
class TextTile extends StatelessWidget {
  final String description, subject;
  final int timestamp;
  TextTile(this.subject, this.description, this.timestamp);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
              border: Border.all(color: mainColor, width: 2.0)),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              GFAccordion(
                  title: '$subject',
                  contentChild: Text('$description',
                    textAlign: TextAlign.justify,),
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                  contentBackgroundColor: mainColor.withOpacity(0.1),
                  expandedTitleBackgroundColor: mainColor.withOpacity(0.2),
                  contentBorder: Border.all(width: 1),
                  contentPadding: EdgeInsets.all(10),
                  collapsedTitleBackgroundColor: mainColor.withOpacity(0.2),
                  collapsedIcon: Text("${DateTime.fromMillisecondsSinceEpoch(timestamp).toString().substring(0,10)}"),
                  expandedIcon: Icon(Icons.minimize)
              ),
              SizedBox(
                height: 10.0,
              ),

            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class Photo {
  final String description;
  final String subject;
  final int timestamp;

  Photo._({this.subject, this.description, this.timestamp});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo._(
      description: json['description'],
      subject: json['subject'],
      timestamp: json['timestamp'],
    );
  }
}
