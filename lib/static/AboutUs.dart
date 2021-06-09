import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pgimer/global/bottomNavBar.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/main.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  String bullet = "\u2024 ";
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
                  CustomAppbar(abc,'ABOUT US'),],),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 2,
                    )
                ),
                child: Image.asset('images/aboutus.jpg'),
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  TextH('National Organ Transplant Programme'
                      ' Background'),
                  TextB('The shortage of organs is virtually a universal problem but Asia lags behind much of the rest of the world. India lags far behind other countries even in Asia. It is not that there aren’t enough organs to transplant. Nearly every person who dies naturally, or in an accident, is a potential donor. Even then, innumerable patients cannot find a donor.'),
                  SizedBox(height: 10.0,),
                  TextH('Situation of Shortage of Organs in India.'),
                  TextB('There is a wide gap between patients who need transplants and the organs that are available in India. An estimated around 1.8 Lakh persons suffer from renal failure every year, however the number of renal transplants done is around 6000 only. An estimated 2 Lakh patients die of liver failure or liver cancer annually in India, about 10-15% of which can be saved with a timely liver transplant. Hence about 25-30 thousand liver transplants are needed annually in India but only about one thousand five hundred are being performed. Similarly about 50000 persons suffer from heart failures annually but only about 10 to 15 heart transplants are performed every year in India. In case of Cornea, about 25000 transplants are done every year against a requirement of 1 Lakh.'),
                  SizedBox(height: 10.0,),
                  TextH('The Legal Framework in India'),
                  TextB('Transplantation of Human Organs Act (THOA) 1994 was enacted to provide a system of removal, storage and transplantation of human organs for therapeutic purposes and for the prevention of commercial dealings in human organs. THOA is now adopted by all States except Andhra and J&K, who have their own similar laws. Under THOA, source of the organ may be:'
                      '\n$bullet Near Relative donor (mother, father, son, daughter, brother, sister, spouse)'
                      '\n$bullet Other than near relative donor: such a donor can donate only out of affection and attachment or for any other special reason and that too with the approval of the authorization committee.'
                      '\n$bullet Deceased donor, especially after Brain stem death e.g. a victim of road traffic accident etc. where the brain stem is dead and person cannot breathe on his own but can be maintained through ventilator, oxygen, fluids etc. to keep the heart and other organs working and functional. Other type of deceased donor could be donor after cardiac death.'
                      '\n\nBrain Stem death is recognized as a legal death in India under the Transplantation of Human Organs Act, like many other countries, which has revolutionized the concept of organ donation after death. After natural cardiac death only a few organs/tissues can be donated (like cornea, bone, skin and blood vessels) whereas after brain stem death almost 37 different organs and tissues can be donated including vital organs such as kidneys, heart, liver and lungs.'
                      '\nDespite a facilitatory law, organ donation from deceased persons continues to be very poor. In India there is a need to promote deceased organ donation as donation from living persons cannot take care of the organ requirement of the country. Also there is risk to the living donor and proper follow up of donor is also required. There is also an element of commercial transaction associated with living organ donation, which is violation of Law. In such a situation of organ shortage, rich can exploit the poor by indulging in organ trading.'
                      'Government of India initiated the process of amending and reforming the THOA 1994 and consequently, the Transplantation of Human Organs (Amendment) Act 2011 was enacted. Some of the important amendments under the (Amendment) Act 2011 are as under:-'
                      '\n\n1. Tissues have been included along with the Organs.'
                      '\n2. ‘Near relative’ definition has been expanded to include grandchildren, grandparents.'
                      '\n3. Provision of ‘Retrieval Centres’ and their registration for retrieval of organs from deceased donors. Tissue Banks shall also be registered.'
                      '\n4. Provision of Swap Donation included.'
                      '\n5. There is provision of mandatory inquiry from the attendants of potential donors admitted in ICU and informing them about the option to donate – if they consent to donate, inform retrieval centre.'
                      '\n6. Provision of Mandatory ‘Transplant Coordinator’ in all hospitals registered under the Act.'
                      '\n7. To protect vulnerable and poor there is provision of higher penalties has been made for trading in organs.'
                      '\n8. Constitution of Brain death certification board has been simplified- wherever Neurophysician or Neurosurgeon is not available, then an anaesthetist or intensivist can be a member of board in his place, subject to the condition, that he is not a member of the transplant team.'
                      '\n9. National Human Organs and Tissues Removal and Storage Network and National Registry for Transplant are to established.'
                      '\n10. There is provision of Advisory committee to aid and advise Appropriate Authority.'
                      '\n11. Enucleation of corneas has been permitted by a trained technician.'
                      '\n12. Act has made provision of greater caution in case of minors and foreign nationals and prohibition of organ donation from mentally challenged persons.'
                      '\n\n In pursuance to the amendment Act, Transplantation of Human Organs and Tissues Rules 2014 have been notified on 27-3- 2014.'
                      '\nDirectorate General of Health Services, Government of India is implementing National Organ Transplant Programme for carrying out the activities as per amendment Act, training of manpower and promotion organ donation from deceased persons.'
                      '\nNational Organ Transplant Programme with a budget of Rs. 149.5 Crore for 12th Five year Plan aims to improve access to the life transforming transplantation for needy citizens of our country by promoting deceased organ donation.'),
                  SizedBox(height: 10.0,),
                  TextH('Issues and Challenges'),
                  TextB('# High Burden (Demand Versus Supply gap.'
                      '\n# Poor Infrastructure especially in Govt. sector hospitals.'
                      '\n# Lack of Awareness of concept of Brain Stem Death among stakeholders.'
                      '\n# Poor rate of Brain Stem Death Certification by Hospitals.'
                      '\n# Poor Awareness and attitude towards organ donation-Poor Deceased Organ donation rate.'
                      '\n# Lack of Organized systems for organ procurement from deceased donor.'
                      '\n# Maintenance of Standards in Transplantation, Retrieval and Tissue Banking.'
                      '\n# Prevention and Control of Organ trading.'
                      '\n# High Cost (especially for uninsured and poor patients).'
                      '\n# Regulation of Non- Govt. Sector.',),
                  SizedBox(height: 10.0,),
                  TextH('Objectives of National Organ Transplant Programme:'),
                  TextB('# To organize a systemof organ and Tissue procurement & distribution for transplantation.'
                      '\n# To promote deceased organ and Tissue donation.'
                      '\n# To train required manpower.'
                      '\n# To protect vulnerable poor from organ trafficking.'
                      '\n# To monitor organ and tissue transplant services and bring about policy and programme corrections/ changes whenever needed.',),
                  SizedBox(height: 10.0,),
                  TextH('NOTTO: National Organ and Tissue Transplant Organization'),
                  TextB('National Network division of NOTTO would function as apex centre for all India activities of coordination and networking for procurement and distribution of organs and tissues and registry of Organs and Tissues Donation and Transplantation in country. The following activities would be undertaken to facilitate Organ Transplantation in safest way in shortest possible time and to collect data and develop and publish National registry.',),
                  SizedBox(height: 10.0,),
                  TextH('At National Level:'),
                  TextB('1. Lay down policy guidelines and protocols for various functions.'
                      '\n2. Network with similar regional and state level organizations.'
                      '\n3. All registry data from States and regions would be compiled and published.'
                      '\n4. Creating awareness, promotion of deceased organ donation and transplantation activities.'
                      '\n5. Co-ordination from procurement of organs and tissues to transplantation when organ is allocated outside region.'
                      '\n6. Dissemination of information to all concerned organizations, hospitals and individuals.'
                      '\n7. Monitoring of transplantation activities in the regions and States and maintaining data-bank in this regard.'
                      '\n8. To assist the states in data management, organ transplant surveillance & Organ transplant and Organ Donor registry.'
                      '\n9. Consultancy support on the legal and non-legal aspects of donation and transplantation.'
                      '\n10. Coordinate and Organize trainings for various cadre of workers.',),
                  SizedBox(height: 10.0,),
                  Text('ROTTO cum SOTTO including Regional Tissue Bank (Tentative Plan):Identification: 5 ROTTO’S',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      //fontFamily: 'acme',
                    ),textAlign: TextAlign.center,),
                  Text('Five ROTTO cum SOTTO are to be set up one each at',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      //fontFamily: 'acme',
                    ),textAlign: TextAlign.center,
                      ),
                  Image(image: AssetImage('images/table.jpg',),),
                  SizedBox(height: 10.0,),
                  TextH('ROTTO PGIMER: A Backdrop'),
                  TextB('PGIMER has been designated as Regional Organ & Tissue Transplant Organization (ROTTO) for the Northern Region under the aegis of National Organ Transplant Programme (NOTP), Directorate General Health Services, Ministry of Health & Family Welfare, and Govt. of India.'
                      '\n\nPGIMER in its capacity as ROTTO  will co-ordinate with hospitals across the six states – Punjab, Haryana, Himachal Pradesh, Jammu and Kashmir, Rajasthan, Uttarakhand, U.P. and U.T. Chandigarh and will monitor organ transplantation, maintain a data bank of donors across the northern India and be a part of the national network for procurement and distribution of organs and tissue.'
                      '\n\nROTTO’s responsibilities will include maintaining data on the number of brain dead converted into donors, monitoring and surveillance of transplant activities in the north region, initiating health schemes for donors and collecting statistics from states.',),
                  SizedBox(height: 10.0,),
                  TextH('SOTTO: State Organ and Tissue Transplant Organization'
                      '\nResponsibilities of SOTTO'),
                  TextB('# Maintaining the waiting list of the patients requiring/needing transplants.'
                      '\n# Facilitating multi organ retrieval from a Brain stem death donor. Co-ordination for procurement of organ from a donor till the transplantation into a recipient.'
                      '\n# Matching of recipients with donor and organ allocation as per the designed policy within the State including distribution of organs and tissues.Matching of recipients with donor and organ allocation as per the designed policy within the State including distribution of organs and tissues.'
                      '\n# Dissemination of information to concerned hospitals, organizations and individuals.'
                      '\n# Post –transplant patients and live donors follow-up for assessment of graft rejection, survival rates etc.'
                      '\n# Collection of data from the hospitals.'),
                  SizedBox(height: 10.0,),
                  TextH('Recommended steps to Establish SOTTOs'),
                  TextB('# Identify the Institution.'
                      '\n# Site Selection.'
                      '\n# Establish Timeline.'
                      '\n# Prepare Blueprint.'
                      '\n# Submit Mandate Form.'
                      '\n# Await  funds  from  Ministry.'
                      '\n# Initiate  Action  Plan  on  receipt  of  Funds through  a  set  Timeline  under  the  following  heads :'
                      '\n# Renovation / Construction  of  Selected  Area'
                      '\n# Procuring  Equipment  and  Furniture'
                      '\n# Hiring  Manpower'
                      '\n# Networking'
                      '\n# Identification of OTTH (Organ & Tissue Transplant Hospital)& OTRH (Organ & Tissue Retrieval Hospital).'
                      '\n# Networking at State Level & with ROTTO/NOTTO.'
                      '\n# Conduct Awareness Programs& IEC Activities.'),
                ],
              ),
            ),
            last(context)
          ],
        ),
          bottomNavigationBar: BottomBar()
      ),
    );
  }
}

class TextH extends StatelessWidget {
  final String A;
  TextH(this.A);
  @override
  Widget build(BuildContext context) {
    return Text(A,
      style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        //fontFamily: 'acme',
      ),textAlign: TextAlign.center,

    );
  }
}
class TextB extends StatelessWidget {
  final String B;
  TextB(this.B);
  @override
  Widget build(BuildContext context) {
    return Text(B,
      style: TextStyle(
          fontSize: 16.0,
        //fontFamily: 'acme',
      ),textAlign: TextAlign.justify,
    );
  }
}
