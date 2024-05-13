import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/fav_counter_controller.dart';

class FavoriateList extends StatelessWidget {
  FavoriateList({Key? key}) : super(key: key);

  FavCounterController favCounterController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 233, 15, 33),
          title: const Text("Favoriate List"),
          leading: IconButton(
            icon: SvgPicture.asset("android/Svg/back.svg"),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body:  ListView.builder(
              itemCount: favCounterController.favList.length,
              itemBuilder: (context, index) {
                var currentItem = favCounterController.favList[index];
                return Card(
                  color: Color(
                    int.parse(currentItem.color),
                  ),
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        currentItem.image,
                        height: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentItem.name,
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            currentItem.price.toString(),
                            style: const TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }),
        );
  }
}