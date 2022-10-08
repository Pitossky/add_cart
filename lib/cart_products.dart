import 'package:cart_app_two/cart_controller.dart';
import 'package:cart_app_two/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProducts extends StatelessWidget {
  final CartController cartProductsController = Get.find();
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: Column(
          children: [
            ListView.builder(
              itemCount: cartProductsController
                  .products.length, //ProductModel.productList.length,
              itemBuilder: (_, i) {
                return CartCard(
                  index: i,
                  productModel:
                      cartProductsController.products.keys.toList()[i],
                  quantity: cartProductsController.products.values.toList()[i],
                  controller: cartProductsController,
                );
              },
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
    ;
  }
}

class CartCard extends StatefulWidget {
  final CartController controller;
  final ProductModel productModel;
  late int quantity;
  final int index;

  CartCard({
    Key? key,
    required this.controller,
    required this.productModel,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              widget.productModel.productImage,
            ),
          ),
          const Spacer(),
          Text(
            widget.productModel.productName,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {
              /*
              widget.controller.removeProduct(
                widget.productModel,
              );
              */
              setState(() {
                if (widget.quantity > 1) {
                  widget.quantity--;
                } else {
                  Get.snackbar(
                    'Action not allowed!',
                    'You cannot reduce further',
                    duration: const Duration(seconds: 2),
                    snackPosition: SnackPosition.BOTTOM,
                    snackStyle: SnackStyle.FLOATING,
                    messageText: const Text('You cannot reduce further',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  );
                }
              });
            },
            icon: const Icon(Icons.remove_circle),
          ),
          Text(
            '${widget.quantity}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          IconButton(
            onPressed: () {
              //controller.addProducts(productModel);
              setState(() {
                widget.quantity++;
              });
            },
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }
}
