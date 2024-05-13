import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myfirstproject/controller/fav_counter_controller.dart';
import 'package:myfirstproject/view/Cart/cart_list.dart';
import 'package:myfirstproject/view/Cart/product_details_body.dart';
import '../../controller/cart_controller.dart';
import '../../model/Cart Model/product_model.dart';
import 'package:badges/badges.dart' as badges;

import 'favoriate_list.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  FavCounterController favCounterController = Get.find();
  CartController cartController = Get.find();
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
     cartController.initliaseQuantity();
    return Scaffold(
      backgroundColor: Color(int.parse(product.color)),
      appBar: AppBar(
        backgroundColor: Color(int.parse(product.color)),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(
              "android/Svg/back.svg",
              color: Colors.white,
            )),
        actions: [
          InkWell(
            onTap: (){
                Get.to(() => FavoriateList());
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: badges.Badge(
                badgeContent: Obx(() => Text(
                      favCounterController.numOFItems.value.toString(),
                    )),
                child: SvgPicture.asset(
                  "android/Svg/heart.svg",
                  width: 30,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => CartList());
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: badges.Badge(
                // badgeColor: Colors.blue,
                badgeContent:  Obx(() => Text(
                  cartController.totalQty.value.toString(),)),
                child: SvgPicture.asset("android/Svg/cart.svg"),
              ),
            ),
          ),
        ],
      ),
      body: ProductDetailsBody(
        product: product,
      ),
    );
  }
}
