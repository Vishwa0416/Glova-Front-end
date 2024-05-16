import 'package:flutter/material.dart';
import 'package:Glova/screens/home.dart';
import 'package:Glova/screens/custom_bottom_navigation_bar.dart';
import 'package:Glova/screens/doctorcards.dart'; // Import your Test widget

class DoctorRecommendation extends StatefulWidget {
  const DoctorRecommendation({Key? key}) : super(key: key);

  @override
  _DoctorRecommendationState createState() => _DoctorRecommendationState();
}

class _DoctorRecommendationState extends State<DoctorRecommendation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 25, right: 85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //back button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
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
                  //doctors
                  const Text(
                    'Doctors',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          //search box
          Positioned(
            top: 80,
            left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 189, 189, 189)
                        .withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 25,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for doctors...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          // Dynamic Doctor Cards
          const Positioned(
            top: 180,
            left: 25,
            right: 25,
            bottom: 80,
            child: DoctorCard(), // Replace static doctors with dynamic cards
          ),
          //Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(),
          )
        ],
      ),
    );
  }
}
