class Model {

  String firstName;
  String middleName;
  String lastName;
  String sonDaughterWifeOff;
  String sonDaughterWifeOffRelation;
  var aadhaarNo;
  int dateOfBirth;
  var age;
  String gender;
  String bloodGroup;
  String emailId;
  var mobileNo;
  String addressLine1;
  String addressLine2;
  String country;
  String state;
  String city;
  var pincode;

  Model({this.firstName,this.middleName, this.lastName, this.sonDaughterWifeOff, this.sonDaughterWifeOffRelation, this.aadhaarNo, this.dateOfBirth, this.gender, this.bloodGroup, this.emailId, this.age,
    this.mobileNo, this.addressLine1, this.addressLine2, this.country, this.state, this.city, this.pincode,
    this.efirstName, this.elastName, this.relation, this.eemailId, this.emobileNo, this.eaddressLine1,
    this.eaddressLine2, this.ecountry, this.estate, this.ecity, this.epincode, this.allOrgans, this.liver, this.kidney, this.heart, this.intestine, this.pancreas,
    this.lung, this.alltissues, this.bones, this.heartValve, this.skin, this.cornea, this.cartilage});

  String efirstName;
  String emiddleName;
  String elastName;
  String relation;
  String eemailId;
  var emobileNo;
  String eaddressLine1;
  String eaddressLine2;
  String ecountry;
  String estate;
  String ecity;
  var epincode;

  bool allOrgans=false, liver=false, kidney=false, heart=false, intestine=false, pancreas=false,lung=false,
      alltissues=false, bones=false, heartValve=false, skin=false, cornea=false, cartilage=false;

}
