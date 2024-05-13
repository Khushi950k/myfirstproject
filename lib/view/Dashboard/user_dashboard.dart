import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myfirstproject/controller/login_controller.dart';
import 'package:get/get.dart';
//import 'package:myfirstproject/model/user_data_list.dart';

// ignore: must_be_immutable
class UserDashboard extends StatelessWidget {
  UserDashboard({super.key});
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 222, 235),
      body: Obx(() => loginController.isDataReadingCompleted.value 
      ==true? 
       Column(
        //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
  height: size.height * 0.4,
  child: Stack(
    children: [
      Container(
     padding: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height * 0.4 - 27,
      decoration: const BoxDecoration(
     color: Colors.deepPurple,
     borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(40),
     bottomRight: Radius.circular(40),
      ),
       ), 
 child: Row(
     children: [
     Text(
     "Hi, Khushi",
      style: Theme.of(context).textTheme.headline5!.copyWith(
        color: Colors.white,
      fontWeight: FontWeight.bold,
          ),
   ),
   const Spacer(),
       Image.asset(
      "android/assets/images/logo.png",
     width: 60,
       )
       ],
      )
      ),   
     Positioned(
        bottom: 0,
        left: 0,
       right: 0,
       child: Container(
     margin: const EdgeInsets.symmetric(horizontal: 10),
     padding: const EdgeInsets.symmetric(
       horizontal: 110,
         vertical: 10,
        ),
       height: 55,
      decoration: BoxDecoration(
     color: Colors.white,
       borderRadius: BorderRadius.circular(20),
       boxShadow: [
        BoxShadow(
      offset: const Offset(0, 10),
        blurRadius: 50,
       color: Colors.purple.withOpacity(0.90),
          ),
        ]),
     child: const Text(
       "User Profile", style: TextStyle(fontWeight: FontWeight.bold,
       fontSize: 20),
     ),
     ),
     ),        
    ],
  ),
),
 const SizedBox(
   height: 70,
    ),
    Container(
      height: size.height * 0.3,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 90,
                  color: Colors.purple.withOpacity(0.90),
                ),
              ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: SvgPicture.asset("android/Svg/ellipse_top_pink.svg"),
              ),
                Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset("android/Svg/ellipse_bottom_pink.svg"),
              ),
               const Positioned(
                top: 10,
                left: 10,
                child: Text(
                  "Khushi",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
               const Positioned(
                top: 100,
                left: 10,
                child: Text( "9508668865",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const Positioned(
                top: 130,
                left: 10,
                child: Text( " khu95086@gmail.com",
                  style: TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Positioned(
                bottom: 10,
                left: 10,
                child: Text("Female",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
               Positioned(
                top: 50,
                right: 10,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Color.fromARGB(255, 230, 132, 238),
                          spreadRadius: 20,
                        ),
                      ]),
                  child: const CircleAvatar(
                    radius: 50,
                  backgroundImage:AssetImage('android/assets/images/profile.png'),
                   ),
                  ),
                ),
            ],
          )
    )
            ],
          )
          : const CircularProgressIndicator()
           ),

    );
  }
}
