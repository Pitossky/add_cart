import 'package:cart_app_two/product_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  get products => _products;

  void addProducts(ProductModel products) {
    if (_products.containsKey(products)) {
      if (_products[products] == 1) {
        Get.snackbar(
          'Product Already Added',
          '',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          messageText: Text(
            '${products.productName} has already been added to the cart',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
        return;
      }
      _products[products] += 1;
    } else {
      _products[products] = 1;
    }

    Get.snackbar(
      'Product Added',
      '',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      messageText: Text(
        'You have added ${products.productName} added to the cart',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void removeProduct(ProductModel productModel) {
    if (_products.containsKey(productModel) && _products[productModel] == 1) {
      _products.removeWhere(
        (key, value) => key == productModel,
      );
    } else {
      _products[productModel] -= 1;
    }
  }
}
