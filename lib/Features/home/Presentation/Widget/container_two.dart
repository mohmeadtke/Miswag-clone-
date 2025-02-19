import 'package:flutter/material.dart';

class ContainerTwo extends StatelessWidget {
  const ContainerTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7, top: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [container(), container()],
      ),
    );
  }

  GestureDetector container() {
    return GestureDetector(
      onTap: () {
        //! rout to apple page
      },
      child: Container(
        height: 200,
        width: 190,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage("assets/image/mis.jpg"))),
      ),
    );
  }
}
