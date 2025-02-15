import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';
import 'package:miswag/Features/home/Presentation/Widget/qi_servis.dart';
import 'package:miswag/Features/home/Presentation/state_mangment/bloc/main_page_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: () {},
            child: Image.asset(
              "assets/image/heart.png",
              width: 25,
              height: 30,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {},
            child: Image.asset(
              "assets/image/chat.png",
              width: 25,
              height: 22,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 144),
          child: Text(
            "miswag",
            style: TextStyle(
              color: Colors.red,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
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
                // print('Search button tapped');
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
                        enabled:
                            false, // Disable editing, makes it look like a button
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
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 20,
          ),
          //deepLink
          DeeplinkButton(),
          Expanded(
            child: BlocBuilder<MainPageBloc, MainPageState>(
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
                      itemCount: data.length,
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

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            color: Colors.white, // Set card background to white
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12), // Slightly smaller border radius
                            ),
                            child: SizedBox(
                              width: 120, // Reduced width for each card
                              child: Column(
                                mainAxisSize: MainAxisSize
                                    .min, // Prevent stretching to fill space
                                children: [
                                  // Top Half: Image with Discount Percentage
                                  Stack(
                                    children: [
                                      Container(
                                        height:
                                            100, // Reduced height for the image
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(8),
                                          ),
                                          image: DecorationImage(
                                            // image: NetworkImage(product.image), // Load image from URL
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/image/chat.png"), // Placeholder image
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
                                              color:
                                                  Colors.red, // Red background
                                              borderRadius: BorderRadius.circular(
                                                  8), // Smaller border radius
                                            ),
                                            child: Text(
                                              "${discountPercentage.toStringAsFixed(0)}% off", // Display discount percentage
                                              style: const TextStyle(
                                                fontSize:
                                                    10, // Smaller font size
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  // Bottom Half: Product Details
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        8.0), // Reduced padding
                                    child: Column(
                                      mainAxisSize: MainAxisSize
                                          .min, // Prevent stretching
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Product Name (Bold)
                                        Text(
                                          product.name,
                                          style: const TextStyle(
                                            fontSize: 14, // Smaller font size
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                            height: 4), // Reduced spacing
                                        // Description
                                        Text(
                                          product.description,
                                          style: TextStyle(
                                            fontSize: 12, // Smaller font size
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        const SizedBox(
                                            height: 4), // Reduced spacing
                                        // Price and Discounted Price
                                        if (product.price ==
                                            product.priceAfterDiscount)
                                          // Show only price if no discount
                                          Text(
                                            "${product.price} IQD",
                                            style: const TextStyle(
                                              fontSize: 14, // Smaller font size
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        else
                                          // Show both prices if there's a discount
                                          Column(
                                            mainAxisSize: MainAxisSize
                                                .min, // Prevent stretching
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${product.price} IQD",
                                                style: TextStyle(
                                                  fontSize:
                                                      12, // Smaller font size
                                                  color: Colors.grey[600],
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                              const SizedBox(
                                                  height: 2), // Reduced spacing
                                              Text(
                                                "${product.priceAfterDiscount} IQD",
                                                style: const TextStyle(
                                                  fontSize:
                                                      14, // Smaller font size
                                                  color: Colors.green,
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
          ),
        ],
      ),
    );
  }
}
