import 'package:flutter/material.dart';
import 'package:Glova/screens/appointmentdetails.dart';
import 'package:Glova/screens/profilepage.dart';
import 'package:Glova/screens/custom_bottom_navigation_bar.dart';

class MyAppo extends StatelessWidget {
  const MyAppo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 25,
          left: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //back button
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
                child: const Image(
                  image: AssetImage('assets/back.png'),
                  height: 50,
                ),
              ),
              const SizedBox(
                width: 60,
              ),
              //market text
              const Text(
                'Appointments',
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        //search bar
        Positioned(
          top: 80,
          left: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 189, 189, 189).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 25,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for appointments...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ),
        //product
        Positioned(
          top: 180,
          left: 25,
          right: 150,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AppDet(), // Corrected class name
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    children: [
                      Image(
                        image: AssetImage('assets/Doctor1.png'),
                        height: 120,
                        width: 130,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Dr. Marcus Holmes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 5),
                        child: Text(
                          'Viralogist',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Row(
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
                          Text(
                            '2024/07/07',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //Navigation Bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomBottomNavigationBar(),
        )
      ],
    ));
  }
}
