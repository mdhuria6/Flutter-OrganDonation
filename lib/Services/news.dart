import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pgimer/global/bottomNavBar.dart';
import 'package:pgimer/global/my_flutter_app_icons.dart';
import 'package:pgimer/home/homepage.dart';
import 'package:pgimer/main.dart';
import 'package:pgimer/pledge/profile.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  List<Photo> list = List();
  var isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("$url/api/content", headers: {"x-source": "mobile"});
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      list = (jsonResponse['data'] as List)
          .map((data) => new Photo.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      print('error occured');
      throw Exception('Failed to load photos');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: abc,
          appBar: AppBar(
            title: Center(
              child: Text(
                'News',
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
              ),
            ],
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Align(
            alignment: Alignment.topCenter,
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      var i = list.length - index -1 ;
                      return CustomTile(list[i].imageUrl,
                          list[i].description, list[i].tag);
                    }),
              ),
          bottomNavigationBar: BottomBar()),
    );
  }
}

class CustomTile extends StatelessWidget {
  final String url;
  final String description;
  final String tag;
  CustomTile(this.url, this.description, this.tag);
  @override
  Widget build(BuildContext context) {
    if (tag == "News")
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          //borderRadius: BorderRadius.all( Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: mainColor.withOpacity(0.6),
              offset: Offset(MediaQuery.of(context).size.width * 0.02,
                  MediaQuery.of(context).size.width * 0.02),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: Card(
          child: Column(
            children: [
              Image(image: NetworkImage(url)),
              GFAccordion(
                  title: 'Description',
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
                  collapsedIcon: Icon(Icons.add),
                  expandedIcon: Icon(Icons.minimize)
              ),
            ],
          ),
        ),
      );
    else
      return Container();
  }
}

class Photo {
  final String description;
  final String imageUrl;
  final String tag;

  Photo._({this.description, this.imageUrl, this.tag});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo._(
      description: json['Description'],
      imageUrl: json['ImageUrl'],
      tag: json['Tag'],
    );
  }
}
