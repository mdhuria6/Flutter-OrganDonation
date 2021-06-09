import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/global/bottomNavBar.dart';
import 'package:pgimer/main.dart';
class Guide extends StatefulWidget {
  @override
  _GuideState createState() => _GuideState();
}
class _GuideState extends State<Guide> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
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
              //padding: const EdgeInsets.only(top: 15),
              child: Stack(
                children: [
                  //Align(child: Image.asset('images/sample2.png',width: MediaQuery.of(context).size.width * 0.91,height: MediaQuery.of(context).size.height * 0.45,),alignment: Alignment.center,),
                  CustomAppbar(abc,'Transplant Guide'),],),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Text('Organ donation: A guide for the recipient',
              style: TextStyle(
                fontSize: 20.0,
                //fontFamily: 'acme',
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            TextB('An organ transplant is a new ray of light for the patients suffering from end stage organ failure. As per the statistics from Zonal'
                ' Transplant Coordination Committee, approximately 4000 patients with end stage organ failure are waiting for a transplant at the moment.'
                ' Over 350 of them are for liver (one of the most important organs in our body\'s digestive system). An organ transplant, especially of a liver,'
                ' requires a close match between the recipient and donor.'),
            TextB('Organ transplantation is a complex process and involves several criteria. The recipient seeking a transplant must respond quickly so '
                'that the surgery is scheduled within just a few hours of finding the right donor, as organs can only survive for a limited time, once '
                'retrieved. The recovery plays a crucial part in organ transplants, the recipient has to stay in the hospital as doctors monitor their condition'),
            TextB('However, the task has become extremely difficult during the pandemic. The city has witnessed over 73% drop in the number of cadaveric'
                ' organ donation as compared to the last year. Moreover, if patients continue to delay visiting the hospital, '
                'the burden of fatalities amongst the end stage organ failure patients is likely to increase.'),
            TextB('The success of any organ transplant surgery is gauged by how well patients follow post-operative care measures as advised by the doctors'
                '. The recipient of an organ transplant needs to take the prescribed medication on time. A healthy routine after a transplant surgery '
                'boosts a quick recovery.'),
            TextB('The first three months following the procedure are the most difficult. In case of a liver transplant, '
                'the body is adjusting to the \'new\' liver medications are required to maintain its health. By the time of discharge from the hospital, '
                'patients can take care of themselves, with some minor restrictions. The transplant team carefully prepares each patient for discharge.'
                ' Most patients can return to work within 3 to 6 months after a transplant. Playing sports and getting healthy exercise, socialising'
                ' and travelling are all possible after the time prescribed by the doctor.'),
            TextB('An organ recipient can return to normal life by keeping a few things in mind:'),
            TextB(' 1. Hygiene: The patient should ensure proper care and hygiene. Washing hands after contact with other people, well-ventilated room'
                ' and cleansing with water daily are essential.'),
            TextB(' 2. Safety: The patient needs to wear a safety mask for at least three months following the transplant surgery. Avoiding crowded'
                ' places, contact with stray animals or any external elements that can cause infection should be kept in mind.'),
            TextB(' 3. Healthy Diet: A recipient should follow a healthy and protein-enriched, well-balanced diet. Excessive sugars and fats should'
                ' be avoided. In the initial stages, especially after liver transplant surgery, raw food and salads are not advised for a '
                'healthy recovery. The patient should abstain from smoking, and consuming tobacco and alcohol.'
                ' Any type of unprescribed drugs should not be used by the patient.'),
            TextB(' 4. Exercise: One should avoid heavy weight exercise, weight training, and swimming unless the doctor advises so. Meditation also'
                ' helps boosts the mood and overall wellbeing.'),
            TextB('The healthcare sector as a whole is going through a metamorphosis to continue offering, lifesaving emergency medical services '
                'such as organ transplants even amidst the pandemic. Now it is the responsibility of the patients to shed their fears and seek '
                'immediate clinical intervention for minor medical complications right now, to avoid a major tragedy in future.'),
            last(context)
          ],
        ),
          bottomNavigationBar: BottomBar()
      ),
    );
  }
}
class TextB extends StatelessWidget {
  final String A;
  TextB(this.A);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(8.0),
      child: Text(A,
      style: TextStyle(
        fontSize: 16.0,
        //fontFamily: 'Pangolin',
      ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
