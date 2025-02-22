import 'package:flutter/material.dart';
import 'package:miswag/Features/More/Presentation/Widget/row_widget.dart';

class TowWodget extends StatelessWidget {
  final String text1;
  final IconData icon1;
  final String text2;
  final IconData icon2;
  final Widget widget1;
  final Widget widget2;

  const TowWodget({
    super.key,
    required this.text1,
    required this.icon1,
    required this.text2,
    required this.icon2,
    required this.widget1,
    required this.widget2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          RowWidget(
            iconData: icon1,
            text: text1,
            widget: widget1,
          ),
          _buildDivider(),
          RowWidget(
            iconData: icon2,
            text: text2,
            widget: widget2,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[200],
      thickness: 4,
    );
  }
}
