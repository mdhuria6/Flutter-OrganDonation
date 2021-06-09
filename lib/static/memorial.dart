import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pgimer/global/bottomNavBar.dart';
import 'package:pgimer/global/customappbar.dart';
import 'package:pgimer/main.dart';
import 'package:getwidget/getwidget.dart';
class Memorial extends StatefulWidget {
  @override
  _MemorialState createState() => _MemorialState();
}

class _MemorialState extends State<Memorial> {
  GlobalKey<ScaffoldState> abc = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
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
                  CustomAppbar(abc,'Donor Memorial'),],),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            CustomSlot('Manjit.jpg', 'Capt. Manjit Kumar', 'Ambala, Haryana', '60 Years', '26th February, 2019'
                    ,'Such is the valour and spirit of sacrifice of our soldiers that they not only live their lives saving others, but also turn saviour even in their passing. PGIMER witnessed this rare and magnanimous gesture of supreme sacrifice by Capt. Manjit Kumar from Ambala when his braveheart family consented to donate his organs, which saved lives of two terminally ill renal failure patients and restored the eye sight of two others in PGIMER. “My husband was a brave soldier. We have done what he would’ve wanted us to do. I felt like he was telling us this is what he wanted. From that moment on it was about honouring him. He lived saving others and in death too, he did the same, ”said an extremely courageous but emotional Mrs. Gurmeet Kaur, after she consented to donate the organs of her deceased husband Captain Manjit Kumar, who was declared brain dead here at PGIMER on 25th February. The donor Manjit Kumar, 60 years, retired from Indian Army and a resident of Vikas Puri, Khuda Khurd, Ambala Cantt. was grievously injured when his two wheeler was brutally hit by a rashly driven vehicle on 23rd February. Though the family rushed him to PGIMER Chandigarh on the same day. But the destiny had willed otherwise and Capt. Manjit Kumar was declared brain dead on 25th February. Braving their own grave tragedy, the family took an exceptionally magnanimous initiative and expressed willingness to donate organs of their dear Capt. Manjit Kumar as the Transplant Coordinators at PGIMER discussed the option of Organ Donation with them. Thanks to the selfless and incredible decision, post transplantation, the kidneys gave two critical patients another chance to live and corneas enabled two more patients to restore their eye sight thereby improving the quality of life of four patients in all.'),
            CustomSlot('pritam.jpg', 'Pritam', 'Chandigarh', '11 Months', '10th July, 2018',
                'In an exemplary gesture, the parents of an 11month-old baby from Sector 45, Chandigarh donated his organs, giving a new lease of life to a terminally ill renal failure patient here at PGIMER. This makes the baby the youngest donor in PGIMER’s transplant history so far since the cadaver renal transplant program initiated in 1996. When the attending doctors broke the news to young parents Geeta and Lakshman that their beloved son Pritam wouldn’t pull through here at PGIMER, they knew they didn’t want his death to be in vain. “It’s something no family should have to go through. We said yes to Organ Donation because we knew this could help some one else and they wouldn’t need to go through the heartache that we were going through. We knew it was the right thing to do, ”said the grief stricken but brave-heart parents of angelic Pritam. It was picture perfect moments for Geeta on 6th July. Her 11 month old cherubic son playing gleefully in his baby cot and she thoroughly enjoying his every gesture, every movement till in a split second, the little one rolled over and fell from the cot. Before Geeta could realize what had happened, her little one had already slipped into coma due to fatal head injury. The family immediately rushed the baby to the hospital. “Incessant attempts to revive the baby proved futile, as Pritam continued to remain on ventilator. Finally, when the doctors called me and my wife Geeta, both of us instantly knew it was terrible news. We can’t blame anyone but our own destiny, “shared Lakshman, the father of donor infant, while trying to come to terms with the dark reality. Following the consent of the parents, the baby’s kidneys were retrieved and transplanted to an adult. Though the first priority was pediatric recipients, however, the cross match identified an adult recipient so both the kidneys were transplanted to the same patient in view of the recipient’s age.'),
            CustomSlot('suraj.jpg', 'Suraj', 'Malerkotla, Punjab ', '21 Years', '5th May 2018',
                'In sync with his name, donor Suraj, all of 21 years, from Malerkotla, Punjab, rises again in three terminally ill patients through the transplantation of his liver, kidneys and pancreas and spreads light in the life of the recipients despite bidding adieu to this mortal world here at PGIMER today. It was a routine ride on two wheeler with a friend on the night of 28th April when the unexpected happened and the time stopped for the family of Suraj as he was fatally hurt in a head-on collision with a car and slipped into coma. However, due to poor prognosis, Suraj was shifted to ICU. In the following days, Suraj’s condition kept worsening further and became irretrievable and eventually, Suraj was declared brain dead on 5th May. In the meantime, transplant coordinators at the PGIMER apprised the deceased’s relatives of an opportunity to utilize his organs through donation for transplants. With the deceased’s father Ram Avtar giving a nod to the proposal, the concerned departments started reaching out to the matching recipients to honour the family’s courageous decision of organ donation despite being faced with this grim tragedy of losing their son. “When I was told that Suraj’s organs could save others, I agreed after taking consent of my family. There was only one thought in our minds that made us take this tough call that we save some other family from facing this unbearable pain which our family is confronted with. There cannot be anything more traumatic than losing your child in his prime. May be someone else turns lucky and his survives with organ donation of my son,” said the brave heart father Ram Avtar.'),
            CustomSlot('chanchel.jpg', 'Chanchel Dev', 'Hamirpur, Himachal Pradesh', '54 Years', '8th April, 2018',
                'Chanchel Dev 54 year old resident of Mangewal, Anandpur Sahib, Punjab didn’t know what fate has to offer next when out on a routine morning walk on 5th of April, he was fatally hit by a two wheeler and became unconscious due to severe head injury. After initial treatment in Civil Hospital, Anandpur Sahib, Chanchal Dev was referred to PGIMER and was admitted here on 6th April and declared brain dead. When Chanchal Dev’s wife, Shakuntala Devi, was discussed about the option of Organ Donation, her magnanimity was beyond the comprehension of any words, when she said, “There can’t be anything more painful than losing your spouse. Nothing in this world can fill the void which has been created by his untimely death. With organ donation, not only he will stay in our hearts, he will stay in the hearts of those also, whom he has given life while going from this world.” And she made her husband immortal by consenting for organ donation and saving the lives of hapless and helpless terminal patients.'),
            CustomSlot('kiran.jpg', 'Kiran', 'Mangewal, Anandpur Singh, Punjab', '21 Years', '10th March, 2018',
                'The untimely and tragic demise of Kiran, all of 21, a BA final year student of Govt. Degree College, Joginder Nagar, district Mandi was beyond comprehension and extremely difficult to reconcile with. In a freak two wheeler accident near Joginder Nagar, Kiran sustained grievous head injury on 8th March. After initial treatment in a in a local hospital in Tanda, the family shifted her to PGIMER in the early hours of 9th March. “My daughter was the heart and soul of our family. Sporty, vivacious, bubbly, Kiran had a song in her heart and spring in her feet. She would help anyone, any time and not think twice about it. For someone so full of life and compassion, for her to go so early at an age of only 21 is just so unfair…” said an inconsolable Ravinder Singh, father of donor Kiran and an agriculturist from Joginder Nagar, as the family consented to donate the organs of their dear daughter, after she was declared brain-dead in PGIMER. Following the family’s consent, the kidneys of the donor Kiran were retrieved, which on transplantation saved the lives of two critical patients suffering from end stage kidney ailments, thereby, giving them second chance at life.'),
            CustomSlot('gagandeep.jpg', 'Gagandeep Singh', 'Jalalabad, Punjab', '18 Years', '23rd February, 2018',
                '“Gagandeep Singh, all of 18, from Jalalabad, district Fazilka, Punjab was a picture of life itself…lively, sporty and in the pink of health. He had a smile that would light up any room he walked into and had a heart of gold. Even at this young age, he used to be the first one to help others without caring for his own comforts ever and even in his death, he remained true to his ‘caring and giving’ nature’ by saving others.” The day of 18th February started like any other normal day for Malkit Singh but his world crashed as the evening dawned when he got the tragic news of his son being grievously injured in head on collision with a tractor trolley, while pillion riding on a two wheeler with a friend. However, God’s will can’t be questioned and all the efforts to save Gagandeep proved futile as he finally succumbed to his injuries and declared brain dead on 22nd February. “Everything came crashing down,” recalled grief stricken Malkit Singh, shell-shocked father of deceased Gagandeep. “Then the transplant coordinators at PGIMER talked to us about organ donation. The idea of having a chance to save someone else’s life made sense to us-even though we didn’t have the heart to take Gagandeep off life support.” “Then we asked ourselves what Gagandeep would have wished. My son definitely would have wanted someone to have more time to spend with his loved ones. We felt as if he himself is saying us to ‘go ahead ‘ with the decision and that very feeling made us consent for his organ donation which gave fresh lease of life to three terminally ill patients with the transplantation of liver and kidneys at PGIMER”, shared the brave heart father Malkit Singh. Quick links'),
            CustomSlot('varun.jpg', 'Varun Kumar', 'Hamirpur, Himachal Pradesh', '25 Years', '21st October, 2017',
                'As life ends for one person, it is just beginning for someone else. That is the bittersweet reality of organ donation. It is an extremely hard decision amid immense grief for the donor family, but families like that of donor Varun definitely instill a sense of confidence and a ray of hope. It is through their generous gifts that hundreds of people each year are given a second chance at life. The exemplary and selfless decision of organ donation taken by the family of Varun Kumar, of 25 years from Hamirpur and an employee in Production Department in Oxalis Labs in Baddi, Dist. Solan, who could not survive the fatal head injury on account of a two-wheeler accident, resulted in saving lives of three critical patients suffering from end stage diseases with liver and kidneys transplantation and restored the eye-sight for another two on cornea transplantation, thereby impacting five lives in all. “Varun was the God’s greatest gift to us. So perfect and lively, that he was the picture of life itself. His thousand wattage smile would light up any room he walked into and his energy would perk up even dullest of the moments. And with his demise at this prime youth, it is like dead end to our own lives. We are devastated by the loss of our lovely son,” said Anoop Chand, father of Varun, after consenting for Organ Donation at PGIMER. “Donating Varun’s organs was an extension of his persona as he had always gone out of his way to show kindness and compassion to others. Even in his death, he has done the same. It was as if he was guiding us to go ahead with this hard decision.” stated the heart broken but brave father of donor Varun. Quick links'),
            CustomSlot('tamreen.jpg', 'Tamreen', 'Akrola, Uttar Pradesh', '11 Years', '19th September, 2017',
                'A Lesson Taught in Altruism & Humanity Akrola, Uttar Pradesh Date of Donation: 19th September, 2017 Nothing can console a parent over the death of their child, but knowing his 11 years old daughter Tamreen’s organs saved two other people helps Yusuf Shah feel his daughter did not die in vain. Describing his daughter as “adorable, compassionate and creative”, Yusuf Shah said she would have been deeply proud of her legacy as he consented to donate the organs after his little daughter was declared brain dead in PGIMER. His generous decision and rare courage saved the two critical patients battling for survival after the transplantation of kidneys retrieved from donor Tamreen. It was just another busy day on 17th September for Yusuf Shah, father of donor Tamreen, until a terrible accident in Chandigarh changed everything. “Tamreen was so happy in the morning as she boarded the bus from Akrola in UP to be with her aunt and cousins in Chandigarh. But we could not think in our wildest of imagination that her happiness is so short-lived and our world would crash before the sun set.” On reaching Chandigarh, as Tamreen got down from the bus, she was brutally hit by a mini bus coming from behind, shared Yusuf. Tamreen was immediately rushed to PGIMER and was placed on life support, but she was beyond recovery as she had sustained severe head injuries and was declared brain dead. It was then the transplant coordinators at PGIMER raised the matter of organ donation with Yusuf Shah. “It was the hardest decision. But somehow, I felt like it was something we should do.” Yusuf Shah said after he consented for organ donation. What was a horrific decision for a grieving father became one of the few positives around the death of his daughter. “I’d recommend to anyone else who can do it, do it,” Yusuf Shah said. He decided to share his daughter’s incredible story with the world in the hope of encouraging others to sign up as the organ donors.'),
            CustomSlot('priyanka.jpg', 'Priyanka Jain', 'AZirakpur, Mohali, Punjab', '23 Years', '1st February, 2017',
                'Priyanka Jain, all of 23, a resident of Zirakpur, died the same way she lived, by caring and giving. Compassion was at the core of her being, so it seems right that it should also be her final act. “No words can convey our remorse. But we are trying to draw strength from the fact that as she had registered herself as an organ donor, we could actually fulfill her last wish,” added Ashima as the brave-heart family, through their magnanimous act of organ donation, gave second lease of life to two and sight to two more, thereby helping four patients in PGIMER. Destiny had something else in store, as brilliant life of Priyanka was cut short at its prime when a fun trip with her friends to Goa turned into this grim tragedy. While on their way from Goa to Pune near Karar Satar in the district Satara in a cab, the driver lost control while maneuvering a bend at the road. The cab banged into an iron railing on the side, leading to Priyanaka’s fatal head injury from which she could not be retrieved and she her battle with life on 2nd February. In an extremely rare incident, the family showcased indomitable spirit to fulfil Priyanka’s last wish to be an organ donor. Priyanka’s caring spirit, infectious smile and resounding laugh drew people to her. She was always there to lend a helping hand, provide an ear to listen and to give a smile that would brighten a cloudy day. One could easily spot her in the blood/organ donation camps because of her positive energy, energetic demeanor and proactive engagement with the participants motivating them to join the cause and register for blood and organ donation, shared Priyanka’s sister Ashima. In view of Priyanka’s decision to be an organ donor and her family’s commitment to honour her wish, Priyanka’s story became a resurrection story. Out of death and despair came new life. The good had come full circle.'),
            last(context),
          ],
        ),
       bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
