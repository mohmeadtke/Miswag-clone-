import 'package:flutter/material.dart';
import 'package:miswag/Features/home/Presentation/Widget/app_bar_widget.dart';
import 'package:miswag/Features/home/Presentation/Widget/big_container.dart';
import 'package:miswag/Features/home/Presentation/Widget/list_view_widget.dart';
import 'package:miswag/Features/home/Presentation/Widget/qi_servis.dart';
import 'package:miswag/Features/home/Presentation/Widget/see_more_widget.dart';

import 'Features/home/Presentation/Widget/container_one.dart';
import 'Features/home/Presentation/Widget/search_bar_widget.dart';
import 'Features/home/Presentation/Widget/sections_listview_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> widgetList = [
    const DeeplinkButton(),
    const ContainerOne(),
    const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        "الاقسام",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    const SectionsListviewWidget(),
    const SeeMoreWidget(
      text: 'وصلت حديثا',
    ),
    const BigContainer(
      imageUrl: "assets/image/chat.png",
    ),
    const BigContainer(
      imageUrl: "assets/image/chat.png",
    ),
    const BigContainer(
      imageUrl: "assets/image/chat.png",
    ),
    const BigContainer(
      imageUrl: "assets/image/chat.png",
    ),
    const ListViewWidget(),
    const BigContainer(
      imageUrl: "assets/image/chat.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          const SearchBarWidget(),
          const SizedBox(height: 20), // Spacer

          // Main content
          Expanded(
            child: ListView.builder(
              itemCount: widgetList.length,
              itemBuilder: (context, index) {
                return widgetList[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
