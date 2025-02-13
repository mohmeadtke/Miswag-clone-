import 'dart:convert'; // For JSON decoding
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:miswag/Features/home/Data/model/main_page_model.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';
import 'package:miswag/core/errors/Faillure.dart';

class MainPageGetData {
  Future<Either<Faillure, MainPageEntity>> fetchLocalJson() async {
    try {
      // Load the JSON file from assets
      final jsonString = await rootBundle.loadString('assets/data.json');

      // Decode the JSON string to a Map
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      // Convert the Map to the model
      final mainPageModel = MainPageModel.fromJson(jsonData);

      return right(mainPageModel);
    } catch (e) {
      return left(Faillure.serverError(message: e.toString()));
    }
  }
}
