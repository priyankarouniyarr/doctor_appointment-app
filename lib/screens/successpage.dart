import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Lottie.asset("assets/animation/done.json",
                    height: 100, width: 150),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  " Successfully Booked Appointment",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              //back to homepage
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 48),
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        Navigator.of(context).pushNamed('main');
                      }, //disable:false,
                      child: Text("Back to Home Page",
                          style: TextStyle(fontSize: 20, color: Colors.white))))
            ]),
      ),
    );
  }
}
