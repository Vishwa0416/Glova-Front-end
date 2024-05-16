import 'package:flutter/material.dart';
import 'package:Glova/screens/home.dart';

class MedAssistAi extends StatelessWidget {
  const MedAssistAi({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 25,
            child: Row(
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
                  child: const Padding(
                    padding: EdgeInsets.only(top: 30, left: 20),
                    child: Image(
                      image: AssetImage('assets/back.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                //medassist ai
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Glova AI',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Image(image: AssetImage('assets/threedots.png')),
                )
              ],
            ),
          ),
          const Positioned(
            top: 150,
            left: 70,
            child: Column(
              children: [
                //skin image
                Image(image: AssetImage('assets/skin.png')),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    //text
                    "We've analyzed your unique skin profile \nusing advanced AI algorithms and facial \nrecognition technology. Based on our \nassessment, we're thrilled to present your \npersonalized skincare routine tailored \njust for you!",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 470,
            left: 140,
            child: Image(image: AssetImage('assets/morning.png')),
          ),
          const Positioned(
            top: 550,
            left: 20,
            child: Text(
              '1. Gentle Cleanser: Start your day with Glovas\n hydrating cleanser to cleanse and refresh your skin \n without stripping away natural oils.',
              textAlign: TextAlign.start,
            ),
          ),
          const Positioned(
            top: 610,
            left: 20,
            child: Text(
              '2. Vitamin C Serum: Apply a few drops of [Brand Name]s\n Vitamin C serum. It helps brighten your complexion,\n reduce dark spots, and protect your skin from\n environmental stressors.',
              textAlign: TextAlign.start,
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: Image(
              image: AssetImage('assets/Bottom_rectangle.png'),
            ),
          ),
          //add image
          const Positioned(
            bottom: 25,
            left: 20,
            child: Image(image: AssetImage('assets/Add.png')),
          ),
          //chat box
          Positioned(
            bottom: 10,
            left: 70,
            right: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Start typing here to chat...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          //send image
          const Positioned(
            bottom: 30,
            left: 300,
            child: Image(
              image: AssetImage('assets/Send.png'),
            ),
          )
        ],
      ),
    );
  }
}
