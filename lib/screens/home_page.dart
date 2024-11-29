import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctor_appointment_app/components/doctorscard.dart';
import 'package:doctor_appointment_app/components/appoitment_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> medicalcategories = [
    {"icon": FontAwesomeIcons.stethoscope, "category": "General Physician"},
    {"icon": FontAwesomeIcons.tooth, "category": "Dental"},
    {"icon": FontAwesomeIcons.bacteria, "category": "Cancer Doctor"},
    {"icon": FontAwesomeIcons.droplet, "category": "Uro-Surgeon"},
    {"icon": FontAwesomeIcons.hand, "category": "Dermatologist"},
    {"icon": FontAwesomeIcons.personPregnant, "category": "Gynaecologist"},
    {"icon": FontAwesomeIcons.child, "category": "Child Doctor"},
    {"icon": FontAwesomeIcons.bone, "category": "Orthopaedic Surgeon"},
    {"icon": FontAwesomeIcons.userDoctor, "category": "Gastroenterologist"},
    {"icon": FontAwesomeIcons.lungs, "category": "Respirations"},
    {"icon": FontAwesomeIcons.xRay, "category": "Radiologist"},
    {"icon": FontAwesomeIcons.heart, "category": " Cardiology"},
    {"icon": FontAwesomeIcons.brain, "category": "Brain Doctor"},
    {"icon": FontAwesomeIcons.eye, "category": "Eye Doctor"},
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Priyanka',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                        child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              'assets/user.png',
                            ))) //user
                  ],
                ),
                Config.spaceMedium,
                //category Listing
                const Text('Category',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                Config.spacesmall,
                SizedBox(
                    height: Config.heightSize * 0.08,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List<Widget>.generate(
                            medicalcategories.length, (index) {
                          return Card(
                              margin: const EdgeInsets.only(right: 5),
                              color: Config.primarycolor,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 15,
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        FaIcon(medicalcategories[index]['icon'],
                                            color: Colors.grey.shade300),
                                        const SizedBox(width: 20),
                                        Text(
                                            medicalcategories[index]
                                                ['category'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))
                                      ])));
                        }))),
                Config.spacesmall,
                Text('Appointment Today',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                Config.spacesmall,
                //display appointment card here
                AppoitmentCard(),
                Config.spacesmall,
                Text('Top Doctors',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                //list of top doctors
                Config.spacesmall,
                Column(
                  children: List.generate(10, (index) {
                    return Doctorscard(
                      route: 'doctor_details',
                    );
                  }),
                )
              ]),
        ),
      ),
    ));
  }
}
