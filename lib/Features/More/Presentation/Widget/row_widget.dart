import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
    required this.iconData,
    required this.text,
    required this.widget,
  });
  final IconData iconData;
  final String text;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  Icon(iconData),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (text == "Language" || text == "Gift cards") {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('This feature not implemented yet'),
                  duration: Duration(seconds: 1),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => widget),
              );
            }
          },
          child: Container(
            color: const Color.fromARGB(0, 0, 0, 0),
            height: 60,
            width: double.infinity,
          ),
        ),
      ],
      // child:
    );
  }
}
