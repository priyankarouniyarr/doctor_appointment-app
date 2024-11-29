import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/utils/config.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key,
      required this.width,
      required this.title,
      required this.disable,
      required this.onpressed});

  final double width;
  final String title;
  final bool disable;
  final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Config.primarycolor,
                foregroundColor: Colors.white),
            onPressed: disable ? null : onpressed,
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )));
  }
}
