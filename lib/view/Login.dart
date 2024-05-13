// ignore: file_names
import 'package:flutter/material.dart';
import 'package:myfirstproject/view/WelcomePage/loginpage.dart';
//import 'package:myfirstproject/view/WelcomePage/signup.dart';

import 'WelcomePage/signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Center(child: Text("Welcome to Login Page",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, 
),)),
      Center(child: Image.asset('android/assets/undraw_Balloons_re_8ymj.png')),
           const SizedBox(height:10),
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) => LoginPage()));

                    }, child: const Text('LOGIN', style: 
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold
                  ),), ),
          
                  ),
                ),
              const SizedBox(height: 10,),
              Center(
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                          style: ButtonStyle(shape: MaterialStateProperty.all
                          (RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.grey)
                          ),
                          onPressed:(){
   Navigator.of(context).push(MaterialPageRoute(builder: (builder) => SignUp()));

                            
                        }, child: const Text('SIGNUP', style: 
                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold
                      ),), ),
                ),
              ),
              
        ],
      ),
    );
  }
  //loginButtonClickHandler(BuildContext context){
   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
  
 // }
 // signupButtonClickHandler(BuildContext context){
  
  //}

}
