import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:myfirstproject/controller/fav_counter_controller.dart';

import '../../model/Cart Model/product_model.dart';
import 'cart_counter.dart';

class ProductCounterWithFavIcon extends StatelessWidget {
  ProductCounterWithFavIcon({
    Key? key,
    required this.product,
  }) : super(key: key);
  FavCounterController favCounterController = Get.find();

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CartCounter(product: product),
          InkWell(
            onTap: () {
              favCounterController.addFavItemToList(product);
              //print("liked click");
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                "android/Svg/heart.svg",
        
         
      
              ),
            ),
          ),
        ],
      ),
    );
  }
}