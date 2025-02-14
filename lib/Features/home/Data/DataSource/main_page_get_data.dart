import 'dart:convert'; // For JSON decoding
import 'package:flutter/services.dart';
import 'package:miswag/Features/home/Data/model/main_page_model.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';

class MainPageGetData {
  Future<List<MainPageEntity>> fetchLocalJson() async {
    // Load the local JSON data
    final jsonString = await rootBundle.loadString('assets/json/data.json');
    print("JSON string loaded successfully");

    // Decode the JSON data
    final jsonData = await json.decode(jsonString);

    List<MainPageEntity> mainPageList =
        (jsonData as List).map((item) => MainPageModel.fromJson(item)).toList();
    print("Decoded JSON data sucss");
    return mainPageList;
    // Convert the first item in the list to MainPageModel
  }
}
