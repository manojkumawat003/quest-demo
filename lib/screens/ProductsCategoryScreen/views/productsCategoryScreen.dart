import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../productsListing/views/listing.dart';
import '../controller/productCategoryController.dart';

class ProductCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductCategoryController>(
      init: ProductCategoryController(),
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text("Categories")),
        body: _.categories.length > 0
            ? ListView.builder(
                itemCount: _.categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Get.to(ProductListingScreen(
                        category: _.categories[index],
                      ));
                    },
                    title: Text(_.categories[index]),
                    subtitle: Divider(
                      height: 2,
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
