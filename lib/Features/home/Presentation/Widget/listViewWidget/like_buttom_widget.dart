import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';

class LikeButtonWidget extends StatefulWidget {
  const LikeButtonWidget({super.key, required this.product});
  final MainPageEntity product;

  @override
  _LikeButtonWidgetState createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _checkIfLiked();
  }

  Future<void> _checkIfLiked() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      DocumentReference likedItemRef = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("liked_stuff")
          .doc(widget.product.id);

      DocumentSnapshot snapshot = await likedItemRef.get();
      if (mounted) {
        setState(() {
          isLiked = snapshot.exists;
        });
      }
    }
  }

  void _toggleLike() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Reload the user to update the emailVerified property
      await user.reload();
      user = FirebaseAuth.instance.currentUser; // Get the updated user instance

      if (user!.emailVerified) {
        String userId = user.uid;
        DocumentReference likedItemRef = FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("liked_stuff")
            .doc(widget.product.id);

        DocumentSnapshot snapshot = await likedItemRef.get();

        if (snapshot.exists) {
          await likedItemRef.delete();
          if (mounted) {
            setState(() {
              isLiked = false;
            });
          }
        } else {
          await likedItemRef.set({
            "itemId": widget.product.id,
            "timestamp": FieldValue.serverTimestamp(),
          });
          if (mounted) {
            setState(() {
              isLiked = true;
            });
          }
        }
      } else {
        // Email is not verified; navigate to authentication or show a message.
        Navigator.pushNamed(context, '/auth');
      }
    } else {
      Navigator.pushNamed(context, '/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 4,
      right: 4,
      child: InkWell(
        onTap: _toggleLike,
        child: Container(
          width: 30,
          height: 30,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Image.asset(
            isLiked ? 'assets/image/heartRed.png' : 'assets/image/heart.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
