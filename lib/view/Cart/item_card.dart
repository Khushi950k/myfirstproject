import 'package:flutter/material.dart';

import '../../model/Cart Model/product_model.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.currentProduct,
    required this.cardClickHandler,
  }) : super(key: key);

  final ProductModel currentProduct;
  final Function cardClickHandler;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        cardClickHandler();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // width: size.width * 0.4,
            // height: size.height * 0.2,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(
                int.parse(currentProduct.color),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Hero(
              tag: currentProduct.id,
              child: Image.asset(currentProduct.image)),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.5),
            child: Text(currentProduct.name),
          ),
          Text(
            "₹ ${currentProduct.price.toString()}",
          ),
        ],
      ),
    );
  }
}