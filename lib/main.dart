import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pgimer/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

final storage = FlutterSecureStorage();
const url = "http://192.168.1.8:3000";
Color mainColor = Color(0xff01579b);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    home: Getstarted(),
    debugShowCheckedModeBanner: false
  ));
}

class Getstarted extends StatefulWidget {
  @override
  _GetstartedState createState() => _GetstartedState();
}

class _GetstartedState extends State<Getstarted> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // String _message = '';
  _register() async {
    // await storage.delete(key: "fcm");
    print('1');
    String value = await storage.read(key: "fcm");
    print(value);
    if(value == null) {
      _firebaseMessaging.getToken().then((token) =>
          storage.write(key: "fcm", value: token)
      );
      print('2');
      _firebaseMessaging.getToken().then((token) => http.post(
          "$url/api/sendFcmToken", body:{"token" : token},  headers: {"x-source": "mobile"})
      );
      print('5');
    }
    var device = await storage.read(key: "fcm");
    print('device: $device');
    print('3');
  }

  @override
  void initState()
  {
    super.initState();
    _register();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: new ExactAssetImage('images/bg5.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.white.withOpacity(0.01),
                // width: MediaQuery.of(context).size.width * 0.80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    top(context),
                    bottom(context),
                    last(context)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget top(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: EdgeInsets.only(top: 8.0,left: MediaQuery.of(context).size.width*0.012),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Image.asset('images/rotto.png')),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Align(
              child: Text(
                " ROTTO PGIMER",
                style: TextStyle(
                    fontFamily: 'acme',
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                    fontSize: MediaQuery.of(context).size.width * 0.09),
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Image.asset('images/pgimer.png')),
        ],
      ),
    ),
  );
}

Widget bottom(BuildContext context) {
  return Column(
    children: <Widget>[
      Text(
        " BE THE CHANGE,\n BE AN ORGAN DONOR",
        style: TextStyle(
            fontFamily: 'Pangolin',
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
            color: mainColor,
            fontSize: MediaQuery.of(context).size.width * 0.06),
      ),
      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
      Center(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.50,
          child: Image.asset('images/bgblue.png'),
        ),
      ),
      Text(
        'ORGAN DONATION',
        style: TextStyle(
            fontFamily: 'Pangolin',
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: mainColor,
            fontSize: MediaQuery.of(context).size.width * 0.07),
      ),
      Text(
        'Give yourself and those in need an elixir of life by pledging for Organ Donation.',
        style: TextStyle(
            fontFamily: 'Caveat',
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
            color: mainColor,
            fontSize: MediaQuery.of(context).size.width * 0.06,
            height: 1.5),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 15),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new HomePage()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.06)),
            boxShadow: [
              BoxShadow(
                color: mainColor,
                offset: Offset(MediaQuery.of(context).size.width * 0.02,
                    MediaQuery.of(context).size.width * 0.02),
                spreadRadius: 1,
                blurRadius: 3,
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.06,
          child: Center(
              child: Text(
            'Get Started',
            style: TextStyle(
                fontFamily: 'BreeSerif',
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: mainColor),
            textAlign: TextAlign.center,
          )),
        ),
      ),
    ],
  );
}
Widget last(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          'Powered By. Capteurio Foundation',
          style: TextStyle(
              fontFamily: 'Caveat',
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: MediaQuery.of(context).size.width * 0.05,
              height: 1.5),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}