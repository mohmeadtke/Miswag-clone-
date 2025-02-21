import 'package:flutter/material.dart';
import 'package:miswag/core/Widget/app_bar_widget.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(pageNum: 0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Privacy Policy'),
              _buildSectionTitle('Collecting customer data'),
              _buildText(
                  "We collect device identifiers such as Device ID and Advertising ID..."),
              _buildBulletPoint('the name'),
              _buildBulletPoint('Mobile number'),
              _buildBulletPoint('Governorate'),
              _buildSectionTitle('Data Collection and Use'),
              _buildBoldText('Device ID:'),
              _buildText(' Collected to identify and manage user sessions.'),
              _buildBoldText('Advertising ID:'),
              _buildText(
                  ' Used for providing personalized advertisements and marketing campaigns.'),
              _buildSectionTitle('Third-Party SDKs'),
              _buildBulletPoint(
                  'Adjust: Used for analytics and user acquisition.'),
              _buildBulletPoint(
                  'Facebook: Used for social media integration and advertising.'),
              _buildBulletPoint(
                  'MoEngage: Used for user engagement and marketing automation.'),
              _buildSectionTitle('Opt-Out and Account Deletion'),
              _buildText(
                  'While our app does not currently offer options to opt out of targeted advertising...'),
              _buildSectionTitle('Data Retention'),
              _buildText(
                  'We retain personal data for as long as your account is active...'),
              _buildSectionTitle('Third-Party Sharing of Personal Data'),
              _buildText(
                  'We may share your data with third parties for various purposes...'),
              _buildSectionTitle('Correction of Personal Data'),
              _buildText(
                  'You have the right to request the correction of any inaccurate or incomplete personal data...'),
              _buildSectionTitle('The purpose of the data'),
              _buildBulletPoint(
                  'Create a special account for each customer...'),
              _buildBulletPoint('Allocating an electronic shopping basket...'),
              _buildSectionTitle('Use of cookies'),
              _buildText('Unlike many online shopping sites...'),
              _buildSectionTitle('Data Controller Information'),
              _buildBulletPoint('Company Name: Miswag'),
              _buildBulletPoint(
                  'Address: Baghdad, Dora Express, Near Dijla beach Gas station'),
              _buildBulletPoint('Email: dci@miswag.com'),
              _buildBulletPoint('Phone: +9647817777919'),
              _buildSectionTitle(
                  'Data Protection Officer (DPO) Contact Information'),
              _buildBulletPoint('Name: Ahmed Subhy'),
              _buildBulletPoint('Email: dpo@miswag.com'),
              _buildBulletPoint('Phone: +9647817777919'),
              _buildBulletPoint(
                  'Address: Baghdad, Dora Express, Near Dijla beach Gas station'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget _buildBoldText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('\u2022 ', style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
