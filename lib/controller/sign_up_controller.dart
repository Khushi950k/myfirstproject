import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  var isProfilePicPathSet = false.obs;
  var profilePicPath = "".obs;

  String userName = "";
  String userEmail = "";
  String userMobile = "";
  String userPass = "";
  String userGender = "";

  void setProfileImagePath(String path){
    profilePicPath.value = path;
    isProfilePicPathSet.value = true;
  }
  void signUpUser(String name ,String email, 
  String mobile, String pass, String rePass,
  String gender,
  )
  {
    if(isProfilePicPathSet.value == false){
      Get.snackbar("Sign Up failed", 
       "Please Capture/Select Profile Picture",
       backgroundColor: Colors.black,
       snackPosition: SnackPosition.BOTTOM,
       borderRadius: 10,
       borderWidth: 2,
        );
    }else if( pass != rePass){
    Get.snackbar("Sign Up failed", 
       "Password does not match",
       backgroundColor: Colors.black,
       snackPosition: SnackPosition.BOTTOM,
       borderRadius: 10,
       borderWidth: 2,
        );
    }
    else if (!isEmailValid(email)) {
      Get.snackbar(
        "Sign Up Failed",
        "Email Id is not valid",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    }
    else {
      userName = name;
      userEmail = email;
      userMobile = mobile;
      userPass = pass;
      userGender = gender;

      sendUserDataToServer();
    }
  }
  bool isEmailValid(String email) {
    bool emailValid = RegExp(
   r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }
  
  void sendUserDataToServer() {}
}

