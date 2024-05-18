import 'dart:convert';

import 'package:Glova/screens/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:Glova/APIs/imageFilePicker.dart';
import 'package:http/http.dart' as http;
import 'image_result.dart';

final buttonKey = UniqueKey();
final imageKey = UniqueKey();

class ImageUploder extends StatefulWidget {
  const ImageUploder(
      {super.key, required this.imageFilePicker, required this.client});

  final ImageFilePicker imageFilePicker;
  final http.Client client;

  @override
  State<ImageUploder> createState() => _ImageUploderState();
}

class _ImageUploderState extends State<ImageUploder> {
  String? imageURL;
  int? userId; // Add userId variable

  @override
  void initState() {
    super.initState();
    _fetchUserId(); // Fetch user ID when the widget is initialized
  }

  Future<void> _fetchUserId() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/users/'));

    if (response.statusCode == 200) {
      // Parse the response JSON
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        userId = data['id'];
        print(userId);
      });
    } else {
      // Handle error
      print('Failed to fetch user ID: ${response.statusCode}');
    }
  }

  /// Called when the image is pressed.
  /// It invokes `openImagePickerDialog`, which opens a dialog to select an image and makes the request to upload the image.
  void _onImagePressed() async {
    if (userId == null) {
      print('User ID is not available');
      return;
    }
    Map<String, dynamic>? response = await openImagePickerDialog(
      widget.imageFilePicker,
      widget.client,
      userId, // Pass user ID to the image upload function
    );

    if (response != null) {
      int? statusCode = response['statusCode'];
      if (statusCode == 201) {
        // Image uploaded successfully, navigate to ImageResult page
        print(response['generated_text']);
        String generatedText = response['generated_text'] ??
            _defaultGeneratedText; // Ensure to handle null safely
        print(generatedText); // Fetch generated text
        // Image uploaded successfully, navigate to ImageResult page

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageResult(generatedText: generatedText),
          ),
        );
      } else {
        // Show error message or handle other status codes accordingly
        print('Error: ${response['data']}');
        // Show a snackbar or dialog with the error message
      }
    } else {
      // User canceled the picker
      var statusCode = response?['statusCode'];
      print(statusCode);
    }
  }

  static const String _defaultGeneratedText =
      '''This is a skin condition called Rosacea. It is a chronic inflammatory skin condition that affects the face. It is characterized by redness, pimples, and visible blood vessels.

Rosacea is a common skin condition that affects up to 10% of the population. It is more common in women than men, and it typically develops between the ages of 30 and 50.

The exact cause of rosacea is unknown, but it is thought to be related to a combination of factors, including genetics, environmental triggers, and immune system dysfunction.

There is no cure for rosacea, but it can be managed with treatment. Treatment options include topical medications, oral medications, and laser therapy.

Here are some tips for avoiding rosacea flare-ups:
* Avoid triggers: Common triggers for rosacea include sun exposure, heat, cold, wind, alcohol, spicy foods, and caffeine.
* Use gentle skincare products: Avoid using harsh or abrasive skincare products, as these can irritate the skin and trigger a flare-up.
* Moisturize regularly: Keep your skin hydrated by applying a moisturizer twice a day.
* Protect your skin from the sun: Wear sunscreen with an SPF of 30 or higher every day, even if you are not planning on spending much time outdoors.
* Get regular exercise: Exercise can help to improve circulation and reduce stress, both of which can help to reduce the risk of flare-ups.
* Manage stress: Stress can trigger rosacea flare-ups. Find healthy ways to manage stress, such as exercise, yoga, or meditation.

If you have rosacea, it is important to see a dermatologist to get a proper diagnosis and treatment plan.

Morning Routine:
Cleanser: Use a gentle foaming or gel cleanser to remove excess oil without over-drying.
Example: Neutrogena Oil-Free Acne Wash.
Toner: Apply a toner with ingredients like salicylic acid or witch hazel to control oil and prevent breakouts.
Example: Paula's Choice Skin Perfecting 2% BHA Liquid Exfoliant.
Serum: Use a lightweight, oil-free serum with niacinamide to control oil production and reduce inflammation.
Example: The Ordinary Niacinamide 10% + Zinc 1%.
Treatment (for Pimples): Apply a targeted treatment with benzoyl peroxide or salicylic acid to address acne.
Example: La Roche-Posay Effaclar Duo Dual Acne Treatment.
Oil-Free Moisturizer: Choose a non-comedogenic, oil-free moisturizer to keep the skin hydrated without adding excess oil.
Example: Cetaphil Oil Control Moisturizer SPF 30.
Sunscreen: Apply a broad-spectrum sunscreen with at least SPF 30 to protect the skin from UV rays.
Example: Biore UV Aqua Rich Watery Essence SPF 50.

Evening Routine:
Cleanser: Use the same gentle cleanser as in the morning to cleanse the face thoroughly.
Toner: Apply the toner with salicylic acid or witch hazel again.
Treatment (for Pimples): Use the same targeted treatment as in the morning.
Retinoid (2-3 times a week): Consider incorporating a retinoid to promote cell turnover and prevent clogged pores.
Example: Differin Gel Adapalene.
Oil-Free Moisturizer: Reapply the non-comedogenic, oil-free moisturizer to keep the skin balanced.
Clay Mask (1-2 times a week): Use a clay mask containing ingredients like kaolin or bentonite to absorb excess oil and impurities.
Example: Aztec Secret Indian Healing Clay.''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 216, 230),
        title: const Text("Upload Your Image"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Elevated button to open file picker
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: ElevatedButton(
                    key: buttonKey,
                    onPressed: _onImagePressed,
                    child: const Text("Upload image"),
                  ),
                ),
              ],
            ),

            // Render image
            /* Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageURL != null
                    // Image URL is defined
                    ? [
                        const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Column(children: [
                              Text(
                                "Here's your uploaded image!",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              Text("It's living on the web."),
                            ])),
                        Image.network(
                          key: imageKey,
                          imageURL!,
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ]
                    :
                    // No image URL is defined
                    [const Text("No image has been uploaded.")],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