class CustomSlot extends StatefulWidget {
  final String A;
  final String name;
  final String location;
  final String age;
  final String date;
  final String description;
  CustomSlot(this.A, this.name, this.location, this.age, this.date, this.description);

  @override
  _CustomSlotState createState() => _CustomSlotState();
}

class _CustomSlotState extends State<CustomSlot> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: MediaQuery.of(context).size.width*0.175,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/${widget.A}',
                ),
                radius: MediaQuery.of(context).size.width*0.15,

              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.015,),
            Column(
              children: [
                Text('${widget.name}, ${widget.age}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),),
                Text('${widget.location}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                  ),),
                Text('Date of Donation: ${widget.date}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                  ),),
                GFAccordion(
                    title: 'Their Story',
                    contentChild: Text('${widget.description}',
                    textAlign: TextAlign.justify,),
                    textStyle: TextStyle(
                        fontSize: 18,
                    ),
                    contentBackgroundColor: mainColor.withOpacity(0.1),
                    expandedTitleBackgroundColor: mainColor.withOpacity(0.2),
                    contentBorder: Border.all(width: 1),
                    contentPadding: EdgeInsets.all(10),
                    collapsedTitleBackgroundColor: mainColor.withOpacity(0.2),
                    collapsedIcon: Text('Click Here.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    expandedIcon: Icon(Icons.minimize)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}