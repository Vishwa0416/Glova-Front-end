import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Glova/screens/appointments.dart';
import 'package:Glova/screens/home.dart';
import 'package:Glova/screens/reviewdoctor.dart';

import 'custom_bottom_navigation_bar.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key? key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/profileback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            //Navigation Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavigationBar(),
            ),
            //Doctor photo
            const Positioned(
              top: 50,
              left: 150,
              child: Image(image: AssetImage('assets/smalldoc.png')),
            ),
            const Positioned(
              top: 170,
              left: 150,
              child: Text(
                'Dr. Marcus Holmes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            //Doctor Review
            Positioned(
              top: 190,
              left: 152,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Review(),
                    ),
                  );
                },
                child: const Text(
                  'Review this doctor',
                  style: TextStyle(color: Color.fromARGB(255, 14, 99, 236)),
                ),
              ),
            ),
            //Three Icons
            const Positioned(
              top: 220,
              left: 50,
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image(image: AssetImage('assets/patient.png')),
                      ),
                      Text(' 10000+\nPatients'),
                    ],
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image(image: AssetImage('assets/years.png')),
                      ),
                      Text('  10 Years+\n Experience'),
                    ],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image(image: AssetImage('assets/star.png')),
                      ),
                      Text('   4.5\nRating'),
                    ],
                  ),
                ],
              ),
            ),
            //About Doctor
            const Positioned(
              top: 290,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'About Doctor',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 310,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                    'Dr. Marcus Holmes is a top specialist at London Bridge \nHospital at London. He has achieved several awards and \nrecognition for his contribution in his own field.'),
              ),
            ),
            //Working Time
            const Positioned(
              top: 380,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Working Time',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 400,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Mon - Sat (08:30 AM - 09:00 PM)'),
              ),
            ),
            //Communication
            const Positioned(
              top: 425,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Communication',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 450,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 45, top: 10),
                    child: Image(
                      image: AssetImage('assets/message.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Messaging\nChat me up, share photos.'),
                  )
                ],
              ),
            ),
            const Positioned(
              top: 505,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 45, top: 10),
                    child: Image(
                      image: AssetImage('assets/call.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Audio Call\nCall your doctor directly.'),
                  )
                ],
              ),
            ),
            const Positioned(
              top: 560,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 45, top: 10),
                    child: Image(
                      image: AssetImage('assets/video.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Video Call\nSee your doctor live.'),
                  )
                ],
              ),
            ),
            //Book appointment
            Positioned(
              top: 615,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Appoinments(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: Image(
                    image: AssetImage('assets/appointment.png'),
                  ),
                ),
              ),
            ),
            //Back button
            Positioned(
              top: 35,
              left: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                child: Image(
                  image: AssetImage('assets/back.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
