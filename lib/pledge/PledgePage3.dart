import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/global/drawer.dart';
import 'package:pgimer/main.dart';
import 'package:pgimer/pledge/model.dart';
import 'package:pgimer/pledge/profile.dart';
class PledgePage3 extends StatefulWidget {
  final Model model;
  PledgePage3({this.model});
  @override
  _PledgePage3State createState() => _PledgePage3State();
}

class _PledgePage3State extends State<PledgePage3> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  bool allOrgans=false; bool alltissues=false;
  bool liver=false; bool bones=false;
  bool kidney=false; bool heartvalve=false;
  bool heart=false; bool skin=false;
  bool intestine=false; bool cornea=false;
  bool pancreas=false; bool cartilage=false;
  bool lung=false;
  bool check=false;
  @override
  void initState() {
    super.initState();
    setState(() {
      widget.model.allOrgans=false;
      widget.model.liver=false;
      widget.model.kidney=false;
      widget.model.heart=false;
      widget.model.intestine=false;
      widget.model.pancreas=false;
      widget.model.lung=false;
      widget.model.alltissues=false;
      widget.model.bones=false;
      widget.model.heartValve=false;
      widget.model.skin=false;
      widget.model.cornea=false;
      widget.model.cartilage=false;
    });
  }
  checkstate()
  {
    if(widget.model.allOrgans==true)
    {
      liver=true;
      kidney=true;
      heart=true;
      intestine=true;
      pancreas=true;
      lung=true;
      widget.model.liver=true;
      widget.model.kidney=true;
      widget.model.heart=true;
      widget.model.intestine=true;
      widget.model.pancreas=true;
      widget.model.lung=true;
    }
    if(widget.model.alltissues==true)
      {
        bones=true;
        heartvalve=true;
        skin=true;
        cornea=true;
        cartilage=true;
        widget.model.bones=true;
        widget.model.heartValve=true;
        widget.model.skin=true;
        widget.model.cornea=true;
        widget.model.cartilage=true;
      }
  }
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
              child: Stack(
                children: [
                  CustomAppbar(abc,'Select Organs'),],),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Text('Check The Organs You Like To Donate!!', style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width*0.05,
              fontWeight: FontWeight.bold,
              fontFamily: 'acme',
            ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("All Organs",
                        style: TextStyle(
                            fontFamily: 'Pangolin',
                          fontSize: 20.0
                        ),),
                        Checkbox(
                          value: allOrgans,
                          activeColor: mainColor,
                          onChanged: (bool value) {
                            setState(() {
                              allOrgans = value;
                              widget.model.allOrgans=value;
                            });
                            checkstate();
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Liver",
                          style: TextStyle(
                              fontFamily: 'Pangolin',
                              fontSize: 20.0
                          ),),
                        Checkbox(
                          value: liver,
                          activeColor: mainColor,
                          onChanged: (bool value) {
                            setState(() {
                              liver = value;
                              widget.model.liver=value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Kidney",
                          style: TextStyle(
                              fontFamily: 'Pangolin',
                              fontSize: 20.0
                          ),),
                        Checkbox(
                          value: kidney,
                          activeColor: mainColor,
                          onChanged: (bool value) {
                            setState(() {
                              kidney = value;
                              widget.model.kidney=value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Heart",
                          style: TextStyle(
                              fontFamily: 'Pangolin',
                              fontSize: 20.0
                          ),),
                        Checkbox(
                          value: heart,
                          activeColor: mainColor,
                          onChanged: (bool value) {
                            setState(() {
                              heart = value;
                              widget.model.heart=value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Intestine",
                          style: TextStyle(
                              fontFamily: 'Pangolin',
                              fontSize: 20.0
                          ),),
                        Checkbox(
                          value: intestine,
                          activeColor: mainColor,
                          onChanged: (bool value) {
                            setState(() {
                              intestine = value;
                              widget.model.intestine=value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Pancreas",
                          style: TextStyle(
                              fontFamily: 'Pangolin',
                              fontSize: 20.0
                          ),),
                        Checkbox(
                          value: pancreas,
                          activeColor: mainColor,
                          onChanged: (bool value) {
                            setState(() {
                              pancreas = value;
                              widget.model.pancreas=value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Lungs",
                          style: TextStyle(
                              fontFamily: 'Pangolin',
                              fontSize: 20.0
                          ),),
                        Checkbox(
                          value: lung,
                          activeColor: mainColor,
                          onChanged: (bool value) {
                            setState(() {
                              lung = value;
                              widget.model.lung=value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("All Tissues",
                          style: TextStyle(
                              fontFamily: 'Pangolin',
                              fontSize: 20.0
                          ),),
                        Checkbox(
                          value: alltissues,
                          activeColor: mainColor,
                          onChanged: (bool value) {
                            setState(() {
                              alltissues = value;
                              widget.model.alltissues=value;
                            });
                            checkstate();

                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Bones",
                          style: TextStyle(
                              fontFamily: 'Pangolin',
                              fontSize: 20.0
                          ),),
                        Checkbox(
                          value: bones,
                          activeColor: mainColor,
                          onChanged: (bool value) {
                            setState(() {
                              bones = value;
                              widget.model.bones=value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Heart Valve",
                          style: TextStyle(
                              fontFamily: 'Pangolin',
                              fontSize: 20.0
                          ),),
                        Checkbox(
                          value: heartvalve,
                          activeColor: mainColor,
                          onChanged: (bool value) {
                            setState(() {
                              heartvalve = value;
                              widget.model.heartValve=value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Skin",
                          style: TextStyle(
                              fontFamily: 'Pangolin',
                              fontSize: 20.0
                          ),),
                        Checkbox(
                          value: skin,
                          activeColor: mainColor,
                          onChanged: (bool value) {
                            setState(() {
                              skin = value;
                              widget.model.skin=value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Cornea",
                          style: TextStyle(
                              fontFamily: 'Pangolin',
                              fontSize: 20.0
                          ),),
                        Checkbox(
                          value: cornea,
                          activeColor: mainColor,
                          onChanged: (bool value) {
                            setState(() {
                              cornea = value;
                              widget.model.cornea=value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Cartilage",
                          style: TextStyle(
                              fontFamily: 'Pangolin',
                              fontSize: 20.0
                          ),),
                        Checkbox(
                          value: cartilage,
                          activeColor: mainColor,
                          onChanged: (bool value) {
                            setState(() {
                              cartilage = value;
                              widget.model.cartilage=value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
            ],),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Row(
              children: <Widget>[
                Checkbox(
                  value: check,
                  activeColor: mainColor,
                  onChanged: (bool value) {
                    setState(() {
                      check = value;
                    });
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.866,
                  child: Text("I have read all the required details as per shared and hereby I pledge to donate the body organs "
                      "and the information in correct as per my knowledge.",
                    style: TextStyle(
                        fontFamily: 'Pangolin',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            RaisedButton(
              color: mainColor,
              onPressed: () {
                if(check==true)
                {
                  formsubmit();
                }
                else
                  displayDialog(context, "Error", "Please Check the Warning Box Below!!");
                },
              child: Text(
                'Confirm.',
                style: TextStyle(
                  color: Colors.white,)
  )
  ),
            last(context)
          ]
  ),
        drawer: CustomDrawer(),
      ),
    );
  }
  Future formsubmit () async {
    Map data = {
      "firstName":widget.model.firstName,
      "lastName":widget.model.lastName,
      "sonDaughterWifeOff":widget.model.sonDaughterWifeOff,
      "sonDaughterWifeOffRelation":widget.model.sonDaughterWifeOffRelation,
      "dateOfBirth":widget.model.dateOfBirth,
      "gender":widget.model.gender,
      "age":widget.model.age,
      "bloodGroup":widget.model.bloodGroup,
      "emailId":widget.model.emailId,
      "mobileNo":widget.model.mobileNo,
      "aadharNo": widget.model.aadhaarNo,
      "address":{
        "addressLine1":widget.model.addressLine1,
        "addressLine2":widget.model.addressLine2,
        "country":widget.model.country,
        "state":widget.model.state,
        "city":widget.model.city,
        "pincode": widget.model.pincode
      },
      "emergencyContactPerson":{
        "e_firstName": widget.model.efirstName,
        "e_middleName": widget.model.emiddleName,
        "e_lastName": widget.model.elastName,
        "e_relation": widget.model.relation,
        "e_emailId": widget.model.eemailId,
        "e_addressLine1": widget.model.eaddressLine1,
        "e_addressLine2": widget.model.eaddressLine2,
        "e_country": widget.model.ecountry,
        "e_state": widget.model.estate,
        "e_city": widget.model.city,
        "e_mobileNo": widget.model.emobileNo,
        "e_pincode": widget.model.epincode
      },
      "organDonation":{
        "allOrgans":widget.model.allOrgans,
        "liver":widget.model.liver,
        "kidney":widget.model.kidney,
        "heart":widget.model.heart,
        "intestine":widget.model.intestine,
        "pancreas":widget.model.pancreas,
        "lung":widget.model.lung,
        "allTissues":widget.model.alltissues,
        "bones":widget.model.bones,
        "heartValve":widget.model.heartValve,
        "skin":widget.model.skin,
        "cornea":widget.model.cornea,
        "cartilage": widget.model.cartilage
      }
    };
    var jsonResponse;
    String token= await storage.read(key: "jwt");
    final response = await http.post(
        "$url/api/user/form", body: jsonEncode(data),
        headers: {'Content-type': 'application/json', 'x-auth-token': token, 'x-source':'mobile'});
    jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if (jsonResponse['success'] == true) {
      displaydialog();
    }
    else {
      displayDialog(context, "Error", "${jsonResponse['msg']}");
    }
    print(jsonResponse['msg']);
  }

void displayDialog(BuildContext context, String title, String text) =>
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(
              title: Text(title),
              content: Text(text)
          ),
    );
  void displaydialog() =>
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: Text('SUCCESS'),
              content: Text('You have Successfully Pledged to donate your body organs. '
                  'Thank You for your help.'),
              actions: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserProfile()));
                  },
                  child: Text('Next'),
                )
              ],
            ),
      );
}


