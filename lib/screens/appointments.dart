import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:Glova/screens/aboutdoctor.dart';
import 'package:Glova/screens/custom_bottom_navigation_bar.dart';

class Appoinments extends StatelessWidget {
  const Appoinments({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //Background
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/appoinmentback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            //Navigation bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavigationBar(),
            ),
            //New appointment
            Positioned(
              top: 10,
              right: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutDoctor(),
                          ),
                        );
                      },
                      child: const Image(
                        image: AssetImage('assets/back.png'),
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    const Text(
                      'New Appointment',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            //Date
            const Positioned(
                top: 70,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('July, 2020'),
                      SizedBox(
                        width: 10,
                      ),
                      Image(image: AssetImage('assets/downarrow.png'))
                    ],
                  ),
                )),
            const Positioned(
                //days images
                top: 100,
                left: 15,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/day1.png'),
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/day2.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/day3.png'),
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/day4.png'),
                    )
                  ],
                )),
            const Positioned(
                //available time
                top: 195,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Available Time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
            const Positioned(
                top: 220,
                left: 30,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/9am.png'),
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/930am.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/10am.png'),
                      ),
                    )
                  ],
                )),
            const Positioned(
                //patient details
                top: 265,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Patient Details',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
            const Positioned(
                //full name
                top: 285,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Full Name'),
                )),

            Positioned(
              top: 315,
              left: 10,
              right: 10,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your full name',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 173, 170, 170)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            //Age
            const Positioned(
                top: 370,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Age'),
                )),

            Positioned(
              top: 400,
              left: 10,
              right: 10,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your age',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 173, 170, 170)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            const Positioned(
                //gender
                top: 460,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Gender'),
                )),

            const Positioned(
              top: 485,
              left: 75,
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/male.png'),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Image(
                    image: AssetImage('assets/female.png'),
                  ),
                ],
              ),
            ),

            const Positioned(
                //problem
                top: 515,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Problem'),
                )),

            Positioned(
              top: 545,
              left: 10,
              right: 10,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Write your problem in detail',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 173, 170, 170)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const Positioned(
              //book appoinment
              top: 640,
              left: 15,
              child: Image(
                image: AssetImage('assets/appointment.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
