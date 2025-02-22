import 'package:flutter/material.dart';

class OffersPages extends StatelessWidget {
  OffersPages({super.key});
  final List<String> links = [
    "https://d3uk5qlby53t3w.cloudfront.net/images/images/95b262a2-6983-4452-86fa-95c8ffe838c7.png",
    "https://d3uk5qlby53t3w.cloudfront.net/images/images/d8d3acea-5f0a-4723-8ff3-d665133cce47.png",
    "https://d3uk5qlby53t3w.cloudfront.net/images/images/9a5d8e92-0c3a-4ae0-a66f-4f79eaae2e9f.png",
    "https://d3uk5qlby53t3w.cloudfront.net/images/images/71ac661b-8ede-4ad4-8e00-e1d36d271d83.png",
    "https://d3uk5qlby53t3w.cloudfront.net/images/images/d77157cf-63bb-47e6-9198-2897b0c4d4c1.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              //! Route to search page
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(links[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
