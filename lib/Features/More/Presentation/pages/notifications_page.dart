import 'package:flutter/material.dart';
import 'package:miswag/core/Widget/app_bar_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(pageNum: 3),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/notfications.jpg"))),
        ),
      ),
    );
  }
}
