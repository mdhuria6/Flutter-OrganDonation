import 'package:flutter/material.dart';
import 'package:pgimer/global/my_flutter_app_icons.dart';
import 'package:pgimer/home/homepage.dart';
import 'package:pgimer/pledge/profile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:pgimer/global/bottomNavBar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pgimer/main.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  List<Photo> list = List();
  var isLoading = false;
var jsonResponse;
  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("$url/api/video", headers: {"x-source": "mobile"});

    jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      list = (jsonResponse['message'] as List)
          .map((data) => new Photo.fromJson(data))
          .toList();
      setState(() {
        jsonResponse = jsonDecode(response.body);
        isLoading = false;
      });
      print(jsonResponse['message']);

    } else {
      print('error occured');
      throw Exception('Failed to load photos');
    }
  }
  Future<void> _launched;
  Future<void> _launchUniversalLinkIos(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(
          url,
          forceSafariVC: true,
        );
      }
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
          appBar: AppBar(
            title: Center(
              child: Text(
                'Videos',
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
          body: Card(
            child: isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : list.length==0 ?EmptyTile():ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {

                    return GestureDetector(
                        onDoubleTap: (){
                          setState(() {
                            _launched = _launchUniversalLinkIos('https://youtu.be/${list[index].fileUrl}');
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          padding: EdgeInsets.all(5.0),
                          height: MediaQuery.of(context).size.height * 0.31,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 1),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: YoutubePlayerIFrame(
                            controller: YoutubePlayerController(
                              initialVideoId: list[index].fileUrl,
                              params: YoutubePlayerParams(
                                showControls: true,
                                showFullscreenButton: true,
                                autoPlay: true,

                              ),
                            ),
                            aspectRatio: 16 / 9,
                          ),
                        ));
                }),
          ),
          bottomNavigationBar: BottomBar()),
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
          Text('This Page has no videos',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),)
        ],
      )
    );
  }
}

class Photo {
  final String name;
  final String fileUrl;

  Photo._({this.name, this.fileUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo._(
      name: json['Name'],
      fileUrl: json['FileUrl'],
    );
  }
}
