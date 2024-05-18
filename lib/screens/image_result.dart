import 'package:flutter/material.dart';

class ImageResult extends StatelessWidget {
  final String generatedText;

  const ImageResult({Key? key, required this.generatedText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 216, 230),
        title: const Text("Image Result"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              generatedText,
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
