import 'package:flutter/material.dart';
import 'package:Glova/screens/aboutdoctor.dart';
import 'package:Glova/screens/home.dart';
import 'package:Glova/screens/custom_bottom_navigation_bar.dart';

class AppDet extends StatelessWidget {
  const AppDet({Key? key}) : super(key: key);

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
                //back bitton
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
                  width: 40,
                ),
                //market text
                const Text(
                  'Appointment Details',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          //search bar

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
