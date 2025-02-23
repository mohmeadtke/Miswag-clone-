import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miswag/Features/serch/presentation/serch_page.dart';

import '../pages/chat_page.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final int pageNum;
  const AppBarWidget({super.key, required this.pageNum})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      forceMaterialTransparency: true,
      actions: (pageNum == 0)
          ? []
          : [
              if (pageNum == 2)
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/SerchPage');
                    },
                    child: const Icon(Icons.search)),
              if (pageNum == 1)
                InkWell(
                  onTap: () async {
                    User? user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      // Reload the user to update the emailVerified property
                      await user.reload();
                      user = FirebaseAuth.instance
                          .currentUser; // Get the updated user instance

                      if (user!.emailVerified) {
                        Navigator.pushNamed(context, '/LikedPage');
                      } else {
                        // Email is not verified; navigate to authentication or show a message.
                        Navigator.pushNamed(context, '/auth');
                      }
                    } else {
                      Navigator.pushNamed(context, '/auth');
                    }
                  },
                  child: Image.asset(
                    "assets/image/heart.png",
                    width: 25,
                    height: 30,
                  ),
                ),
              const SizedBox(width: 15),
              if (pageNum == 1 || pageNum == 2)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatHelpPage()),
                    );
                  },
                  child: Image.asset(
                    "assets/image/chat.png",
                    width: 25,
                    height: 22,
                  ),
                ),
              const SizedBox(width: 15),
              if (pageNum == 3)
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/SerchPage');
                    },
                    child: const Icon(
                      Icons.search,
                      size: 30,
                    )),
            ],
      title:
          (pageNum == 3 || pageNum == 0) ? _titleMethow(90) : _titleMethow(144),
    );
  }

  Padding _titleMethow(double num) {
    return Padding(
      padding: EdgeInsets.only(left: num),
      child: const Text(
        "miswag",
        style: TextStyle(
          color: Colors.red,
          fontSize: 27,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
