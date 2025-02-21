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
      backgroundColor: Colors.white,
      forceMaterialTransparency: true,
      actions: (pageNum == 0)
          ? []
          : [
              if (pageNum == 2)
                InkWell(
                    onTap: () {
                      //! go to faverot page
                    },
                    child: const Icon(Icons.search)),
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
              if (pageNum == 1 || pageNum == 2)
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
              if (pageNum == 3)
                InkWell(
                    onTap: () {
                      //! go to ser page page
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
