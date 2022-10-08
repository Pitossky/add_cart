import 'package:cart_app_two/cart_controller.dart';
import 'package:cart_app_two/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_screen.dart';

class ProductsWidget extends StatelessWidget {

  ProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.95,
      child: Column(
        children: [
          ListView.builder(
            itemCount: ProductModel.productList.length,
            itemBuilder: (_, i) {
              return ProductsCard(
                index: i,
              );
            },
            shrinkWrap: true,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.to(
                      () => const CartScreen(),
                );
              },
              child: const Text('Go to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductsCard extends StatelessWidget {
  final int index;
  final cartController = Get.put(CartController());
  ProductsCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              ProductModel.productList[index].productImage,
            ),
          ),
          const Spacer(),
          Text(
            ProductModel.productList[index].productName,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            '\$${ProductModel.productList[index].productPrice}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(width: 10),
          /*
          Center(
            child: ElevatedButton(
              onPressed: () {
                cartController.addProducts(ProductModel.productList[index]);
                Get.to(
                      () => const CartScreen(),
                );
              },
              child: const Text('Add to Cart'),
            ),
          ),
          */
          IconButton(
            onPressed: () {
              cartController.addProducts(ProductModel.productList[index]);
            },
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }
}
