import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:doctor_appointment_app/components/scheulde.dart';

class AppoitmentCard extends StatefulWidget {
  const AppoitmentCard({super.key});

  @override
  State<AppoitmentCard> createState() => _AppoitmentCardState();
}

class _AppoitmentCardState extends State<AppoitmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('assets/doctor.jpg'), //doctor image
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text('Dr .Ram  Narayan Shah',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Center(
                            child: Text('Cardiologist',
                                style: TextStyle(
                                  color: Colors.black,
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                  Config.spacesmall,
                  // SCHEDULE
                  Scheulde(),
                  Config.spacesmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.withOpacity(0.9),
                          ),
                          child: Text('Cancel',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.withOpacity(0.9),
                          ),
                          child: Text('Concluded',
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    ],
                  )
                ],
              )),
        ));
  }
}
//the information here will be replaced by api after database setup

