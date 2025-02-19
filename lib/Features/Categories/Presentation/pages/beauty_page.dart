import 'package:flutter/material.dart';

//! read me

//! This code is rabiesh and not optimised because no time left

class BeautyPage extends StatelessWidget {
  const BeautyPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listt = [
      newMethod0(),
      newMethod2("الاقسام الرئيسيه", "العنايه بالبشره", "العطور", "المكياج",
          "العنايه بالشعر", const Text(''), const Text('')),
      newMethod2("العطور", "العطور النسائيه", "مست للجسم", "مست الشعر",
          "العطور الرجاليه", co("مزيلات التعرق"), co("العطور العربيه ")),
      newMethod2("المكياج", "مكياج الوجه", "مكياج الشفاه", "مزيلات المكياج",
          "ادوات المكياج", co("مكياج العيون"), co("مكياج الحواجب")),
    ];
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: listt.length,
      itemBuilder: (BuildContext context, int index) {
        return listt[index];
      },
    );
  }

  Column newMethod2(
      String text0, text1, text2, text3, text4, Widget widget, widget1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            text0,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            co(text1),
            co(text2),
            co(text3),
          ],
        ),
        Row(
          children: [
            co(text4),
            widget,
            widget1,
          ],
        ),
      ],
    );
  }

  Column co(String text1) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
              color: Colors.grey,
              image:
                  DecorationImage(image: AssetImage("assets/image/mis.jpg"))),
        ),
        Center(
          child: Text(text1),
        )
      ],
    );
  }

  Container newMethod0() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200], // Background color for visualization
      ),
      width: 80,
      height: 80,
      child: Row(
        children: [
          // Left Side: Red Container with Arrow
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red, // Background color for visualization
            ),
            height: 80,
            width: 60,
            alignment: Alignment.topCenter,
            child: const Text(
              "<",
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
          ),

          // Center: Image
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/image/mis.jpg', // Replace with your image path
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
