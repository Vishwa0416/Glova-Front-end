import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:Glova/screens/aboutdoctor.dart';
import 'package:Glova/screens/custom_bottom_navigation_bar.dart';

class Ambulance extends StatelessWidget {
  const Ambulance({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                          builder: (context) => const AboutDoctor(),
                        ),
                      );
                    },
                    child: const Image(
                      image: AssetImage('assets/back.png'),
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  const Text(
                    'Ambulance',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 40,
                  )
                ],
              ),
            ),
          ),
          const Positioned(
              top: 160,
              left: 68,
              child: Image(
                image: AssetImage('assets/1919new.png'),
              )),
          const Positioned(
              top: 475,
              left: 45,
              child: Text(
                'Call an emergency ambulance now',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
