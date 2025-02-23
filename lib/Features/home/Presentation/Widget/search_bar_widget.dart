import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return // Search bar
        Container(
      height: 45,
      width: double.infinity,
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/SerchPage');
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300], // Set background color to gray
              borderRadius: BorderRadius.circular(15.0), // Rounded corners
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.black), // Search icon
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    enabled: false, // Disable editing
                    decoration: InputDecoration(
                      hintText: "I'm looking for...", // Placeholder text
                      border: InputBorder.none, // Remove borders
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
