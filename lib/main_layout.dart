import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/screens/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctor_appointment_app/screens/appointment.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  //variable declartion
  int currentpage = 0;
  final PageController _page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            controller: _page,
            onPageChanged: ((value) {
              setState(() {
                //update page index when tab pressed/switch page
                currentpage = value;
              });
            }),
            children: <Widget>[
              HomePage(),
              Appointmentpage(),
            ]),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentpage,
            onTap: (page) {
              setState(() {
                currentpage = page;
                _page.animateToPage(page,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidCalendar),
                label: 'Appointments',
              )
            ]));
  }
}
//homepage and appointment page