import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctor_appointment_app/components/custom_appbar.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  //declartion
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime currentDay = DateTime.now();
  int? currentIndex;
  bool isweekend = false;
  bool dateSelected = false;
  bool timeselected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          appTitle: 'Appointment',
          icon: FaIcon(Icons.arrow_back_ios),
        ),
        body: CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //display the table of calendra here
              tablecalendra(),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Center(
                      child: Text(
                    'Select Consultation Time',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
            ],
          )),
          isweekend
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    alignment: Alignment.center,
                    child: Text(
                      'No appointment available on this day',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        //when selected,update current index and set time selected to true
                        setState(() {
                          currentIndex = index;
                          timeselected = true;
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: currentIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: currentIndex == index
                                ? Config.primarycolor
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 9 > 12 ? (index + 9 - 12) : index + 9 == 24 ? 12 : index + 9}:00 ${index + 9 >= 12 ? "PM" : "AM"}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  currentIndex == index ? Colors.white : null,
                            ),
                          )),
                    );
                  }, childCount: 11),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1.75)),
          //  Spacer(),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
              child: ElevatedButton(
                onPressed: (timeselected && dateSelected)
                    ? () {
                        Navigator.of(context).pushNamed('sucess_booking');
                      }
                    : null, // Disables the button if conditions are not met
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  backgroundColor: (timeselected && dateSelected)
                      ? Colors.blue
                      : Colors.white,
                ),
                child: Text(
                  'Book Appointment',
                  style: TextStyle(
                    color: Colors.black, // Ensures text is readable
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ]));
  }

//calendra table

  Widget tablecalendra() {
    return TableCalendar(
        focusedDay: focusedDay,
        firstDay: DateTime(2024, 11, 01),
        lastDay: DateTime(2030, 12, 31),
        calendarFormat: calendarFormat,
        currentDay: currentDay,
        rowHeight: 48,
        calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(
          color: Config.primarycolor,
          shape: BoxShape.circle,
        )),
        availableCalendarFormats: {
          CalendarFormat.month: 'Month',
        },
        onFormatChanged: (format) {
          setState(() {
            calendarFormat = format;
          });
        },
        onDaySelected: ((selectedDay, focusedDay) {
          setState(() {
            currentDay = selectedDay;
            focusedDay = focusedDay;
            dateSelected = true;
            //check ing weekend is selected
            if (selectedDay.weekday == 6) {
              isweekend = true;
              timeselected = false;
              currentIndex = null;
              print('selected day $selectedDay');
            } else {
              isweekend = false;
            }
          });
        }));
  }
}
