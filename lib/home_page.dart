import 'package:flutter/material.dart';
import 'package:miswag/Features/home/Presentation/Widget/app_bar_widget.dart';
import 'package:miswag/Features/home/Presentation/Widget/big_container.dart';
import 'package:miswag/Features/home/Presentation/Widget/brand_list_widgit.dart';
import 'package:miswag/Features/home/Presentation/Widget/list_view_widget.dart';
import 'package:miswag/Features/home/Presentation/Widget/main_text_widget.dart';
import 'package:miswag/Features/home/Presentation/Widget/qi_servis.dart';
import 'package:miswag/Features/home/Presentation/Widget/see_more_widget.dart';
import 'Features/home/Presentation/Widget/Container_two.dart';
import 'Features/home/Presentation/Widget/apple_containers.dart';
import 'Features/home/Presentation/Widget/container_one.dart';
import 'Features/home/Presentation/Widget/search_bar_widget.dart';
import 'Features/home/Presentation/Widget/sections_listview_widget.dart';
import 'Features/home/Presentation/Widget/small_container.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> widgetList = [
    const DeeplinkButton(),
    const ContainerOne(),
    const MainTextWidget(text: "الاقسام"),
    const SectionsListviewWidget(),
    const SeeMoreWidget(text: 'وصلت حديثا'),
    const ListViewWidget(),
    const AppleContainers(),
    const SmallContainer(),
    const BigContainer(imageUrl: "assets/image/chat.png"),
    const SeeMoreWidget(text: 'التخفيضات والعروض'),
    const ListViewWidget(),
    const BigContainer(imageUrl: "assets/image/chat.png"),
    const ContainerTwo(),
    const BigContainer(imageUrl: "assets/image/chat.png"),
    const MainTextWidget(text: "جديد في ماركات العنايه بالبشره"),
    const ContainerTwo(),
    const BigContainer(imageUrl: "assets/image/chat.png"),
    const SeeMoreWidget(text: ' الجديد في الاجهزه المنزليه'),
    const ListViewWidget(),
    const BigContainer(imageUrl: "assets/image/chat.png"),
    const BigContainer(imageUrl: "assets/image/chat.png"),
    const ContainerTwo(),
    const SizedBox(height: 8),
    const ContainerTwo(),
    const MainTextWidget(text: "تسوق حسب الماركه"),
    const BrandListWidgit(),
    const ContainerOne(),
    const MainTextWidget(text: "تسوق الهواتف الذكيه حسب الماركه"),
    //! phoin list view
    const SeeMoreWidget(text: "تخفيضات الالكترونيات"),
    const ListViewWidget(),
    const BigContainer(imageUrl: "assets/image/chat.png"),
    const BigContainer(imageUrl: "assets/image/chat.png"),
    const BigContainer(imageUrl: "assets/image/chat.png"),
    const BigContainer(imageUrl: "assets/image/chat.png"),
    const SeeMoreWidget(text: "الجديد في المنزل والمطبخ"),
    const ListViewWidget(),
    const BigContainer(imageUrl: "assets/image/chat.png"),

    const BigContainer(imageUrl: "assets/image/chat.png"),
    const SectionsListviewWidget(), //! myby i shoud change htis
    const BigContainer(imageUrl: "assets/image/chat.png"),
    const SeeMoreWidget(text: "العنايه بالفم"),
    const ListViewWidget(),
    const BigContainer(imageUrl: "assets/image/chat.png"),
    const SeeMoreWidget(text: "ديكور المنزل"),
    const ListViewWidget(),
    const ContainerTwo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      body: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            const SearchBarWidget(),
            Container(
              height: 20,
              color: Colors.white,
            ), // Spacer

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
      ),
    );
  }
}
