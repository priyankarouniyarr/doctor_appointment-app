import 'package:flutter/material.dart';

class Scheulde extends StatefulWidget {
  const Scheulde({super.key});

  @override
  State<Scheulde> createState() => _ScheuldeState();
}

class _ScheuldeState extends State<Scheulde> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: Colors.blue,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Monday, 28/11/2024',
            style: TextStyle(color: Colors.blueGrey, fontSize: 15),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.blueGrey,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text('2:00 PM', style: TextStyle(color: Colors.blueGrey)))
        ],
      ),
    );
  }
}
