import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/main_layout.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:doctor_appointment_app/screens/auth_page.dart';
import 'package:doctor_appointment_app/screens/successpage.dart';
import 'package:doctor_appointment_app/screens/booking_page.dart';
import 'package:doctor_appointment_app/screens/doctorsscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//this is for push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //define the themedata  here
      debugShowCheckedModeBanner: false,
      title: 'Flutter Doctor App',
      theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            focusColor: Config.primarycolor,
            border: Config.outlinedBorder,
            enabledBorder: Config.outlinedBorder,
            focusedBorder: Config.focusBorder,
            errorBorder: Config.errorBorder,
            floatingLabelStyle: TextStyle(color: Config.primarycolor),
            prefixIconColor: Colors.black38,
          ),
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Config.primarycolor,
            selectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey.shade700,
            elevation: 10,
            type: BottomNavigationBarType.fixed,
          )),
      initialRoute: '/',
      routes: {
        //this is inital route of the app which is auth oage(login and sign up)
        '/': (context) => const AuthPage(),
        //this is for main layout after login
        'main': (context) => const MainLayout(),

        'doctor_details': (context) => Doctorsscreen(),
        'bookingpage': (context) => BookingPage(),
        "sucess_booking": (context) => BookAppointment()
      },
    );
  }
}
