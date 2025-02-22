import 'dart:convert';

import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';

class MainPageModel extends MainPageEntity {
  MainPageModel({
    required super.image,
    required super.price,
    required super.id,
    required super.name,
    required super.category,
    required super.description,
    required super.priceAfterDiscount,
  });

  factory MainPageModel.fromJson(Map<String, dynamic> json) {
    return MainPageModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
      price: int.parse(json['price']),
      priceAfterDiscount: int.parse(json['priceAfterDiscount']),
    );
  }
  // Method to parse a list of products from JSON
  List<MainPageModel> parseProducts(String jsonData) {
    final List<dynamic> decoded = jsonDecode(jsonData);
    return decoded.map((item) => MainPageModel.fromJson(item)).toList();
  }
}
