import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductCategoryController extends GetxController {
  final categories = [].obs;

  @override
  void onInit() {
    // Make the API call
    http
        .get(Uri.parse('https://dummyjson.com/products/categories'))
        .then((response) {
      // Parse the JSON data
      var data = json.decode(response.body);
      print(["data", data]);
      // Update the list of categories
      categories.value = data.map((category) => category).toList();
      update();
    });
    super.onInit();
  }
}
