import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Features/home/Domain/entity/main_page_entity.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key, required this.product});
  final MainPageEntity product;

  @override
  BottomSheetContentState createState() =>
      // ignore: no_logic_in_create_state
      BottomSheetContentState(product: product);
}

class BottomSheetContentState extends State<BottomSheetContent> {
  int itemCount = 1;
  String selectedColor = "Denim";
  final MainPageEntity product;

  BottomSheetContentState({required this.product});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(70, 3, 87, 244),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.close,
                      color: Colors.blue, // Change color if needed
                      size: 18, // Adjust size if necessary
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(product.description, //! add the discrpishan here
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(),
          const SizedBox(height: 16),
          const Text("Colors",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 70,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(product.image))),
                    ),
                    SizedBox(
                      height: 20,
                      width: 70,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("black")
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          const Text("Sizes",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(child: const Text("Standard"))),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("Limited",
                style: TextStyle(color: Colors.grey, fontSize: 10)),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Count"),
              const Spacer(),
              Container(
                height: 40,
                width: 110,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(136, 158, 158, 158)),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          itemCount++;
                        });
                      },
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                    Text("$itemCount", style: const TextStyle(fontSize: 18)),
                    IconButton(
                      onPressed: () {
                        if (itemCount > 0) {
                          setState(() {
                            itemCount--;
                          });
                        }
                      },
                      icon: itemCount == 0 || itemCount == 1
                          ? const Icon(Icons.delete)
                          : const Icon(Icons.remove_circle_outline),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 180,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), // Circular border
                  ),
                  child: const Center(
                    child: Text(
                      'CLOSE',
                      style: TextStyle(
                        color: Colors.black, // Text color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16), // Space between the buttons

              GestureDetector(
                onTap: () async {
                  User? user = FirebaseAuth.instance.currentUser;
                  String userId = user!.uid;
                  DocumentReference listItemRef = FirebaseFirestore.instance
                      .collection("users")
                      .doc(userId)
                      .collection("list_stuff")
                      .doc(widget.product.id);
                  await listItemRef.set({
                    "itemCount": itemCount,
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: 180,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10), // Circular border
                    border: Border.all(color: Colors.blue), // Border color
                  ),
                  child: const Center(
                    child: Text(
                      'ADD TO CART',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget colorOption(String color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Colors.blue : Colors.transparent, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color == "Black" ? Colors.black : Colors.blue,
              radius: 20,
            ),
            const SizedBox(height: 4),
            Text(color),
          ],
        ),
      ),
    );
  }
}
