import 'package:flutter/material.dart';
import 'package:miswag/Features/More/Presentation/Widget/five_widget.dart';
import 'package:miswag/Features/More/Presentation/Widget/one_widget.dart';
import 'package:miswag/Features/More/Presentation/Widget/tow_wodget.dart';
import 'package:miswag/Features/More/Presentation/pages/delivery_service.dart';
import 'package:miswag/Features/More/Presentation/pages/notifications_page.dart';
import 'package:miswag/core/Widget/app_bar_widget.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      const OneWidget(
        text: "Login or create new account",
        iconData: Icons.person,
        widget: NotificationsPage(),
      ),
      const OneWidget(
        text: "Language",
        iconData: Icons.language_outlined,
        widget: NotificationsPage(),
      ),
      const TowWodget(
        text1: "Gift cards",
        text2: "Notifications",
        icon1: Icons.wallet_giftcard,
        icon2: Icons.notifications_outlined,
        widget1: NotificationsPage(),
        widget2: NotificationsPage(),
      ),
      const FiveWidget(
        text1: "Chat with us",
        icon1: Icons.chat_outlined,
        text2: "Help Center",
        icon2: Icons.help_outline,
        text3: "Miswag Services",
        icon3: Icons.insert_drive_file,
        text4: "Privacy policy",
        icon4: Icons.lock,
        text5: "About Us",
        icon5: Icons.info_outline,
      ),
      OneWidget(
        text: "Delivery Service",
        iconData: Icons.local_shipping,
        widget: DeliveryPage(),
      ),
      const OneWidget(
        text: "App Icon",
        iconData: Icons.apps,
        widget: NotificationsPage(),
      ),
      const Center(
        child: Text("4.4.7"),
      ),
      const SizedBox(
        height: 15,
      )
    ];

    return Scaffold(
      appBar: const AppBarWidget(pageNum: 2),
      body: Scaffold(
        backgroundColor: Colors.grey[200],
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
      ),
    );
  }
}
