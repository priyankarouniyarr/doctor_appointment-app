import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/utils/text.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:doctor_appointment_app/components/login_form.dart';
import 'package:doctor_appointment_app/components/sociallogin_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    //build login text field
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text(
                AppText.enText['welcome_text']!,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Config.spacesmall,
              Text(
                AppText.enText['signIn _text']!,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Config.spacesmall,
              const LoginForm(),
              Config.spacesmall,
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(AppText.enText['forgot-password']!,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              //social media button
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Or",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ),
                  ),
                ],
              ),
              Config.spacesmall,
              Center(
                  child: Text(
                AppText.enText['social-login']!,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.normal),
              )),
              Config.spacesmall,
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SocialloginButton(social: 'google'),
                    SocialloginButton(social: 'facebook'),
                  ]),
              Config.spacesmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(AppText.enText['signup_text']!,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal)),
                  SizedBox(
                    width: 5,
                  ),
                  const Text('Sign Up',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                ],
              )
            ])),
      ),
    );
  }
}
