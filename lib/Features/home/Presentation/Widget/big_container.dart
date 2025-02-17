import 'package:flutter/material.dart';

class BigContainer extends StatelessWidget {
  final String imageUrl;

  const BigContainer({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          //! Route to search page
        },
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}
