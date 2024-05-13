import 'package:flutter/material.dart';
import 'package:myfirstproject/controller/category_controller.dart';
import 'package:get/get.dart';
import 'package:myfirstproject/view/Cart/product_detail.dart';

import '../../controller/product_controller.dart';
import 'item_card.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  CategoryController categoryController = Get.put(CategoryController());
  ProductController productController = Get.put(ProductController());
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 81, 170),
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Product",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryController.categoryList.length,
                  itemBuilder: (context, index) {
                    return buildCategory(index);
                  },
                ),
              ),
              Obx(
                () => productController.isDataLoadingCompleetd.value == true
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          child: GridView.builder(
                            itemCount: productController.products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.65,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                            ),
                            itemBuilder: (context, index) {
                              var currentProduct =
                                  productController.products[index];
                              return ItemCard(
                                currentProduct: currentProduct,
                                cardClickHandler: () {
                                  Get.to(
                                    () => ProductDetailPage(
                                      product: currentProduct,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategory(index) {
    return InkWell(
      onTap: () {
        categoryController.changeIndex(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Obx(() => Column(
              children: [
                Text(
                  categoryController.categoryList[index],
                  style:  TextStyle(fontWeight: FontWeight.bold,
                   color: categoryController.currentIndex.value == index
                      ? Colors.white
                      : Colors.white30,),
                ),
                Container(
                margin: const EdgeInsets.only(top: 0.4),
                height: 2,
                width: 30,
                color: categoryController.currentIndex.value == index
                    ? Colors.white
                    : Colors.transparent,
              ),
              ],
            )),
      ),
    );
  }
}
