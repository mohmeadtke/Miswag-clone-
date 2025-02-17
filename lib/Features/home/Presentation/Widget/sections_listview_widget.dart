import 'package:flutter/material.dart';

class SectionsListviewWidget extends StatelessWidget {
  const SectionsListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Set an appropriate height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              if (index <= 9) con(index + 1),
              con(index + 11),
            ],
          );
        },
      ),
    );
  }

  Container con(int index) {
    if (index == 20) {
      return Container();
    } else {
      return Container(
        height: 70,
        width: 70,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Item $index',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    }
  }
}
