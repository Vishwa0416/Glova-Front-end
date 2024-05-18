import 'package:flutter/material.dart';

class ImageResult extends StatelessWidget {
  final String generatedText;

  const ImageResult({Key? key, required this.generatedText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4CACAF), // Modern color for the AppBar
        title: const Text("Image Result"),
      ),
      body: Container(
        color: Colors.white, // Simple background color
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              generatedText, // Display generated text here
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Modern text color
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
