import 'dart:convert';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pgimer/main.dart';

final List<String>
imgList = [];
List<Photo> list = List();

class Slideshow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<Slideshow> {
  int _current = 0;
  bool isLoading = false;
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
        for (int i = 0; i < list.length; i++) {
          if (list[i].tag == "Home") {
            imgList.add(list[i].imageUrl);
          }
        }
        setState(() {
          isLoading= false;
        });
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
    return isLoading == true? Center(child: CircularProgressIndicator())
        : Column(children: [
      CarouselSlider(
        items: imgList
            .map((item) => Container(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: <Widget>[
                            Image.network(item,
                                fit: BoxFit.cover, width: 1000.0),
                          ],
                        )),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.map((url) {
          int index = imgList.indexOf(url);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            // decoration: BoxDecoration(
            //   shape: BoxShape.circle,
            //   color: _current == index
            //       ? Color.fromRGBO(0, 0, 0, 0.9)
            //       : Color.fromRGBO(0, 0, 0, 0.4),
            // ),
          );
        }).toList(),
      ),
    ]);
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
