import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/class/boll.dart';

class LikeButtomWidget extends StatelessWidget {
  const LikeButtomWidget({super.key, required this.product});
  final product;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 4, // Adjusted position
      right: 4, // Adjusted position
      child: InkWell(
        onTap: () async {
          GlobalState().isItCart = false;

          User? user = FirebaseAuth.instance.currentUser;

          if (user != null) {
            if (user.emailVerified) {
              if (GlobalState().isItCart == false) {
                String userId = user.uid; // Get Firebase Auth user ID

                // Reference to Firestore
                FirebaseFirestore firestore = FirebaseFirestore.instance;

                // Path: users/{userId}/liked_stuff/{itemId}
                DocumentReference likedItemRef = firestore
                    .collection("users")
                    .doc(userId)
                    .collection("liked_stuff")
                    .doc(product.id);
                // Check if the item is already liked
                DocumentSnapshot snapshot = await likedItemRef.get();
                // Store the liked item
                if (snapshot.exists) {
                  // Item exists, so remove it (Unlike)
                  await likedItemRef.delete();
                  print("Item ${product.id} unliked for user $userId");
                } else {
                  // Item does not exist, so add it (Like)
                  await likedItemRef.set({
                    "itemId": product.id,
                    "timestamp": FieldValue.serverTimestamp(),
                  });
                  print(
                      "Item ${product.id} saved in liked stuff for user $userId");
                }
                return;
              }
              Navigator.pushNamed(context, '/auth');
            }
            //! add to faiverot
          }
        },
        child: Container(
          width: 30,
          height: 30,
          padding: const EdgeInsets.all(4), // Add some padding around the image
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius:
                BorderRadius.circular(40), // Optional: Rounded corners
          ),
          child: Image.asset(
            fit: BoxFit.fill,
            'assets/image/heart.png', // Replace with your image path
          ),
        ),
      ),
    );
  }
}
