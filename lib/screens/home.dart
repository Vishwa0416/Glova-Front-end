import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Glova/APIs/imageFilePicker.dart';
import 'package:Glova/screens/aboutdoctor.dart';
import 'custom_bottom_navigation_bar.dart';
import 'package:Glova/screens/ambulance.dart';

import '../APIs/doctorDetails.dart';
import '../APIs/userDetails.dart';
import 'doctorRecommendation.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? userName;
  String? doctorName;

  final ImageFilePicker imageFilePicker = ImageFilePicker();
  final http.Client client = http.Client();

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
    _fetchDoctorDetails();
  }

  Future<void> _fetchUserDetails() async {
    try {
      final Map<String, dynamic> data =
          await UserDataManager.fetchUserDetails();
      setState(() {
        userName = data['name'];
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _fetchDoctorDetails() async {
    try {
      final List<dynamic> data = await DoctorDataManager.fetchDoctorDetails();
      // Handle the list of doctors here
      // For example, you can extract the name of the first doctor:
      if (data.isNotEmpty) {
        setState(() {
          doctorName = data[0]['name'];
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Always return false to prevent going back
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(15), // Added 'const'
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Hello, ${userName ?? 'Guest'}',
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      width: 150,
                      child: Image(
                        image: AssetImage('assets/notification.png'),
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                    hintText: 'Search doctor, drugs, articles...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    children: [
                      Image(
                        image: AssetImage('assets/Doctor.png'),
                        height: 100,
                        width: 50,
                      ),
                      Text(
                        'Doctor',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Image(
                        image: AssetImage('assets/Pharmacy.png'),
                        height: 100,
                        width: 50,
                      ),
                      Text(
                        'Pharmacy',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Image(
                        image: AssetImage('assets/Hospital.png'),
                        height: 100,
                        width: 50,
                      ),
                      Text(
                        'Hospital',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Ambulance(),
                        ),
                      );
                    },
                    child: const Column(
                      children: [
                        Image(
                          image: AssetImage('assets/Ambulance.png'),
                          height: 100,
                          width: 50,
                        ),
                        Text(
                          'Ambulance',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 230,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/Learn_more.png'),
                    height: 200,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 420,
              left: 30,
              right: 0,
              child: Row(
                children: [
                  const Text(
                    'Top Doctors',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 180,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DoctorRecommendation()), // Corrected class name
                      );
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 24, 184, 149),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 480,
              left: 25,
              right: 150,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutDoctor(),
                              ),
                            );
                          },
                          child: const Image(
                            image: AssetImage('assets/Doctor1.png'),
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$doctorName',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Padding(
                          padding: EdgeInsets.only(top: 0, bottom: 5),
                          child: Text(
                            'Cardiologist',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                image: AssetImage('assets/Rating.png'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                image: AssetImage('assets/Location.png'),
                              ),
                            ),
                            Text(
                              '800m away',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}
