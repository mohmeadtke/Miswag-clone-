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
      id: json['id'] ?? "0",
      name: json['name'] ?? 'null',
      description: json['description'] ?? "null",
      image: json['image'] ?? 'null',
      category: json['category'] ?? 'null',
      price: json['price'] ?? '0.0',
      priceAfterDiscount: json['priceAfterDiscount'] ?? '0.0',
    );
  }
}
