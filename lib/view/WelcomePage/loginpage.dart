import 'package:flutter/material.dart';
//import 'package:myfirstproject/view/WelcomePage/signup.dart';
import 'package:myfirstproject/view/WelcomePage/signup.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController useridController = TextEditingController();
  //TextEditingController passController = TextEditingController();
  String userIdErrorText = "Mobile Number can not be empty";
  String userIdHintText = "Enter Mobile Number";
  Color userIdHintTextColor = Colors.purple;
  TextEditingController userpassController = TextEditingController();
  // TextEditingController passController = TextEditingController();
  String userpassErrorText = "PassWord can not be empty";
  String userpassHintText = "Enter PassWord";
  Color userpassHintTextColor = Colors.purple;

  LoginController loginController = Get.put(LoginController());

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('android/assets/images/Login.png'),
              const Center(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: size.width * 0.8,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 238, 213, 239),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            //maxLength: 10,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            controller: useridController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return userIdErrorText;
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              print(value);
                            },
                            decoration: InputDecoration(
                                counterText: "",
                                hintText: userIdHintText,
                                hintStyle:
                                    TextStyle(color: userIdHintTextColor),
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: Colors.purple,
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: Container(
                          width: size.width * 0.8,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 238, 213, 239),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            controller: userpassController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return userpassErrorText;
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              print(value);
                            },
                            decoration: InputDecoration(
                                hintText: userpassHintText,
                                hintStyle:
                                    TextStyle(color: userpassHintTextColor),
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.purple,
                                ),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.visibility_off,
                                      color: Colors.purple),
                                  onPressed: () {
                                    print('Hello');
                                  },
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 290,
                        height: 52,
                        child: Obx(() =>loginController.isDataSubmitting.value 
                        ==false? ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(21)),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.purple)),
                              onPressed: () {
                                userLogin();
                              },
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                            : CircularProgressIndicator(),
                        )
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Dont have account?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                          )
                        ],
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  void userLogin() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      // print(useridController.text);
      // print(userpassController.text);

      loginController.loginWithDetail(
          useridController.text, userpassController.text);
    }
    {
      return null;
    }
  }
}
