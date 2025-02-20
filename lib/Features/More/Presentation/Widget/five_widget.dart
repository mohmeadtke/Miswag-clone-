import 'package:flutter/material.dart';
import 'package:miswag/Features/More/Presentation/Widget/row_widget.dart';
import 'package:miswag/Features/More/Presentation/pages/about_us_page.dart';
import '../pages/miswag_services.dart';
import '../pages/notifications_page.dart';
import '../pages/privacy_policy_page.dart';

class FiveWidget extends StatelessWidget {
  final String text1;
  final IconData icon1;
  final String text2;
  final IconData icon2;
  final String text3;
  final IconData icon3;
  final String text4;
  final IconData icon4;
  final String text5;
  final IconData icon5;

  const FiveWidget({
    super.key,
    required this.text1,
    required this.icon1,
    required this.text2,
    required this.icon2,
    required this.text3,
    required this.icon3,
    required this.text4,
    required this.icon4,
    required this.text5,
    required this.icon5,
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
            widget: const NotificationsPage(),
          ),
          _buildDivider(),
          RowWidget(
            iconData: icon2,
            text: text2,
            widget: const NotificationsPage(),
          ),
          _buildDivider(),
          RowWidget(
            iconData: icon3,
            text: text3,
            widget: const MiswagServices(),
          ),
          _buildDivider(),
          RowWidget(
            iconData: icon4,
            text: text4,
            widget: const PrivacyPolicyPage(),
          ),
          _buildDivider(),
          RowWidget(
            iconData: icon5,
            text: text5,
            widget: const AboutUsPage(),
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
