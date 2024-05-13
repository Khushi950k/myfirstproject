import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirstproject/view/Cart/cart_page.dart';
import 'package:myfirstproject/view/Logout/logout_page.dart';

import '../../controller/bottom_navigation_controller.dart';
import '../Dashboard/user_dashboard.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  HomePage({Key? key}) : super(key: key);

  final screens = [
    UserDashboard(),
    CartPage(),
    LogoutPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Obx(
     () => IndexedStack(
         index: bottomNavigationController.currentIndex.value,
          children: screens,
      ),
      ),
      // bottomNavigationBar: Obx(
      //   () => BottomNavigationBar(
      //     type: BottomNavigationBarType.shifting,
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.white70,
      //     showUnselectedLabels: true,
      //     // selectedIconTheme: IconThemeData(color: Colors.green),
      //     onTap: (index) {
      //       bottomNavigationController.changeIndex(index);
      //     },
      //     currentIndex: bottomNavigationController.currentIndex.value,
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //         ),
      //         label: "Home",
      //         backgroundColor: Colors.deepPurple,
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.shop),
      //         label: "Cart",
      //         backgroundColor: Colors.green,
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.logout,
      //         ),
      //         label: "Logout",
      //         backgroundColor: Colors.purple,
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: Container(
        decoration:  BoxDecoration(
          color: Colors.pink,
          boxShadow: [BoxShadow(
            blurRadius: 10,
            color: const Color.fromARGB(255, 215, 41, 41).withOpacity(0.1)
          )]
        ),
        child: Padding(padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10
        ),
        child:  GNav(tabs: const[
          GButton(icon: Icons.home,
          text: "Home",),
          GButton(icon: Icons.shop,
          text: "Cart",),
          GButton(icon: Icons.logout,
          text: "LogOut",)
          ],
          activeColor: Colors.black,
          tabBackgroundColor: Colors.blue,
         tabActiveBorder: Border.all(color:Colors.purple,
         width: 3) ,
         color: Colors.orange,
         haptic: true,
         gap: 6,
         iconSize: 20,
         tabShadow: [BoxShadow(
          color: Colors.blue.withOpacity(0.1)
         )],
         duration: const Duration(milliseconds: 200),
         curve: Curves.decelerate,
         rippleColor: Colors.blue,
         tabBorder: Border.all(color: Colors.orange),
         hoverColor:Colors.purple,
         onTabChange: (value) {
           bottomNavigationController.currentIndex(value);
         },
          ),
        ),
      ),
    );
  }
}