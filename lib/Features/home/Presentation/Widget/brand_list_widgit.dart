import 'package:flutter/material.dart';

class BrandListWidgit extends StatelessWidget {
  const BrandListWidgit({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110, // Set height for the horizontal list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 19, // Number of items
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //! rot to each brand
            },
            child: Container(
              width: 100,
              margin: const EdgeInsets.only(left: 5, bottom: 8),
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/image/mis.jpg")),
                // color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        },
      ),
    );
  }
}
