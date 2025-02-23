import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartContaner extends StatefulWidget {
  const CartContaner({
    super.key,
    required this.prodcet,
  });
  final dynamic prodcet;

  @override
  _CartContanerState createState() => _CartContanerState();
}

class _CartContanerState extends State<CartContaner> {
  int itemCount = 1;
  bool isLiked = false;
  dynamic text;
  @override
  void initState() {
    super.initState();
    _checkIfLiked();
    _getItemCount();
  }

  Future<void> _checkIfLiked() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      DocumentReference likedItemRef = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("liked_stuff")
          .doc(widget.prodcet.id);

      DocumentSnapshot snapshot = await likedItemRef.get();
      if (mounted) {
        setState(() {
          isLiked = snapshot.exists;
        });
      }
    }
  }

  Future<void> _getItemCount() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;

      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("list_stuff")
          .doc("${widget.prodcet.id}")
          .get();

      if (snapshot.exists && snapshot.data() != null) {
        final data = snapshot.data() as Map<String, dynamic>;
        if (data.containsKey("itemCount")) {
          setState(() {
            itemCount = data["itemCount"];
          });
        }
      }
    }
  }

  void _toggleLike() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.reload();
      user = FirebaseAuth.instance.currentUser;

      if (user!.emailVerified) {
        String userId = user.uid;
        DocumentReference likedItemRef = FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("liked_stuff")
            .doc(widget.prodcet.id);

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
            "itemId": widget.prodcet.id,
            "itemCount": itemCount, // save the current itemCount
            "timestamp": FieldValue.serverTimestamp(),
          });
          if (mounted) {
            setState(() {
              isLiked = true;
            });
          }
        }
      }
    }
  }

  void _removeFromFavorites() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      DocumentReference likeItemRef = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("list_stuff")
          .doc(widget.prodcet.id);
      await likeItemRef.delete();
    }
  }

  void deleteIteam() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      DocumentReference listItemRef = FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("list_stuff")
          .doc(widget.prodcet.id);
      await listItemRef.delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the total price based on the itemCount.
    final totalPrice = widget.prodcet.priceAfterDiscount * itemCount;

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
              child: Image.network(
                widget.prodcet.image,
                width: 80,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 210,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "IQD ${totalPrice.toString()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(136, 158, 158, 158)),
                          borderRadius: BorderRadius.circular(30),
                        ),
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
                            Text(
                              "$itemCount",
                              style: const TextStyle(fontSize: 18),
                            ),
                            IconButton(
                              onPressed: () {
                                if (itemCount > 1) {
                                  setState(() {
                                    itemCount--;
                                  });
                                }
                              },
                              icon: const Icon(Icons.remove_circle_outline),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Column(
              children: [
                IconButton(
                  icon: Image.asset(
                    isLiked
                        ? 'assets/image/heartRed.png'
                        : 'assets/image/heart.png',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: _toggleLike,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    size: 30,
                  ),
                  onPressed: deleteIteam,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
