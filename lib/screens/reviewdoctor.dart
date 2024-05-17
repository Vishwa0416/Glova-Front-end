import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:Glova/screens/aboutdoctor.dart';
import 'package:Glova/screens/custom_bottom_navigation_bar.dart';

class Review extends StatelessWidget {
  const Review({Key? key});

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
            child: Stack(children: [
              //Navigation bar
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomBottomNavigationBar(),
              ),
              //small doc image
              const Positioned(
                top: 30,
                left: 150,
                child: Image(image: AssetImage('assets/smalldoc.png')),
              ),
              const Positioned(
                top: 140,
                left: 140,
                child: Text(
                  'Dr. Marcus Holmes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              //text 1
              const Positioned(
                  top: 160,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'How likely you recommend Dr. Marcus?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              //review stars
              const Positioned(
                  top: 190,
                  left: 85,
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/goldstar.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Image(
                          image: AssetImage('assets/goldstar.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Image(
                          image: AssetImage('assets/goldstar.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Image(
                          image: AssetImage('assets/goldstar.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Image(
                          image: AssetImage('assets/goldstar.png'),
                        ),
                      )
                    ],
                  )),
              //title
              const Positioned(
                  top: 210,
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Review Title',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),

              Positioned(
                top: 240,
                left: 10,
                right: 10,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your title',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 173, 170, 170)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              //tell more
              const Positioned(
                  top: 300,
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Tell us more about your visit',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),
              //how's the visit
              Positioned(
                top: 330,
                left: 10,
                right: 10,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'What stood out in your visit?',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 173, 170, 170)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              //medassist?
              const Positioned(
                  top: 390,
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Was this a Glova appointment?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),
              const Positioned(
                top: 420,
                left: 75,
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/yes.png'),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Image(
                      image: AssetImage('assets/no.png'),
                    ),
                  ],
                ),
              ),
              //email
              const Positioned(
                  top: 455,
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'E-mail',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),

              Positioned(
                top: 490,
                left: 10,
                right: 10,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your E-mail',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 173, 170, 170)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              //bottom text
              const Positioned(
                  top: 555,
                  left: 60,
                  child: Text(
                    '(Your email is for confirm your review, will NOT appear on the review)',
                    style: TextStyle(fontSize: 10),
                  )),
              //tick
              const Positioned(
                  top: 575,
                  left: 10,
                  child: Row(children: [
                    Image(
                      image: AssetImage('assets/tick.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 10),
                      child: Text(
                        'I verify that I or my family member have received treatment from this doctor \nand agree to the MedAssist User Agreement, Editorial Policy and privacy\npolicy.',
                        style: TextStyle(fontSize: 10),
                      ),
                    )
                  ])),
              //save and submit
              const Positioned(
                  top: 630,
                  left: 115,
                  child: Image(
                    image: AssetImage('assets/saveandsubmit.png'),
                  )),
              //back button
              Positioned(
                top: 35,
                left: 15,
                child: GestureDetector(
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
                  ),
                ),
              ),
            ])));
  }
}
