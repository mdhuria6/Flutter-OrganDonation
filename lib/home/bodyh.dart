import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pgimer/home/slideshow.dart';
import 'package:pgimer/home/scrollview.dart';
import 'package:pgimer/main.dart';
class Bodyh extends StatefulWidget {
  @override
  _BodyhState createState() => _BodyhState();
}

class _BodyhState extends State<Bodyh> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Heading('Latest Events'),
        //Slideshow(),
        SizedBox(height: 20.0,),
        Heading('Know More'),
        Knowmore(),
        last(context),
      ],
    );
  }
}
