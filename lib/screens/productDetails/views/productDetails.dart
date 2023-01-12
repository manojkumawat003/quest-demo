import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/productDetailController.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;
  ProductDetailsScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      init: ProductDetailsController(productId: productId),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Product Details"),
          ),
          body: _.isLoading
              ? Center(child: CircularProgressIndicator())
              : _.productDetails == null
                  ? Center(child: Text("Product not found"))
                  : Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          slider(_.productDetails.images!),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Name: ${_.productDetails.title}"),
                          Divider(),
                          Text("Description: ${_.productDetails.description}"),
                          Divider(),
                          Text("Price: ${_.productDetails.price}"),
                          Divider(),
                          Text(
                              "Discount Percentage: ${_.productDetails.discountPercentage}"),
                          Divider(),
                          Text("Ratings: ${_.productDetails.rating}"),
                          Divider(),
                          Text("Stock: ${_.productDetails.stock}"),
                          Divider(),
                          Text("Brand: ${_.productDetails.brand}"),
                          Divider(),
                          Text("Category: ${_.productDetails.category}"),
                          Divider(),
                        ],
                      ),
                    ),
        );
      },
    );
  }

  Widget slider(List<String> images) {
    return CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          enlargeCenterPage: false,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
        ),
        items: images.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(i),
                      fit: BoxFit.cover,
                    )),
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(context).size.width,
              );

              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   margin: EdgeInsets.symmetric(horizontal: 5),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     image: DecorationImage(
              //         image: NetworkImage(API.imageBaseUrl + i.image),
              //         fit: BoxFit.cover)),
              // );
            },
          );
        }).toList());
  }
}
