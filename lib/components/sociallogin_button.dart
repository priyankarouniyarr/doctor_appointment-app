import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/utils/config.dart';

class SocialloginButton extends StatelessWidget {
  const SocialloginButton({super.key, required this.social});
  final String social;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.black, width: 1),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: () {},
        child: SizedBox(
            width: Config.widthSize! * 0.4,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(
                    'assets/$social.png',
                    height: 40,
                    width: 40,
                  ),
                  Text(
                    social.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ])));
  }
}
