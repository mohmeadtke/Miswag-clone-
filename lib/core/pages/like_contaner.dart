import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LikeContaner extends StatefulWidget {
  const LikeContaner(
      {super.key, required this.prodcet, required this.onRemoved});
  final dynamic prodcet;
  final VoidCallback onRemoved;

  @override
  _LikeContanerState createState() => _LikeContanerState();
}

class _LikeContanerState extends State<LikeContaner> {
  void _removeFromFavorites() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      DocumentReference likedItemRef = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("liked_stuff")
          .doc(widget.prodcet.id);

      await likedItemRef.delete();
      widget.onRemoved();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.prodcet.id),
      onDismissed: (direction) => _removeFromFavorites(),
      child: Container(
        height: 150,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/image/heart.png',
                width: 80,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.prodcet.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    widget.prodcet.description,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  const Spacer(),
                  Text(
                    "IQD ${widget.prodcet.priceAfterDiscount.toString()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: _removeFromFavorites,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
