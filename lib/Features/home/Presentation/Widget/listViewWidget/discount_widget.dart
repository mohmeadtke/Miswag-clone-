import 'package:flutter/material.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';

class DiscountWidget extends StatelessWidget {
  final MainPageEntity product;

  const DiscountWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double discountPercentage = 0;

    if (product.price != product.priceAfterDiscount) {
      discountPercentage =
          ((product.price - product.priceAfterDiscount) / product.price) * 100;
    }

    return discountPercentage > 0
        ? Positioned(
            top: 4, // Adjusted position
            left: 4, // Adjusted position
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6, // Reduced padding
                vertical: 2, // Reduced padding
              ),
              decoration: BoxDecoration(
                color: Colors.red, // Red background
                borderRadius: BorderRadius.circular(8), // Smaller border radius
              ),
              child: Text(
                "${discountPercentage.toStringAsFixed(0)}% off", // Display discount percentage
                style: const TextStyle(
                  fontSize: 10, // Smaller font size
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
