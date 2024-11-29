import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/utils/config.dart';

class Doctorscard extends StatelessWidget {
  const Doctorscard({super.key, required this.route});
  final String route;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 150,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(route);
          },
          //redirect to doctor details
          child: Card(
            elevation: 5,
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: Config.widthSize * 0.33,
                  child: Image.asset('assets/doctor.jpg', fit: BoxFit.cover),
                ),
                const Flexible(
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Dr. Ram Narayan Shah',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text('Cardiology',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                            Spacer(),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.star_border,
                                      color: Colors.yellow, size: 16),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Text('4.5',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Text(' Reviews',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Text(
                                    '(20)',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 7,
                                  )
                                ])
                          ],
                        )))
              ],
            ),
          ),
        ));
  }
}
