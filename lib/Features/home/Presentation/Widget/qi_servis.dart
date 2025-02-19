import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeeplinkButton extends StatelessWidget {
  final String playStoreUrl =
      'https://play.google.com/store/apps/details?id=tech.enjaz.qicardservices&hl=ar';

  const DeeplinkButton({super.key});

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
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          image: const DecorationImage(
            image: AssetImage('assets/image/qi.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
