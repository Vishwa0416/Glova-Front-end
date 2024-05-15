import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:Glova/screens/home.dart';
import 'package:Glova/screens/signUpPage.dart';
import 'package:Glova/screens/myappointments.dart';

import 'package:Glova/screens/custom_bottom_navigation_bar.dart';

import 'package:http/http.dart' as http;

import '../APIs/userDetails.dart';
import 'home.dart';
import 'medassistai.dart';
import 'signUpPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  String? userName;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    try {
      final Map<String, dynamic> data =
          await UserDataManager.fetchUserDetails();
      setState(() {
        userName = data['name'];
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  Future<void> _handleLogout(BuildContext context) async {
    // Your backend logout URL
    const String logoutUrl = 'http://10.0.2.2:8000/log-out/';

    try {
      // Make POST request to logout URL
      final response = await http.post(Uri.parse(logoutUrl));

      // Check if request was successful
      if (response.statusCode == 200) {
        // Parse the response message
        final responseData = jsonDecode(response.body);
        final message = responseData['success'];

        // Show the response message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
        ));

        // Navigate back to the sign-up page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUp_Page(),
          ),
        );
      } else {
        // Show error message if request fails
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to logout. Please try again.'),
        ));
      }
    } catch (e) {
      print(e);
      // Show error message if an exception occurs
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An error occurred: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //wallpaper
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
            //girl photo and name
            const Positioned(
              top: 80,
              left: 150,
              child: Image(image: AssetImage('assets/profilegirl.png')),
            ),
            Positioned(
              top: 170,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    userName ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            //icons
            const Positioned(
              top: 200,
              left: 50,
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image(image: AssetImage('assets/Heartbeat.png')),
                      ),
                      Text('Heart Rate\n   215bpm'),
                    ],
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image(image: AssetImage('assets/Fire.png')),
                      ),
                      Text('Calories\n  756cal'),
                    ],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image(image: AssetImage('assets/Barbell.png')),
                      ),
                      Text('Weight\n103lbs'),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Column(
                children: [
                  //Mysaved part
                  const Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Image(
                        image: AssetImage('assets/Heart.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'My Saved',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Image(
                        image: AssetImage('assets/Arrow.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //Appointment part
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyAppo(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Image(
                          image: AssetImage('assets/Appointments.png'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Appointments',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 120,
                        ),
                        Image(
                          image: AssetImage('assets/Arrow.png'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //Payment method
                  const Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Image(
                        image: AssetImage('assets/Payment.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Payment Method',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Image(
                        image: AssetImage('assets/Arrow.png'),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //FAQs
                  const Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Image(
                        image: AssetImage('assets/Faqs.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'FAQs',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 175,
                      ),
                      Image(
                        image: AssetImage('assets/Arrow.png'),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //LogOut
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          _handleLogout(context);
                        },
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage('assets/Logout.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: Color.fromARGB(255, 251, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 165,
                            ),
                            Image(
                              image: AssetImage('assets/Arrow.png'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //back button
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
