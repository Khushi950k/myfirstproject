
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfirstproject/view/Cart/add_to_cart_page.dart';
import 'package:myfirstproject/view/Cart/product_counter_fav_icon.dart';

import '../../model/Cart Model/product_model.dart';
import 'product_color_size.dart';
import 'product_description.dart';
import 'product_details_image_title_price.dart';


class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 20,
                    right: 20,
                  ),
                  // height: size.height * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
          ),
          ),
    child:  Column(
         children: [
          ProductColorSize(product: product),
          ProductDescription(product: product),
          ProductCounterWithFavIcon(product: product),
          AddToCartPage(product: product),
   ],
   
     ),
      ),
       ProductDetailsImageTitlePrice(product: product),
       
              ],
            ),
          ),
        ],
      ),
    );
  }
}