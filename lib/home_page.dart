import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miswag/Features/home/Presentation/Widget/big_container.dart';
import 'package:miswag/Features/home/Presentation/Widget/brand_list_widgit.dart';
import 'package:miswag/Features/home/Presentation/Widget/main_text_widget.dart';
import 'package:miswag/Features/home/Presentation/Widget/qi_servis.dart';
import 'package:miswag/Features/home/Presentation/state_mangment/bloc/main_page_bloc.dart';
import 'package:miswag/core/Widget/app_bar_widget.dart';
import 'Features/home/Presentation/Widget/Container_two.dart';
import 'Features/home/Presentation/Widget/apple_containers.dart';
import 'Features/home/Presentation/Widget/container_one.dart';
import 'Features/home/Presentation/Widget/listViewWidget/bloc_builder_widget.dart';
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
    const BlocBuilderWidget(text: 'وصلت حديثا'),
    const AppleContainers(),
    const SmallContainer(),
    const BigContainer(imageUrl: "assets/image/mis.jpg"),
    const BlocBuilderWidget(text: 'التخفيضات والعروض'),
    const BigContainer(imageUrl: "assets/image/mis.jpg"),
    const ContainerTwo(),
    const BigContainer(imageUrl: "assets/image/mis.jpg"),
    const MainTextWidget(text: "جديد في ماركات العنايه بالبشره"),
    const ContainerTwo(),
    const BigContainer(imageUrl: "assets/image/mis.jpg"),
    const BlocBuilderWidget(text: ' الجديد في الاجهزه المنزليه'),
    const BigContainer(imageUrl: "assets/image/mis.jpg"),
    const BigContainer(imageUrl: "assets/image/mis.jpg"),
    const ContainerTwo(),
    const SizedBox(height: 8),
    const ContainerTwo(),
    const MainTextWidget(text: "تسوق حسب الماركه"),
    const BrandListWidgit(),
    const ContainerOne(),
    const MainTextWidget(text: "تسوق الهواتف الذكيه حسب الماركه"),
    //! phoin list view
    const BlocBuilderWidget(text: "تخفيضات الالكترونيات"),
    const BigContainer(imageUrl: "assets/image/mis.jpg"),
    const BigContainer(imageUrl: "assets/image/mis.jpg"),
    const BigContainer(imageUrl: "assets/image/mis.jpg"),
    const BigContainer(imageUrl: "assets/image/mis.jpg"),
    const BlocBuilderWidget(text: "الجديد في المنزل والمطبخ"),
    const BigContainer(imageUrl: "assets/image/mis.jpg"),

    const BigContainer(imageUrl: "assets/image/mis.jpg"),
    const SectionsListviewWidget(), //! myby i shoud change this
    const BigContainer(imageUrl: "assets/image/mis.jpg"),
    const BlocBuilderWidget(text: "العنايه بالفم"),
    const BigContainer(imageUrl: "assets/image/mis.jpg"),
    const BlocBuilderWidget(text: "ديكور المنزل"),
    const ContainerTwo(),
  ];

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(
        pageNum: 1,
      ),
      // Remove the inner Scaffold if possible.
      body: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            const SearchBarWidget(),
            Container(
              height: 20,
              color: Colors.white,
            ), // Spacer

            // Wrap RefreshIndicator with Expanded to provide bounded height.
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  _refreshData;
                  BlocProvider.of<MainPageBloc>(context).add(LoadDataEvent());
                },
                child: ListView.builder(
                  itemCount: widgetList.length,
                  itemBuilder: (context, index) {
                    return widgetList[index];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
