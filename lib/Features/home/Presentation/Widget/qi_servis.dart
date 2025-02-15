import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeeplinkButton extends StatelessWidget {
  final String playStoreUrl =
      'https://play.google.com/store/apps/details?id=tech.enjaz.qicardservices&hl=ar';

  Future<void> _launchURL() async {
    final Uri uri =
        Uri.parse(playStoreUrl); // Convert the URL string to a Uri object
    if (await canLaunchUrl(uri)) {
      // Check if the URL can be launched
      await launchUrl(uri); // Launch the URL
    } else {
      throw 'Could not launch $playStoreUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _launchURL,
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                height: 40, // Set your desired height
                decoration: BoxDecoration(
                  color: Colors.blue, // Background color of the container
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  image: const DecorationImage(
                    image:
                        AssetImage('assets/image/qi.png'), // Path to your image
                    fit: BoxFit.cover, // Adjust the image fit
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ));
  }
}
