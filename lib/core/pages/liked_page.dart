import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'like_contaner.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({super.key, required this.data});
  final List data;

  @override
  _LikedPageState createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  List filteredData = [];

  @override
  void initState() {
    super.initState();
    _filterLikedProducts();
  }

  void _filterLikedProducts() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      QuerySnapshot likedItemsSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("liked_stuff")
          .get();

      List<String> likedItemIds =
          likedItemsSnapshot.docs.map((doc) => doc.id).toList();

      setState(() {
        filteredData = widget.data
            .where((product) => likedItemIds.contains(product.id))
            .toList();
      });
    } else {
      Navigator.pushNamed(context, '/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        final product = filteredData[index];
        return LikeContaner(
          prodcet: product,
          onRemoved: () {
            _filterLikedProducts();
          },
        );
      },
    );
  }
}
