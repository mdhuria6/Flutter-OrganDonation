import 'package:flutter/material.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/global/drawer.dart';
import 'package:pgimer/main.dart';
import 'package:pgimer/pledge/checkinfo.dart';
import 'package:pgimer/pledge/model.dart';
class PledgePage2 extends StatefulWidget {
  final Model model;
  PledgePage2({this.model});

  @override
  _PledgePage2State createState() => _PledgePage2State();
}
class _PledgePage2State extends State<PledgePage2> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: abc,
        body: Container(
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
                      CustomAppbar(abc,'Emergency Details'),],),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Text('Please Enter The Details of Emergency Contact!!', style: TextStyle(
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
                            return 'Enter the First Name';
                          }
                          return null;
                        },
                        max: 20,
                        onSaved: (String value) {
                          widget.model.efirstName = value;
                        },
                      ),
                      MyTextFormField(
                        labelText: 'Middle Name',
                        onSaved: (String value) {
                          widget.model.emiddleName = value;
                        },
                        max: 20,
                      ),
                      MyTextFormField(
                        labelText: 'Last Name',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Enter your Last Name';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          widget.model.elastName = value;
                        },
                        max: 20,
                      ),
                      MyTextFormField(
                        labelText: 'Relation',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Enter the Relation';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          widget.model.relation = value;
                        },
                      ),

                      MyTextFormField(
                        labelText: 'Email-ID',
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(
                                  fontFamily: 'Pangolin',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: mainColor))),
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
                          maxLength: 10,
                          onSaved: (String value) {
                            widget.model.emobileNo = value;
                          },
                        ),
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
                        onSaved: (String value) {
                          widget.model.eaddressLine1 = value;
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
                        onSaved: (String value) {
                          widget.model.epincode = value;
                        },
                      ),

                      RaisedButton(
                        color: mainColor,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Check(model: widget.model)));
                          }
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
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
class MyTextFormField extends StatelessWidget {
  final String labelText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  final bool isDate;
  final int max;
  MyTextFormField({
    this.labelText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
    this.isDate=false,
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
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        maxLength: max,
      ),
    );
  }
}