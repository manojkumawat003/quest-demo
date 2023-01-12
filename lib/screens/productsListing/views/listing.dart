import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../productDetails/views/productDetails.dart';
import '../controller/listingController.dart';

class ProductListingScreen extends StatelessWidget {
  final String category;
  ProductListingScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsListingController>(
      init: ProductsListingController(category: category),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Products Listing"),
          ),
          body: _.isLoading
              ? Center(child: CircularProgressIndicator())
              : _.productsData.products!.isEmpty
                  ? Center(child: Text("No products found"))
                  : ListView.builder(
                      itemCount: _.productsData.products!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: ListTile(
                            onTap: () {
                              Get.to(ProductDetailsScreen(
                                  productId:
                                      _.productsData.products![index].id!));
                            },
                            leading: Image.network(
                              _.productsData.products![index].thumbnail!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            title: Text(_.productsData.products![index].title!),
                            subtitle: Text(
                                _.productsData.products![index].description!),
                            trailing: Text(
                                "${_.productsData.products![index].price!}\$"
                                    .toString()),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}
