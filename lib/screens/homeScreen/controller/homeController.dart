import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quest_demo/models/products.dart';

class HomeController extends GetxController {
  int _page = 1;
  bool isLoading = false;
  ProductsData productsData = ProductsData();

  @override
  void onInit() {
    loadMore();
  }

  void loadMore() async {
    if (!isLoading) {
      isLoading = true;
      update();
      var request = http.Request('GET',
          Uri.parse('https://dummyjson.com/products?limit=${20 * _page}'));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        print(["data", data]);
        if (data != null) {
          _page += 1;
          productsData = ProductsData.fromJson(jsonDecode(data));

          update();
        }
      }
      isLoading = false;
      update();
    }
  }
}
