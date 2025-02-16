import 'package:flutter/material.dart';
import 'package:miswag/Features/home/Presentation/Widget/app_bar_widget.dart';
import 'package:miswag/Features/home/Presentation/Widget/list_view_widget.dart';
import 'package:miswag/Features/home/Presentation/Widget/qi_servis.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> widgetList = [
    DeeplinkButton(),
    const ListViewWidget(),
    DeeplinkButton(),
    const ListViewWidget(),
    DeeplinkButton(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          // Search bar
          Container(
            height: 45,
            width: 380,
            color: Colors.white,
            child: GestureDetector(
              onTap: () {
                // Handle search action here
              },
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
          const SizedBox(height: 20), // Spacer
          // Main content
          Expanded(
            child: ListView.builder(
              itemCount: widgetList.length,
              itemBuilder: (context, index) {
                return widgetList[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
