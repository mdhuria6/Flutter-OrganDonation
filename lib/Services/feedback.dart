import 'dart:io';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pgimer/global/bottomNavBar.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/global/drawer.dart';
import 'package:pgimer/home/homepage.dart';
import 'package:pgimer/loginpage.dart';
import 'package:pgimer/main.dart';
Dio dio = new Dio();
class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  File _image;
  String fileName = 'select Image(optional)';
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print('image');
        //String base64Image = base64Encode(_image.readAsBytesSync());
        fileName = _image.path.split("/").last;
      } else {
        print('No image selected.');
      }
    });
  }
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  TextEditingController feedbackController = new TextEditingController();
  TextEditingController subjectController = new TextEditingController();

  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future checkLoginStatus() async {
    String value = await storage.read(key: "jwt");
    bool hasExpired = JwtDecoder.isExpired(value);
    print(hasExpired);
    if (hasExpired) {
      displaydialogg();
    }
  }

  void displaydialogg() => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Notice'),
          content: Text('You are not Logged In.'
              'Do you wish to logIn Now?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text('YES'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('NO'),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: abc,
        body: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              //padding: const EdgeInsets.only(top: 15),
              child: Stack(
                children: [
                  //Align(child: Image.asset('images/sample2.png',width: MediaQuery.of(context).size.width * 0.91,height: MediaQuery.of(context).size.height * 0.45,),alignment: Alignment.center,),
                  CustomAppbar(abc, 'FeedBackForm'),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.025,
                0,
                MediaQuery.of(context).size.width * 0.025,
                0,
              ),
              child: TextFormField(
                controller: subjectController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Subject',
                  labelStyle: TextStyle(
                    color: mainColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: mainColor),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  hintText: 'Enter the subject here!!',
                  helperText: 'Enter 5 Lines At Maximum',
                  helperStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.01875,
                    color: Color(0xffc5c5c5),
                  ),
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.01875,
                    color: Color(0xffc5c5c5),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.025,
                0,
                MediaQuery.of(context).size.width * 0.025,
                0,
              ),
              child: TextField(
                controller: feedbackController,
                enabled: true,
                maxLines: 10,
                decoration: InputDecoration(
                  focusColor: mainColor,
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: mainColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: mainColor),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  hintText: 'Please describe the issue',
                  helperText: 'Enter 10 Lines At Maximum',
                  helperStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.01875,
                    color: Color(0xffc5c5c5),
                  ),
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.01875,
                    color: Color(0xffc5c5c5),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    size: 50.0,
                    color: mainColor,
                  ),
                  onPressed: getImage,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(fileName)
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      sendFeedback(
                          subjectController.text, feedbackController.text, _image);
                    },
                    color: mainColor,
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text('SUBMIT',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontFamily: 'BreeSerif',
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                )
              ],
            ),
            last(context)
          ],
        ),
        drawer: CustomDrawer(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }

  Future sendFeedback(String subject, String feedback, File imageFile) async {
   print('here');

      try{
        Response response;
        String value = await storage.read(key: "jwt");
        Options options = Options(
            headers:{
              //"Content-Type": "multipart/form-data",
              "x-source": "mobile",
              "x-auth-token": value
            }
        );
        FormData formData = new FormData();
        if(imageFile == null)
          {
             formData = FormData.fromMap({
              "Subject": subject,
              "feedback": feedback,
              "review":''
            });
          }
        else
          {
             formData = FormData.fromMap({
              "Subject": subject,
              "feedback": feedback,
              "review": await MultipartFile.fromFile(imageFile.path, filename: fileName,
                  contentType: new MediaType("image","png")),
              "type": "image/png"
            });
          }
        response = await dio.post('$url/api/user/feedback', data: formData, options: options);

        if(response.statusCode == 200){
          print('200');
          displaydialog();

        }else{
          displayDialog(context, "Error", "${response.data}");
          print('error');
        }
      }catch(e){
        print('e: $e');
      }

    // Map data = {
    //     "Subject": subject,
    //     "feedback": feedback,
    //   "review": imageFile!=null?'data:image/png;base64,' +
    //       base64Encode(_image.readAsBytesSync()):''
    //   };
    // print(data);
    // String value = await storage.read(key: "jwt");
    // var jsonResponse;
    // final response = await http.post("$url/api/user/feedback",
    //       body: data,
    //       headers: {
    //         //"Content-Type": "application/formdata",
    //         "x-source": "mobile",
    //         "x-auth-token": value
    //       });
    //   jsonResponse=jsonDecode(response.body);
    // //print("json response: $jsonResponse");
    // if(response.statusCode==200)
    //   {
    //     if (jsonResponse['success'] == true) {
    //       displaydialog();
    //     } else {
    //       displayDialog(context, "Error", "${jsonResponse['msg']}");
    //     }
    //   }
  }

  void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );
  void displaydialog() => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Success'),
          content: Text('Feedback Sent Successfully!!'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()),
                    (Route<dynamic> route) => false);
              },
              child: Text('Next'),
            ),
          ],
        ),
      );
}
