import 'package:flutter/material.dart';

class TempCartPage extends StatelessWidget {
  const TempCartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/');
      },
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/cart.jpg"),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
