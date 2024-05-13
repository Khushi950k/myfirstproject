import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/Cart Model/product_model.dart';

class FavCounterController extends GetxController{
var numOFItems = 0.obs;
var favList = <ProductModel>[].obs;

void addFavItemToList(ProductModel product){
if(!favList.contains(product)){
favList.add(product);
  numOFItems++;
}
else{
  Get.snackbar("Already There","You Already Liked this Item!",
  backgroundColor:Color(int.parse(product.color)),
  snackPosition: SnackPosition.BOTTOM,
  colorText: Colors.black,
  borderColor: Colors.indigo,
  borderRadius: 10,
  borderWidth: 2,
  barBlur: 0
   );
}

} 


}

