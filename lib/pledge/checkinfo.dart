import 'package:flutter/material.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/global/drawer.dart';
import 'package:pgimer/main.dart';
import 'package:pgimer/pledge/PledgePage3.dart';
import 'package:pgimer/pledge/model.dart';
//import 'package:intl/intl.dart';
class Check extends StatefulWidget {
  final Model model;
  Check({this.model});
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  final _formKey = GlobalKey<FormState>();
  int date;
  bool check = false;
  DateTime selectedDate;
  TextEditingController textEditingControllerage = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1920, 1),
      lastDate: DateTime.now(),
      errorInvalidText: 'Enter Valid Date'
    );
    var age = ((DateTime.now().millisecondsSinceEpoch - selectedDate.millisecondsSinceEpoch)* 3.17/ 100000000000 ).round();
    setState(() {
      textEditingControllerage.text = age.toString();
      print(textEditingControllerage);
    });
    if (picked != null && picked != selectedDate)
      setState(() {
        print(picked);
        selectedDate = picked;
        widget.model.dateOfBirth= picked.millisecondsSinceEpoch;
        var age = ((DateTime.now().millisecondsSinceEpoch - selectedDate.millisecondsSinceEpoch)* 3.17/ 100000000000 ).round();
        setState(() {
          textEditingControllerage.text = age.toString();
          print(textEditingControllerage);
        });
      });
  }
  @override
  void initState(){
    super.initState();
    date = widget.model.dateOfBirth;
    selectedDate = DateTime.fromMillisecondsSinceEpoch(widget.model.dateOfBirth);
    print(date);
    textEditingControllerage.text = widget.model.age;

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
                  CustomAppbar(abc,'Final Check Details'),],),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Form(
                key: _formKey,
                child: Column(
              children: [
                  Text('Please Check Your Personal Details Carefully Again!!', style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width*0.05,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'acme',
                  ),
                    textAlign: TextAlign.center,
                  ),

                  MyTextFormField(
                    labelText: 'First Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your First Name';
                      }
                      return null;
                    },
                    initialValue: widget.model.firstName,
                    isenabled: false,
                    onSaved: (String value) {
                      widget.model.firstName = value;
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
                    initialValue: widget.model.lastName,
                    isenabled: false,
                    onSaved: (String value) {
                      widget.model.lastName = value;
                    },
                  ),
                  MyTextFormField(
                    labelText: 'S/O, D/O, W/O',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter the Name';
                      }
                      return null;
                    },
                    initialValue: widget.model.sonDaughterWifeOff,
                    max: 20,
                    onSaved: (String value) {
                      widget.model.sonDaughterWifeOff = value;
                    },
                  ),
                MyTextFormField(
                  labelText: 'Relation of the donor',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter the relation';
                    }
                    return null;
                  },
                  initialValue: widget.model.sonDaughterWifeOffRelation,
                  onSaved: (String value) {
                    widget.model.sonDaughterWifeOffRelation = value;
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

                  MyTextFormField(
                    labelText: 'Gender',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter the Gender';
                      }
                      return null;
                    },
                    initialValue: widget.model.gender,
                    isenabled: false,
                    onSaved: (String value) {
                      widget.model.gender = value;
                    },
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
                    // initialValue: widget.model.age.toString(),
                    enabled: false,
                    validator: (value) {
                      if (int.parse(value) < 18) {
                        return 'Age cannot be less than 18';
                      }
                      return null;
                    },
                    // initialValue: '$Age',
                    onSaved: (value) {
                      widget.model.age = value;
                    },
                  ),
                ),
                  MyTextFormField(
                    labelText: 'Blood Group',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter Your Blood Group';
                      }
                      return null;
                    },
                    initialValue: widget.model.bloodGroup,
                    onSaved: (String value) {
                      widget.model.bloodGroup = value;
                    },
                  ),

                  MyTextFormField(
                    labelText: 'Email-ID',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your Email-ID';
                      }
                      return null;
                    },
                    initialValue: widget.model.emailId,
                    isenabled: false,
                    onSaved: (String value) {
                      widget.model.emailId = value;
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
                    initialValue: widget.model.mobileNo,
                    isenabled: false,
                    onSaved: (String value) {
                      widget.model.mobileNo = value;
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
                      initialValue: widget.model.aadhaarNo,
                      onSaved: (String value) {
                        widget.model.aadhaarNo = value;
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
                    initialValue: widget.model.addressLine1,
                    onSaved: (String value) {
                      widget.model.addressLine1 = value;
                    },
                  ),
                  MyTextFormField(
                    labelText: 'Address-Line-2',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter the Address here';
                      }
                      return null;
                    },
                    initialValue: widget.model.addressLine2,
                    onSaved: (String value) {
                      widget.model.addressLine2 = value;
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
                    initialValue: widget.model.country,
                    onSaved: (String value) {
                      widget.model.country = value;
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
                    initialValue: widget.model.state,
                    onSaved: (String value) {
                      widget.model.state = value;
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
                    initialValue: widget.model.city,
                    onSaved: (String value) {
                      widget.model.city = value;
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
                    initialValue: widget.model.pincode,
                    onSaved: (String value) {
                      widget.model.pincode = value;
                    },
                  ),
                  Text('Please Check Your Emergency Details Carefully Again!!', style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width*0.05,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'acme',
                  ),
                    textAlign: TextAlign.center,
                  ),
                  MyTextFormField(
                    labelText: 'First Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter the First Name';
                      }
                      return null;
                    },
                    max: 20,
                    initialValue: widget.model.efirstName,
                    onSaved: (String value) {
                      widget.model.efirstName = value;
                    },
                  ),
                  MyTextFormField(
                    labelText: 'Middle Name',
                    initialValue: widget.model.emiddleName,
                    max: 20,
                    onSaved: (String value) {
                      widget.model.emiddleName = value;
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
                    max: 20,
                    initialValue: widget.model.elastName,
                    onSaved: (String value) {
                      widget.model.elastName = value;
                    },
                  ),
                  MyTextFormField(
                    labelText: 'Relation',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter the Relation';
                      }
                      return null;
                    },
                    initialValue: widget.model.relation,
                    onSaved: (String value) {
                      widget.model.relation = value;
                    },
                  ),

                  MyTextFormField(
                    labelText: 'Email-ID',
                    initialValue: widget.model.eemailId,
                    validator: (String value) {
                      if(value.isNotEmpty)
                      {
                        String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?)*$";
                        RegExp regExp = new RegExp(pattern);
                        if (!regExp.hasMatch(value)) {
                          return 'Please enter valid email=Id';
                        }
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      widget.model.eemailId = value;
                    },
                  ),
                  MyTextFormField(
                    labelText: 'Phone Number',
                    validator: (String value) {
                      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      RegExp regExp = new RegExp(pattern);
                      if (value.length == 0) {
                        return 'Please enter mobile number';
                      }
                      else if (!regExp.hasMatch(value)) {
                        return 'Please enter valid mobile number';
                      }
                      return null;
                    },
                    max: 10,
                    initialValue: widget.model.emobileNo,
                    onSaved: (String value) {
                      widget.model.emobileNo = value;
                    },
                  ),
                  Text('Emergency- Address',
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
                    initialValue: widget.model.eaddressLine1,
                    onSaved: (String value) {
                      widget.model.eaddressLine1 = value;
                    },
                  ),
                  MyTextFormField(
                    labelText: 'Address-Line-2',
                    initialValue: widget.model.eaddressLine2,
                    onSaved: (String value) {
                      widget.model.eaddressLine2 = value;
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
                    initialValue: widget.model.ecountry,
                    onSaved: (String value) {
                      widget.model.ecountry = value;
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
                    initialValue: widget.model.estate,
                    onSaved: (String value) {
                      widget.model.estate = value;
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
                    initialValue: widget.model.ecity,
                    onSaved: (String value) {
                      widget.model.ecity = value;
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
                    initialValue: widget.model.epincode,
                    onSaved: (String value) {
                      widget.model.epincode = value;
                    },
                  ),
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
                        child: Text("I have read  the T&Cs as per given and the information provided is correct as per my knowledge.",
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
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PledgePage3(model: widget.model)));
                          }
                        }
                        else
                          displaydialog();
                      },
                      child: Text(
                          'Confirm.',
                          style: TextStyle(
                            color: Colors.white,)
                      )
                  ),
                last(context)
              ],
            )),
          ],
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
  void displaydialog() =>
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: Text('ERROR'),
              content: Text('Please Check The Warning Box given below!'),
            ),
      );
}

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
        maxLength: max,
        enabled: isenabled,
      ),
    );
  }
}
