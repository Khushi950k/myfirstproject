import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';

class CartList extends StatelessWidget {
  CartList({Key? key}) : super(key: key);

  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: buildAppBar(),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Obx(
                  () => ListView.builder(
                      itemCount: cartController.cartItems.length,
                      itemBuilder: (context, index) {
                        var currentItem = cartController.cartItems[index];
                        return Card(
                          clipBehavior: Clip.none,
                          color: Color(int.parse(currentItem.product.color)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                currentItem.product.image,
                                width: 100,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Quantity: ${currentItem.qty}"),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      cartController
                                          .removeThisItemFromList(currentItem);
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Obx(() => Text(
                            "Total Amount:\n ${cartController.totalAmount.value.toString()}",
                            style: Theme.of(context).textTheme.headline6,
                          )),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() => Text(
                            "Total Quantity:\n ${cartController.totalQty.value.toString()}",
                            style: Theme.of(context).textTheme.headline6,
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Text(
        "Item List",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: SvgPicture.asset(
          "android/Svg/back.svg",
          color: Colors.white,
        ),
      ),
    );
  }
}