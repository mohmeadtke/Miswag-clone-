import 'package:flutter/material.dart';

class MainPageEntity {
  final int id;
  final String image;
  final String name;
  final String category;
  final String description;
  final double price;
  final double priceAfterDiscount;

  MainPageEntity(
      {required this.priceAfterDiscount,
      required this.id,
      required this.name,
      required this.category,
      required this.image,
      required this.description,
      required this.price});
}
