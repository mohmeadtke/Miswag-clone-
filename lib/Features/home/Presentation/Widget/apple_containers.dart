import 'package:flutter/material.dart';

class AppleContainers extends StatelessWidget {
  const AppleContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: AssetImage("assets/image/mis.jpg"),
                    fit: BoxFit.fill)),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              container(),
              container(),
              container(),
            ],
          )
        ],
      ),
    );
  }

  GestureDetector container() {
    return GestureDetector(
      onTap: () {
        //! rout to apple page
      },
      child: Container(
        height: 150,
        width: 128,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage("assets/image/mis.jpg"))),
      ),
    );
  }
}
