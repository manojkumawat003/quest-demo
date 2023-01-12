import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../productDetails/views/productDetails.dart';
import '../controller/searchController.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: TextField(
                  onChanged: (value) => _.query = value,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search products...",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                ),
              ),
              body: _.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _.productsData.products == null ||
                          _.productsData.products!.isEmpty
                      ? Center(child: Text("No products found"))
                      : Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _.productsData.products!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    Get.to(ProductDetailsScreen(
                                        productId: _.productsData
                                            .products![index].id!));
                                  },
                                  leading: Image.network(
                                    _.productsData.products![index].thumbnail!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                      _.productsData.products![index].title!),
                                  subtitle: Text(_.productsData.products![index]
                                      .description!),
                                  trailing: Text(
                                      "${_.productsData.products![index].price!}\$"
                                          .toString()),
                                );
                              }),
                        ));
        });
  }
}
