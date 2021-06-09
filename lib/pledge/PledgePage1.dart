import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/global/drawer.dart';
import 'package:pgimer/main.dart';
import 'package:pgimer/pledge/PledgePage2.dart';
import 'package:pgimer/pledge/model.dart';
import 'package:pgimer/pledge/profile.dart';

class PledgePage1 extends StatefulWidget {
  @override
  _PledgePage1State createState() => _PledgePage1State();
}
class _PledgePage1State extends State<PledgePage1> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  var isLoading = false;
  bool autovalidate = false;
  var jsonResponse;
  String fname, lname, gender, email;
  var mobile;
  int _radioValue1 = -1;
  _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
      if(_radioValue1==0)
      {
        model.bloodGroup="O+";
      }
      if(_radioValue1==1)
      {
        model.bloodGroup="A+";
      }
      if(_radioValue1==2)
      {
        model.bloodGroup="B+";
      }
      if(_radioValue1==3)
      {
        model.bloodGroup="AB+";
      }
      if(_radioValue1==4)
      {
        model.bloodGroup="O-";
      }
      if(_radioValue1==5)
      {
        model.bloodGroup="A-";
      }
      if(_radioValue1==6)
      {
        model.bloodGroup="B-";
      }
      if(_radioValue1==7)
      {
        model.bloodGroup="AB-";
      }
    });
  }
  Future fetchdata() async{
    setState(() {
      isLoading = true;
    });
    String value=await storage.read(key: "jwt");
    final response =
    await http.get("$url/api/user/profile", headers: {'Content-type': 'application/json', "x-auth-token": value, 'x-source': 'mobile'});
    jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    setState(() {
      fname = jsonResponse["firstName"];
      lname = jsonResponse["lastName"];
      email = jsonResponse["email"];
      mobile = jsonResponse["mobileNo"];
      gender = jsonResponse["gender"];
      model.sonDaughterWifeOffRelation = 'S/O';
    });
    setState(() {
      isLoading = false;
    });
  }
  void alertdisplay() =>
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: Text('Notice'),
              content: Text('You have already Pledged for organ donation here!'
                  '\nThank You Again!!'),
              actions: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>UserProfile()));
                  },
                  child: Text('DONE'),
                ),
              ],
            ),
      );
  final _formKey = GlobalKey<FormState>();
  Model model = Model();
  DateTime selectedDate = DateTime.now();
  int finalAge = 0 ;
  String _value = 'S/O';
  TextEditingController textEditingControllerage = TextEditingController();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1920, 1),
        lastDate: DateTime.now(),

    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        model.dateOfBirth= picked.millisecondsSinceEpoch ;
      });
    if(finalAge==0)
      {
        var age = ((DateTime.now().millisecondsSinceEpoch - selectedDate.millisecondsSinceEpoch)* 3.17/ 100000000000 ).round();
        setState(() {
          textEditingControllerage.text = age.toString();
          print(textEditingControllerage);
        });
      }
    print("age: $finalAge");
    print('picked: $picked');
    print('selected Date: $selectedDate');
  }
  @override
  void initState() {
    super.initState();
    fetchdata();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: abc,
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Container(
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
                child: Stack(
                  children: [
                    CustomAppbar(abc,'Personal Details'),],),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              Text('Please Enter Your Personal Details Carefully!!', style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width*0.05,
                fontWeight: FontWeight.bold,
                fontFamily: 'acme',
              ),
                textAlign: TextAlign.center,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    MyTextFormField(
                      labelText: 'First Name',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your First Name';
                        }
                        return null;
                      },
                      initialValue: '$fname',
                      isenabled: false,
                      onSaved: (String value) {
                        model.firstName = value;
                      },
                    ),
                    MyTextFormField(
                      labelText: 'Last Name',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your Last Name';
                        }
                        return null;
                      },
                      initialValue: lname,
                      isenabled: false,
                      onSaved: (String value) {
                        model.lastName = value;
                      },
                    ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Relation of the donor: ',
                      style: TextStyle(
                          fontFamily: 'Pangolin',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                      ),),
                      SizedBox(width: 10,),
                      DropdownButton(
                          value: _value,
                          items: [
                            DropdownMenuItem(
                              child: Text("S/O"),
                              value: 'S/O',
                            ),
                            DropdownMenuItem(
                              child: Text("D/O"),
                              value: 'D/O',
                            ),
                            DropdownMenuItem(
                                child: Text("W/O"),
                                value: 'W/O'
                            ),
                          ],

                          onChanged: (value) {
                            setState(() {
                              _value = value;
                              model.sonDaughterWifeOffRelation = value;
                            });
                          }),
                    ],
                  ),
                ),

                    MyTextFormField(
                      labelText: 'S/O, D/O, W/O',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter the Name';
                        }
                        return null;
                      },
                      max: 20,
                      onSaved: (String value) {
                        model.sonDaughterWifeOff = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Date of Birth:',
                                  style: TextStyle(
                                    fontFamily: 'Pangolin',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),),
                                IconButton(
                                  icon: Icon(Icons.date_range,
                                    size: 30,
                                  color: mainColor,),
                                  onPressed: () => _selectDate(context),),
                              ],
                            ),
                            Text("${selectedDate.toLocal()}".split(' ')[0],
                            style: TextStyle(
                              fontSize: 16.0
                            ),),
                          ],
                        )
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Age',
                            labelStyle: TextStyle(
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: mainColor))),
                        controller: textEditingControllerage,
                        validator: (value) {
                          if (value.length == 0) {
                            return 'Please enter Age';
                          }
                          else if (int.parse(value)<18) {
                            print('age is less than 18');
                            return 'Age cannot be less than 18';
                          }
                          return null;
                        },
                        // initialValue: '$Age',
                        readOnly: true,
                        onSaved: (value) {
                          model.age = value;
                        },
                      ),
                    ),
                    MyTextFormField(
                      labelText: 'Gender',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter the Gender';
                        }
                        return null;
                      },
                      initialValue: gender,
                      isenabled: false,
                      onSaved: (String value) {
                        model.gender = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Blood Group',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            textAlign: TextAlign.left,),
                        ],
                      ),
                    ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              MyRadio(
                                value:0,
                                groupValue: _radioValue1,
                                onChanged: _handleRadioValueChange1,
                                name: 'O+',),
                              MyRadio(
                                value:1,
                                groupValue: _radioValue1,
                                onChanged: _handleRadioValueChange1,
                                name: 'A+',),
                              MyRadio(
                                value:2,
                                groupValue: _radioValue1,
                                onChanged: _handleRadioValueChange1,
                                name: 'B+',),
                              MyRadio(
                                value:3,
                                groupValue: _radioValue1,
                                onChanged: _handleRadioValueChange1,
                                name: 'AB+',),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              MyRadio(
                                value:4,
                                groupValue: _radioValue1,
                                onChanged: _handleRadioValueChange1,
                                name: 'O-',),
                              MyRadio(
                                value:5,
                                groupValue: _radioValue1,
                                onChanged: _handleRadioValueChange1,
                                name: 'A-',),
                              MyRadio(
                                value:6,
                                groupValue: _radioValue1,
                                onChanged: _handleRadioValueChange1,
                                name: 'B-',),
                              MyRadio(
                                value:7,
                                groupValue: _radioValue1,
                                onChanged: _handleRadioValueChange1,
                                name: 'AB-',),
                            ],
                          ),
                        ],
                      ),
                    MyTextFormField(
                      labelText: 'Email-ID',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your Email-ID';
                        }
                        return null;
                      },
                      initialValue: email,
                      isenabled: false,
                      onSaved: (String value) {
                        model.emailId = value;
                      },
                    ),
                    MyTextFormField(
                      labelText: 'Phone Number',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter Your Mobile Number';
                        }
                        return null;
                      },
                      initialValue: mobile.toString(),
                      isenabled: false,
                      onSaved: (String value) {
                        model.mobileNo = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Aadhaar No.',
                            labelStyle: TextStyle(
                                fontFamily: 'Pangolin',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: mainColor))),
                        validator: (String value ) {
                            String pattern = r'(^(?:[+0]9)?[0-9]{12}$)';
                            RegExp regExp = new RegExp(pattern);
                            if (value.length == 0) {
                            return 'Please enter Aadhaar number';
                            }
                            else if (!regExp.hasMatch(value)) {
                            return 'Please enter valid Aadhaar number';
                            }
                            return null;
                        },
                        onSaved: (String value) {
                          model.aadhaarNo = value;
                        },
                        maxLength: 12,

                      ),
                    ),
                    Text('Personal- Address',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Pangolin',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      textAlign: TextAlign.left,),
                    MyTextFormField(
                      labelText: 'Address-Line-1',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter the Address here';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        model.addressLine1 = value;
                      },
                    ),
                    MyTextFormField(
                      labelText: 'Address-Line-2',
                      onSaved: (String value) {
                        model.addressLine2 = value;
                      },
                    ),
                    MyTextFormField(
                      labelText: 'Country',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter Your Country';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        model.country = value;
                      },
                    ),
                    MyTextFormField(
                      labelText: 'State',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter Your State';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        model.state = value;
                      },
                    ),
                    MyTextFormField(
                      labelText: 'City',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter Your City';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        model.city = value;
                      },
                    ),
                    MyTextFormField(
                      labelText: 'Pincode',
                      validator: (String value) {
                          String pattern = r'(^(?:[+0]9)?[0-9]{6}$)';
                          RegExp regExp = new RegExp(pattern);
                          if (value.length == 0) {
                          return 'Please enter pincode';
                          }
                          else if (!regExp.hasMatch(value)) {
                          return 'Please enter valid pincode';
                          }
                          return null;
                      },
                      max: 6,
                      onSaved: (String value) {
                        model.pincode = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        color: mainColor,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PledgePage2(model: model)));
                          }
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    last(context)
                  ],
                ),
              ),
            ],
          )
        ),
          drawer: CustomDrawer(),
      ),
    );
  }
}
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//  storeSecureCredentials('userEmail', userEmail);
//
class MyTextFormField extends StatelessWidget {
  final String labelText;
  final Function validator;
  final Function onSaved;
  final bool isEmail;
  final String initialValue;
  final bool isenabled;
  final int max;
  MyTextFormField({
    this.labelText,
    this.validator,
    this.onSaved,
    this.isEmail = false,
    this.initialValue,
    this.isenabled=true,
    this.max
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
            labelStyle: TextStyle(
                fontFamily: 'Pangolin',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: mainColor))),
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        initialValue: initialValue,
        enabled: isenabled,
        maxLength: max,
      ),
    );
  }
}
class MyRadio extends StatelessWidget {
  final int value;
  final int groupValue;
  final name;
  final Function onChanged;
  MyRadio({this.value,this.groupValue, this.name, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: mainColor,
        ),
        Text(
          '$name',
          style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Pangolin',
              fontWeight: FontWeight.bold,
              color: Colors.grey),
        ),
      ],
    );
  }
}
