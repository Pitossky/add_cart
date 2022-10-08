import 'package:flutter/material.dart';

import 'cart_products.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          CartProducts(),
          //CartTotal(),
        ],
      ),
    );
  }
}

