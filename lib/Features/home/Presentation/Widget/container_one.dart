import 'package:flutter/material.dart';

class ContainerOne extends StatelessWidget {
  const ContainerOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 4),
      child: Row(
        children: [
          rowcontainer(),
          const SizedBox(
            width: 3,
          ),
          rowcontainer(),
          const SizedBox(
            width: 3,
          ),
          rowcontainer(),
        ],
      ),
    );
  }

  GestureDetector rowcontainer() {
    return GestureDetector(
      onDoubleTap: () {
        //! rout to serch page
      },
      child: Container(
        height: 160,
        width: 130,
        // color: Colors.blue,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
          image: const DecorationImage(
            image: AssetImage("assets/image/chat.png"),
          ),
        ),
      ),
    );
  }
}
