import 'package:flutter/material.dart';
import '../Login.dart';
//import '../secondscreen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return Scaffold(
body: SizedBox(
  width: double.infinity,
  height: size.height,
  child: Stack(children: [

//const Center(child: Text("Welcome to new design", style: //TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
    Center(
      child: Positioned(
        child: Image.asset('android/assets/images/background.png'),
      ),
    ),
    
    InkWell(
      child: const Icon(Icons.arrow_back)
      )
  ],
   ),
),
   drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 161, 186, 229),
              ),
              child: Text('Drawer Header'),
            ),
        

             ListTile(
              title: const Text('Login'),
              
              onTap: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()
));
              },
            ),
            ListTile(
              title: const Text('2nd screen'),
              onTap: () {
               
              },
            ),
            ListTile(
              title: const Text('3rd screen'),
              
              onTap: () {
               
              },
            ),
          ],
        ),
      ),

    );
  }
}
