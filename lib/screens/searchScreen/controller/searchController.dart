import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quest_demo/models/products.dart';

class SearchController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ProductsData productsData = ProductsData();
  String _query = "";
  String get query => _query;
  set query(String value) {
    _query = value;
    _fetchProducts();
  }

  void _fetchProducts() async {
    setLoading(true);
    try {
      var response = await http
          .get(Uri.parse('https://dummyjson.com/products/search?q=$_query'));
      if (response.statusCode == 200) {
        productsData = ProductsData.fromJson(jsonDecode(response.body));
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
