import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';
import 'package:miswag/Features/home/Presentation/Widget/see_more_widget.dart';
import 'package:miswag/Features/home/Presentation/state_mangment/bloc/main_page_bloc.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SeeMoreWidget(text: text),
        BlocBuilder<MainPageBloc, MainPageState>(
          builder: (context, state) {
            if (state is LodingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SuccessState) {
              final data = state.mainPageEntity;

              return SizedBox(
                height: 200, // Reduced height for the horizontal ListView
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, // Make it scroll horizontally
                  primary: false,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    MainPageEntity product = data[index];

                    // Calculate discount percentage
                    double discountPercentage = 0;
                    if (product.price != product.priceAfterDiscount) {
                      discountPercentage =
                          ((product.price - product.priceAfterDiscount) /
                                  product.price) *
                              100;
                    }
                    String getFirst25Characters(String input) {
                      if (input.length == 25) {
                        return input;
                      } else {
                        return "${input.substring(0, 25)}...";
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Card(
                        elevation: 2,
                        color: Colors.white, // Set card background to white
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12), // Slightly smaller border radius
                        ),
                        child: SizedBox(
                          height: 70, // Reduced height for the entire card
                          width: 120, // Reduced width for each card
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Prevent stretching to fill space
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
                                          image: AssetImage(product.image)
                                          // NetworkImage(
                                          //     product.image) // Placeholder image
                                          ),
                                    ),
                                  ),
                                  // Discount Percentage Badge
                                  if (discountPercentage > 0)
                                    Positioned(
                                      top: 4, // Adjusted position
                                      left: 4, // Adjusted position
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6, // Reduced padding
                                          vertical: 2, // Reduced padding
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red, // Red background
                                          borderRadius: BorderRadius.circular(
                                              8), // Smaller border radius
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
                                    ),
                                  // Button on Bottom Left
                                  Positioned(
                                    bottom: 4, // Adjusted position
                                    left: 4, // Adjusted position
                                    child: InkWell(
                                      onTap: () {
                                        //! add to cart
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        padding: const EdgeInsets.all(
                                            4), // Add some padding around the image
                                        decoration: BoxDecoration(
                                          color:
                                              Colors.white, // White background
                                          borderRadius: BorderRadius.circular(
                                              40), // Optional: Rounded corners
                                        ),
                                        child: Image.asset(
                                          fit: BoxFit.fill,
                                          'assets/image/cart.png', // Replace with your image path
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Button on Bottom Right
                                  Positioned(
                                    bottom: 4, // Adjusted position
                                    right: 4, // Adjusted position
                                    child: InkWell(
                                      onTap: () {
                                        //! add to faiverot
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        padding: const EdgeInsets.all(
                                            4), // Add some padding around the image
                                        decoration: BoxDecoration(
                                          color:
                                              Colors.white, // White background
                                          borderRadius: BorderRadius.circular(
                                              40), // Optional: Rounded corners
                                        ),
                                        child: Image.asset(
                                          fit: BoxFit.fill,
                                          'assets/image/heart.png', // Replace with your image path
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Bottom Half: Product Details
                              Padding(
                                padding: const EdgeInsets.all(
                                    4.0), // Reduced padding
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
                                        text: getFirst25Characters(
                                            product.description),
                                        style: const TextStyle(
                                          fontSize: 9, // Smaller font size
                                          color: Colors.black,
                                        ),
                                      ),
                                    ])),
                                    const SizedBox(
                                        height: 2), // Reduced spacing
                                    // Price and Discounted Price
                                    if (product.price ==
                                        product.priceAfterDiscount)
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
                                              decoration:
                                                  TextDecoration.lineThrough,
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            if (state is FailureState) {
              return Center(
                child: Text("${state.message} "),
              );
            } else {
              BlocProvider.of<MainPageBloc>(context).add(LoadDataEvent());
              return Center(
                child: Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                  child: const Text("dadad"),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
