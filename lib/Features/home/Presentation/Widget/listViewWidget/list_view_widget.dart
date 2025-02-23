import 'package:flutter/material.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';
import 'bottom_half_widget.dart';
import 'discount_widget.dart';
import 'like_buttom_widget.dart';
import 'list_button_widget.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key, required this.data});
  final List data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Reduced height for the horizontal ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Make it scroll horizontally
        primary: false,
        itemCount: 10,
        itemBuilder: (context, index) {
          MainPageEntity product = data[index];

          // Calculate discount percentage

          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Card(
              elevation: 2,
              color: Colors.white, // Set card background to white
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Slightly smaller border radius
              ),
              child: SizedBox(
                height: 70, // Reduced height for the entire card
                width: 120, // Reduced width for each card
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // Prevent stretching to fill space
                  children: [
                    // Top Half: Image with Discount Percentage
                    Stack(
                      children: [
                        Container(
                          height: 100, // Reduced height for the image
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(product.image)
                                // NetworkImage(
                                //     product.image) // Placeholder image
                                ),
                          ),
                        ),
                        DiscountWidget(product: product),
                        ListButtonWidget(product: product),
                        LikeButtonWidget(product: product)
                      ],
                    ),
                    BottomHalfWidget(product: product),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
