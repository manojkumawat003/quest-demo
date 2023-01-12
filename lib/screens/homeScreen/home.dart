import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../productDetails/views/productDetails.dart';
import '../searchScreen/views/searchScreen.dart';
import 'controller/homeController.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text("Home"),
                actions: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          Get.to(SearchScreen());
                        },
                      )),
                ],
              ),
              body: _.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : (_.productsData.products!.isNotEmpty)
                      ? buildProductList(_)
                      : Center(
                          child: Text("No products found"),
                        ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.arrow_downward),
                onPressed: () {
                  _.loadMore();
                },
              ),
            ));
  }

  Widget buildProductList(HomeController homeController) {
    return ListView.builder(
        itemCount: homeController.productsData.products!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Get.to(ProductDetailsScreen(
                      productId:
                          homeController.productsData.products![index].id!));
                },
                leading: Image.network(
                  homeController.productsData.products![index].thumbnail!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                title:
                    Text(homeController.productsData.products![index].title!),
                subtitle: Text(homeController
                        .productsData.products![index].price!
                        .toString() +
                    '\$'),
              ),
              Divider()
            ],
          );
        });
  }
}
