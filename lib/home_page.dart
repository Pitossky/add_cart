import 'package:cart_app_two/products_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Cart'),
        elevation: 0,
      ),
      body: ProductsWidget(),
    );
  }
}
