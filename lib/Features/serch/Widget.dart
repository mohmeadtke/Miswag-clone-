import 'package:flutter/material.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';
import 'package:miswag/Features/home/Presentation/Widget/listViewWidget/bottom_half_widget.dart';
import 'package:miswag/Features/home/Presentation/Widget/listViewWidget/discount_widget.dart';
import 'package:miswag/Features/home/Presentation/Widget/listViewWidget/like_buttom_widget.dart';
import 'package:miswag/Features/home/Presentation/Widget/listViewWidget/list_button_widget.dart';

class ListViewWidgett extends StatelessWidget {
  const ListViewWidgett({
    super.key,
    required this.data,
    required this.searchText,
  });

  final List data;
  final String searchText;

  List<dynamic> filterEntitiesByName(
      List<dynamic> entities, String searchText) {
    return entities.where((entity) {
      return entity.name.toLowerCase().contains(searchText.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List filteredData = filterEntitiesByName(data, searchText);

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        crossAxisSpacing: 8.0, // Space between columns
        mainAxisSpacing: 8.0, // Space between rows
        childAspectRatio: 0.85, // Adjust the height of each card
      ),
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        MainPageEntity product = filteredData[index];

        return Card(
          elevation: 2,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 120, // Adjust image height
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(product.image),
                      ),
                    ),
                  ),
                  DiscountWidget(product: product),
                  ListButtonWidget(product: product),
                  LikeButtonWidget(product: product),
                ],
              ),
              BottomHalfWidget(product: product),
            ],
          ),
        );
      },
    );
  }
}
