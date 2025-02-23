import 'package:flutter/material.dart';

class Backgrond extends StatelessWidget {
  const Backgrond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: Image.asset(
          //     "assets/images/hands.webp",
          //     fit: BoxFit.cover,
          //   ),
          // ),

          // The background filter with animation
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
