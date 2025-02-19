import 'package:flutter/material.dart';

class ListOfWidgit extends StatelessWidget {
  const ListOfWidgit({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                      image: AssetImage("assets/image/discount.png")),
                ),
              ),
              const Center(child: Text(" dataaaaj")),
            ],
          );
        },
      ),
    );
  }
}
