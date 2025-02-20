import 'package:flutter/material.dart';
import 'package:miswag/Features/More/Presentation/Widget/row_widget.dart';

import '../pages/notifications_page.dart';

class OneWidget extends StatelessWidget {
  const OneWidget(
      {super.key,
      required this.text,
      required this.iconData,
      required this.widget});
  final String text;
  final IconData iconData;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: RowWidget(
        iconData: iconData,
        text: text,
        widget: widget,
      ),
    );
  }
}
