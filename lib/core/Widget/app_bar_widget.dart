import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final int pageNum;
  const AppBarWidget({super.key, required this.pageNum})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: Colors.white,
      actions: [
        if (pageNum == 2)
          InkWell(
            onTap: () {
              //! go to faverot page
            },
            child: Image.asset(
              "assets/image/cart.png",
              width: 25,
              height: 30,
            ),
          ),
        if (pageNum == 1)
          InkWell(
            onTap: () {
              //! go to faverot page
            },
            child: Image.asset(
              "assets/image/heart.png",
              width: 25,
              height: 30,
            ),
          ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () {
            //! go to cat page page
          },
          child: Image.asset(
            "assets/image/chat.png",
            width: 25,
            height: 22,
          ),
        ),
        const SizedBox(width: 15),
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
    );
  }
}
