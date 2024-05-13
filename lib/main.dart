import 'package:flutter/material.dart';
import 'package:myfirstproject/controller/fav_counter_controller.dart';
import 'package:myfirstproject/view/Cart/cart_page.dart';
import 'package:myfirstproject/view/Home/Home_page.dart';
import 'package:myfirstproject/view/Login.dart';
import 'package:myfirstproject/view/WelcomePage/welcomepage.dart';
import 'package:myfirstproject/view/Custom Widget/mytheme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/cart_controller.dart';
import 'controller/login_controller.dart';
import 'view/WelcomePage/loginpage.dart';
Future<void> main(List<String> args) async {
   WidgetsFlutterBinding.ensureInitialized();
  LoginController loginController = Get.put(LoginController());
   CartController cartController = Get.put(CartController());
   FavCounterController favCounterController = Get.put(FavCounterController());
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  var isLoggedIn = (preferences.getBool("isLoggedin") == null)
      ? false
      : preferences.getBool("isLoggedin");

runApp(  MyApp(  isLoggedIn: isLoggedIn,));
 

}
class MyApp extends StatelessWidget {
   final isLoggedIn;
   MyApp({super.key, this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
    home:const WelcomePage(),
    //home: isLoggedIn ? HomePage() : const WelcomePage(),
    //home:  LoginPage(),
    );
  }
}
