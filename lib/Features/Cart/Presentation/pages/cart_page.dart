import 'package:flutter/material.dart';
import 'package:miswag/core/Widget/app_bar_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(pageNum: 2),
      backgroundColor: Colors.white,
      body: GestureDetector(
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
      ),
    );
  }
}
