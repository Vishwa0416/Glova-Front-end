import 'package:flutter/material.dart';
import 'package:Glova/screens/profilepage.dart';
import 'package:Glova/screens/custom_bottom_navigation_bar.dart';

class Pay extends StatelessWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/profile2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 25,
              left: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                    child: const Image(
                      image: AssetImage('assets/back.png'),
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  // Payment Method text
                  const Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 100,
              left: 120,
              child: Column(
                children: [
                  Text(
                    'Rs. 16200/=',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 255, 50, 43),
                    ),
                  ),
                  Text(
                    'Goods and Services',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Ref.458962155654833541',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 260,
              left: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 2,
                    color: Colors.black,
                  ),
                  const Text(
                    '  Pay with  ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 2,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 300,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('How would you like to pay?'),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image(image: AssetImage('assets/RememberMe.png')),
                      SizedBox(width: 10),
                      Text('  Credit or Debit card'),
                      SizedBox(width: 10),
                      Image(
                        image: AssetImage('assets/visa.png'),
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Image(
                        image: AssetImage('assets/master.png'),
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image(image: AssetImage('assets/RememberMe.png')),
                      SizedBox(width: 10),
                      Text('  Pay by Bank'),
                    ],
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 425,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Bank'),
                  SizedBox(height: 10),
                  Stack(
                    children: [
                      Image(
                        image: AssetImage('assets/bankback.png'),
                      ),
                      Positioned(
                        top: 15,
                        left: 290,
                        child: Image(image: AssetImage('assets/downarr.png')),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Text(
                            'Union Bank',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 515,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Account Type'),
                  SizedBox(height: 10),
                  Stack(
                    children: [
                      Image(
                        image: AssetImage('assets/bankback.png'),
                      ),
                      Positioned(
                        top: 20,
                        left: 30,
                        child: Image(image: AssetImage('assets/tick.png')),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Text(
                            'Personal',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 610,
              left: 20,
              child: Stack(
                children: [
                  Image(image: AssetImage('assets/bankback.png')),
                  Positioned(
                    top: 20,
                    left: 30,
                    child: Image(image: AssetImage('assets/tick.png')),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        'Business',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Positioned(
                top: 665,
                left: 15,
                child: Image(
                  image: AssetImage('assets/select.png'),
                )),
            // Navigation Bar
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
