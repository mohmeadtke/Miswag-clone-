import 'package:flutter/material.dart';

class Exxx extends StatelessWidget {
  const Exxx({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text(
          "like Beauty page But different text",
          style: TextStyle(fontSize: 40, color: Colors.red),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
