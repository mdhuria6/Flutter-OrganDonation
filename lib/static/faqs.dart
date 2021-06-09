import 'dart:ui';
import 'package:pgimer/global/drawer.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pgimer/global/bottomNavBar.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:pgimer/main.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: abc,
        //appBar: AppBar(),
        body:Container(
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
                //padding: const EdgeInsets.only(top: 15),
                child: Stack(
                  children: [
                    //Align(child: Image.asset('images/sample2.png',width: MediaQuery.of(context).size.width * 0.91,height: MediaQuery.of(context).size.height * 0.45,),alignment: Alignment.center,),
                    CustomAppbar(abc,'FAQ\'s'),],),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              CustomTile('What is Organ Donation?', 'Organ Donation is the gift of an organ to a person with end stage organ disease and who needs a transplant.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('What are the different types of Organ Donation?', 'There are two types of organ donation:-\n\n'
                  'i) Living Donor Organ Donation: A person during his life can donate one kidney (the other kidney is capable of maintaining the body functions adequately for the donor), a portion of pancreas (half of the pancreas is adequate for sustaining pancreatic functions) and a part of the liver (the segments of liver will regenerate after a period of time in both recipient and donor).'
                  '\n\nii) Deceased Donor Organ Donation: A person can donate multiple organ and tissues after (brain-stem/cardiac) death. His/her organ continues to live in another person’s body.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('Who can be a Donor?','Living Donor: Any person not less than 18 years of age, who voluntarily authorizes the removal of any of his organ and/or tissue, during his or her lifetime, as per prevalent medical practices for therapeutic purposes.'
                  '\n\nDeceased Donor: Anyone, regardless of age, race or gender can become an organ and tissue donor after his or her Death (Brainstem/Cardiac). Consent of near relative or a person in lawful possession of the dead body is required. If the deceased donor is under the age of 18 years, then the consent required from one of the parent or any near relative authorized by the parents is essential. Medical suitability for donation is determined at the time of death.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('If I carry a donor card, will my organ be taken out without my family being asked?','No. Even though if you carry a donor card, your immediate family members and close relatives will be asked for donation of organs and tissues. The consent is mandatory from the person lawfully in possession of the dead body, before donation can be carried out. If they refuse, then organ donation will not take place.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('Who can give consent for organ donation after brain-stem death?','A person legally in possession of the deceased person can sign the consent form. This is usually done by a parent, spouse, son/daughter or brother/sister.'
                  '\n\nBy signing a consent form the family says that they do not have any objection to the removal of organs from the body of their loved one. It is a legal document. This form is kept with the hospital.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('Does organ / tissue removal affect cremation / burial arrangements or disfigure the body?','No. The removal of organs or tissues will not interfere with customary funeral or burial arrangements. The appearance of the body is not altered. A highly skilled surgical transplant team removes the organs and tissues which can be transplanted in other patients. Surgeons stitch the body carefully, hence no disfigurement occurs. The body can be viewed as in any case of death and funeral arrangements need not be delayed.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('What, if I had pledged to donate Organs, but my family refuses?','In most situations, families agree of donation if they knew that was their loved one’s wish. If the family, or those closest to the person who has died, object to the donation when the person who has died has given their explicit permission, either by telling relatives, close friends or clinical staff, or by carrying a donor card  , healthcare professionals will discuss the matter sensitively with them. They will be encouraged to accept the dead person’s wishes. However, if families still object, then donation process will not go further and donation will not materialize.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('Are there any religious objections to donate Organs and Tissues?','No, none of our major religions object to donate organs and tissues, rather they all are promoting and supporting this noble cause. If you have any doubts, you may discuss with your spiritual or religious leader or advisor.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('What is waiting list for Organ Transplant?','A list of people waiting for receiving an organ after an organ failure.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('How does someone get on the waiting list?','The patient can register for inclusion in the waiting list through a registered transplant hospital. The treating physician of the hospital shall make an evaluation (based on medical history, current condition of health, and other factors) and decide if the patient needs a transplant and meets the criteria to be listed. Like for kidney transplant, other than blood group, main criteria is time since patient is on regular dialysis. Similarly, for other organs, criteria are different based on medical history, current condition of health, and other factors.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('What is Brain-stem Death?','Brain stem death is cessation of function of the brain stem due to irreversible damage. It is an irreversible condition and the person has died. It is also called Brain Death in India.'
                  '\n\nA brain stem dead person cannot breathe on his own; however the heart has an inbuilt mechanism for pumping as long as it has a supply of oxygen and blood. A ventilator continues to blow air into lungs of brain stem dead persons, their heart continues to receive oxygenated blood and medicine may be given to maintain their blood pressure. The heart will continue to beat for a period of time after brain stem death – this does not mean that the person is alive, or that there is any chance of recovery.'
                  '\n\nThe declaration of brain stem death is made with accepted medical standards. The parameters emphasize the 3 clinical findings necessary to confirm irreversible cessation of all functions of the entire brain, including the brain stem: coma (loss of consciousness) with a known cause, absence of brainstem reflexes, and apnea (absence of spontaneous breathing). These tests are carried out twice at the interval of at-least 6-12 hours by the team of Medical Experts. Brain-stem Death is accepted under the Transplant Human Organ Act since 1994.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('Is Brain-stem Death legally accepted as death?','Yes, As per the Transplantation of Human Organs Act 1994 Brain Stem Death is legally accepted as death.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('Do I need to carry my donor card always?','Yes, it will be helpful for the health professionals and your family.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('What is the benefit to my family or me after donation of organs?','Donation of an organ or tissue provides an unparalleled opportunity to give someone a second chance of life. Your donation is not only giving impact to the life of one person or family, but it is of overall help for the society as a whole.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('If I had pledged before, can I change my mind to un-pledge?','Yes, you can unpledge by making a call to our office or write or visit NOTTO website www.notto.nic.in and avail of the un-pledge option by logging into your account. Also, let your family know that you have changed your mind regarding organ donation pledge.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('What is Transplantation?','Transplantation is the act of surgical removal of an organ from one person and placing it into another person. Transplantation is needed when the recipient’s organ has failed or has been damaged due to illness or injury.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('Who is transplant coordinator?','Transplant Coordinator means a person appointed by the hospital for coordinating all matters relating to removal or transplantation of Human Organs or Tissues or both and for assisting the authority for removal of human organs.'
                  '\n\nThough their work is more related to deceased organ donation, they are responsible for living organ donation also. The current Transplantation of Human Organ Act envisages that every hospital doing transplant activity, whether retrieval or organ transplantation must have a transplant coordinator in the hospital before the center is registered for transplantation under the act. Transplant coordinator is a pivot of the organ donation and transplantation.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('What is the role of a transplant coordinator in Organ & Tissue Transplant?','The transplant coordinator has to counsel the grieved family, make them comfortable and approach the subject of eye donation and later on solid organ donation.'
                  '\n\nIf the family gives consent for organ retrieval, then the coordinator has to inform the Nodal Officer and coordinate with the ICU staff to maintain the patient on ventilator and organize organ retrieval. The coordinator has to ensure that all paperwork is correctly done and that the family receives the body as soon as possible.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('Which organs can be donated?','1. Heart\n2. Liver\n3. Kidney\n4. Lungs\n5. Pancreas\n6. Cornea\n7. Skin\n8. Heart Valves\n9. Bones\n10. Tendons'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('What is the protocol for organ distribution?','The organs would be distributed locally within the State first, and if no match is found, they are then offered regionally, and then nationally, until a recipient is found. Every attempt would be made to utilize donor organs.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('Can people buy / sell organs?','No. As per Transplant of Human Organ Act (THOA), buying/ selling of organ in any way is punishable and has significant financial as well judicial punishment. Not only in India, but in any part of world, selling of an organ is not permissible.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              CustomTile('Would a donor’s or recipient’s family ever know each other?','No, in Cadaver Organ Donation Programme confidentiality is always maintained, unlike in the case of living donors who usually already know each other.'
                  '\n\nIf the family wishes, they will be given some brief details such as the age and sex of the person or persons who have benefited from the donation.'
                  '\n\nPatients who receive organs can obtain similar details about their donors. It is not always possible to provide recipient information to donor families for some types of tissue transplant.'
                  '\n\nThose who have wish to exchange anonymous letters of thanks or good wishes they can do it through the transplant coordinator. In some instances donor families and recipients have arranged to meet.'),
              SizedBox(height: MediaQuery.of(context).size.height*0.025,),
              last(context)
            ],
                ),
              ),
        drawer: CustomDrawer(),
        bottomNavigationBar: BottomBar()
      ),
    );
  }
}
// ignore: must_be_immutable
class CustomTile extends StatelessWidget {
 // String bullet = "\u2022 ";
  String A,B;
  CustomTile(this.A,this.B);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          //padding: EdgeInsets.all(8),
          //margin: EdgeInsets.all(8.0),
          child: GFAccordion(
              title: '$A',
              contentChild: Text('$B',
                textAlign: TextAlign.justify,),
              textStyle: TextStyle(
                fontSize: 18,
              ),
              contentBackgroundColor: mainColor.withOpacity(0.1),
              expandedTitleBackgroundColor: mainColor.withOpacity(0.2),
              contentBorder: Border.all(width: 1),
              contentPadding: EdgeInsets.all(10),
              collapsedTitleBackgroundColor: mainColor.withOpacity(0.2),
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize)
          ),
        )
        // Text('$A',
        //   style: TextStyle(
        //     fontSize: 18.0,
        //     fontWeight: FontWeight.w800,
        //     //fontFamily: 'acme',
        //
        //   ),
        //   textAlign: TextAlign.justify,),
        // SizedBox(height: 10,),
        // Align(
        //   alignment: Alignment.centerLeft,
        //   child: Text(B,
        //     style: TextStyle(
        //       fontSize: 16.0,
        //       fontWeight: FontWeight.w400,
        //       //fontFamily: 'acme',
        //
        //     ),
        //     textAlign: TextAlign.justify,),
        // )
      ],
    );
  }
}

