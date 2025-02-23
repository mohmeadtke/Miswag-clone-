import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miswag/Features/Cart/Presentation/pages/temp_cart_page.dart';
import '../Widget/cart_contaner.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.data});
  final List data;

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // Check if the user is logged in.
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Redirect to auth if user is not signed in.
      return const TempCartPage();
    }
    String userId = user.uid;

    // Use StreamBuilder to listen to the user's list_stuff collection.
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("list_stuff")
            .snapshots(),
        builder: (context, snapshot) {
          // Show a loading spinner while the data is loading.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // If there's no data, show an empty state message.
          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return const TempCartPage();
          }

          // Extract liked item IDs from Firestore documents.
          List<String> likedItemIds =
              snapshot.data!.docs.map((doc) => doc.id).toList();

          // Filter the passed data with the liked item IDs.
          List filteredData = widget.data
              .where((product) => likedItemIds.contains(product.id))
              .toList();

          // Build the list view for the filtered data.
          return ListView.builder(
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              final product = filteredData[index];
              return CartContaner(
                prodcet: product,
              );
            },
          );
        },
      ),
    );
  }
}
