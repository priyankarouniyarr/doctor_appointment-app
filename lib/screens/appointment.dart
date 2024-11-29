import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:doctor_appointment_app/components/scheulde.dart';

class Appointmentpage extends StatefulWidget {
  const Appointmentpage({super.key});

  @override
  State<Appointmentpage> createState() => _AppointmentpageState();
}

//enum for appointment status
enum FilterStatus { Upcoming, Complete, Cancel }

class _AppointmentpageState extends State<Appointmentpage> {
  FilterStatus status = FilterStatus.Upcoming; //inital status
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      "doctor_name": "Ram Narayan Shah",
      "doctor_profile": "assets/doctor.jpg",
      "category": "Cardiology",
      "status": FilterStatus.Upcoming,
    },
    {
      "doctor_name": "Ram Shah",
      "doctor_profile": "assets/doctor.jpg",
      "category": "Brain Doctor",
      "status": FilterStatus.Complete,
    },
    {
      "doctor_name": "Honey Rana",
      "doctor_profile": "assets/doctor.jpg",
      "category": "Dental",
      "status": FilterStatus.Complete,
    },
    {
      "doctor_name": "Prewaj Kumar",
      "doctor_profile": "assets/doctor.jpg",
      "category": "General Physician",
      "status": FilterStatus.Cancel,
    },
  ];

  @override
  Widget build(BuildContext context) {
    //in this 3 status upcoming,complete and cancel
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      // switch (schedule['status']) {
      //   case 'upcoming':
      //     schedule['status'] = FilterStatus.upcoming;
      //     break;
      //   case 'complete':
      //     schedule['status'] = FilterStatus.complete;
      //     break;
      //   case 'cancel':
      //     schedule['status'] = FilterStatus.cancel;
      //     break;
      //}
      return schedule['status'] == status;
    }).toList();
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    'Appointments Schedule',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Config.spacesmall,
                Stack(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //this is the filter tabs
                            for (FilterStatus filterStatus
                                in FilterStatus.values)
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (filterStatus ==
                                              FilterStatus.Upcoming) {
                                            status = FilterStatus.Upcoming;
                                            _alignment = Alignment.centerLeft;
                                          } else if (filterStatus ==
                                              FilterStatus.Complete) {
                                            status = FilterStatus.Complete;
                                            _alignment = Alignment.center;
                                          } else if (filterStatus ==
                                              FilterStatus.Cancel) {
                                            status = FilterStatus.Cancel;
                                            _alignment = Alignment.centerRight;
                                          }
                                        });
                                      },
                                      child: Center(
                                        child: Text(filterStatus.name),
                                      ))),
                          ],
                        )),
                    AnimatedAlign(
                      alignment: _alignment,
                      duration: Duration(milliseconds: 300),
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                          status.name,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
                Config.spacesmall,
                Expanded(
                    child: ListView.builder(
                        itemCount: filteredSchedules.length,
                        itemBuilder: (context, index) {
                          var schedule = filteredSchedules[index];
                          bool isLastElement =
                              filteredSchedules.length + 1 == index;
                          return Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.grey.shade400,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              margin: !isLastElement
                                  ? const EdgeInsets.only(bottom: 20)
                                  : EdgeInsets.zero,
                              child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Row(children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                schedule['doctor_profile']),
                                          ),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                schedule['doctor_name'],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                schedule['category'],
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          )
                                        ]),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Scheulde(),
                                        //secheules card
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: OutlinedButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.red,
                                                      ),
                                                    )),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                  child: OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue),
                                                onPressed: () {},
                                                child: Text(
                                                  'Reschedule',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                              ))
                                            ])
                                      ])));
                        }))
              ],
            )));
  }
}
