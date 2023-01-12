import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quest_demo/models/productDetails.dart';

class ProductDetailsController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final int productId;
  ProductDetailsController({required this.productId});
  ProductDetails productDetails = ProductDetails();
  @override
  void onInit() {
    super.onInit();
    _fetchProduct();
  }

  void _fetchProduct() async {
    setLoading(true);
    try {
      var response = await http
          .get(Uri.parse('https://dummyjson.com/products/$productId'));
      if (response.statusCode == 200) {
        productDetails = ProductDetails.fromJson(jsonDecode(response.body));
        update();
      }
    } catch (e) {
      print(e);
    }
    setLoading(false);
  }

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }
}
