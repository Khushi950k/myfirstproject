import 'package:flutter/material.dart';
import 'package:myfirstproject/controller/login_controller.dart';
import 'package:get/get.dart';


// ignore: must_be_immutable
class LogoutPage extends StatelessWidget {
  LoginController loginController = Get.find();
   LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 210, 239),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Logout Page",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20,),
            Center(
                child: SizedBox(
                  width: 250,
                  height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(shape: MaterialStateProperty.all
                      (RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21)),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.purple)
                      ),
                      onPressed:(){
                    loginController.logout();
                    }, child: const Text('Logout', style: 
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold
                  ),), ),
          
                  ),
                ),
          ],
        ),
      ),
    );
  }
}