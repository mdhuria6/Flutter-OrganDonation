import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pgimer/Services/donorMemorial.dart';
import 'package:pgimer/main.dart';
import 'package:pgimer/static/AboutUs.dart';
import 'package:pgimer/static/guide.dart';
import 'package:pgimer/static/faqs.dart';
class Heading extends StatelessWidget {
  final String A;
  Heading(this.A);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.015,10,MediaQuery.of(context).size.width*0.015,10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.only(topRight: Radius.circular(MediaQuery.of(context).size.width*0.08),bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.04)),
            color: mainColor,
            boxShadow: [BoxShadow(
              color: mainColor,
              offset: Offset(MediaQuery.of(context).size.width*0.015,MediaQuery.of(context).size.width*0.015),
              spreadRadius: 1,
              blurRadius: 3,
            ),],
          ),
          child: Padding(padding: EdgeInsets.all(8),
          child:Text(A,style: TextStyle(fontFamily: 'Acme',
            fontSize: MediaQuery.of(context).size.width*0.06,
            fontWeight: FontWeight.bold,
            color: Colors.white,),),),
        ),
      ),
    );
  }
}



class Knowmore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,//MediaQuery.of(context).size.height*0.4,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(width: MediaQuery.of(context).size.width*0.015,),
          Scrollview('images/memorial.png','Donor Memorial',DonorMemorial()),
          SizedBox(width: MediaQuery.of(context).size.width*0.035,),
          Scrollview('images/guide.png','Organ Donation Transplant Guide',Guide()),
          SizedBox(width: MediaQuery.of(context).size.width*0.015,),
          Scrollview('images/faq.png','Frequently Asked Questions',FAQ()),
          SizedBox(width: MediaQuery.of(context).size.width*0.015,),
          Scrollview('images/about.png','About Us',AboutUs()),
          SizedBox(width: MediaQuery.of(context).size.width*0.035,)
        ],
      ),
    );
  }
}



class Scrollview extends StatelessWidget {
  final String item;
  final String caption;
  final Widget file;
  Scrollview(this.item,this.caption,this.file);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(context,
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
                boxShadow: [BoxShadow(
                  color: mainColor.withOpacity(0.3),
                  offset: Offset(MediaQuery.of(context).size.width*0.02,MediaQuery.of(context).size.width*0.02),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),],
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.cover,width: 280,),
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
                          fontSize: 20.0,
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
