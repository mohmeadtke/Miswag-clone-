import 'package:flutter/material.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';

class BottomHalfWidget extends StatelessWidget {
  const BottomHalfWidget({super.key, required MainPageEntity this.product});
  final MainPageEntity product;
  String getFirst25Characters(String input) {
    if (input.length == 25) {
      return input;
    } else {
      return "${input.substring(0, 25)}...";
    }
  }

  @override
  Widget build(BuildContext context) {
    return // Bottom Half: Product Details
        Padding(
      padding: const EdgeInsets.all(4.0), // Reduced padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(children: [
            TextSpan(
              text: '${product.name}  ',
              style: const TextStyle(
                fontSize: 10, // Smaller font size
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: getFirst25Characters(product.description),
              style: const TextStyle(
                fontSize: 9, // Smaller font size
                color: Colors.black,
              ),
            ),
          ])),
          const SizedBox(height: 2), // Reduced spacing
          // Price and Discounted Price
          if (product.price == product.priceAfterDiscount)
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "${product.price} IQD",
                style: const TextStyle(
                  fontSize: 12, // Smaller font size
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          // Show only price if no discount

          else
            // Show both prices if there's a discount
            Column(
              children: [
                Text(
                  "${product.price} IQD",
                  style: TextStyle(
                    fontSize: 10, // Smaller font size
                    color: Colors.grey[600],
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  "${product.priceAfterDiscount} IQD",
                  style: const TextStyle(
                    fontSize: 12, // Smaller font size
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
