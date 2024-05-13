import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../model/Cart Model/product_model.dart';

class CartCounter extends StatelessWidget {
  CartCounter({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            cartController.removeItem();
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Obx(
            () => Text(
              cartController.numOfItems.toString().padLeft(2, "0"),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black),
            ),
          ),
        ),
        buildOutlineButton(
          icon: Icons.add,
          press: () {
            cartController.addItem();
          },
        ),
      ],
    );
  }

  Widget buildOutlineButton({required IconData icon, required Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Color(
            int.parse(product.color),
          ),
          elevation: 20,
          minimumSize: Size(100, 50),
          shadowColor: Color(
            int.parse(product.color),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          press();
        },
        child: Icon(icon),
      ),
    );
  }
}