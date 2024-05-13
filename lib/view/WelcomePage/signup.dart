import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfirstproject/controller/gender_selection_controller.dart';
import 'package:myfirstproject/controller/sign_up_controller.dart';
import 'package:myfirstproject/view/WelcomePage/loginpage.dart';
import 'package:get/get.dart';
// ignore: must_be_immutable
class SignUp extends StatelessWidget{
  File? pickedFile;
  ImagePicker imagePicker =ImagePicker();
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  //TextEditingController passController = TextEditingController();
  String userIdErrorText = "Name can not be empty";
  String userIdHintText = "Enter Name";
  Color userIdHintTextColor = Colors.purple;
  TextEditingController userpassController = TextEditingController();
  String userIdEmailErrorText = "Email Id can not be empty";
  String userIdEmailHintText = "Enter Email Id";
   String userIdMobileErrorText = "Mobile can not be empty";
  String userIdMobileHintText = "Enter Mobile";
   String userIdPassErrorText = "PassWord can not be empty";
  String userIdPassHintText = "Enter PassWord";
   String userIdRePassErrorText = "Re-Enter PassWord can not be empty";
  String userIdRePassHintText = "Re-Enter PassWord";
    TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController rePassController = TextEditingController();

GenderSelectionController genderSelectionController =
 Get.put(GenderSelectionController());

 SignUpController signUpController = Get.put(SignUpController());
   SignUp({super.key});
   final globalKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
     Size size  = MediaQuery.of(context).size;
    return  Scaffold(
   body:SingleChildScrollView(
     child: SizedBox(
       width: double.infinity, height: 800,
       child: Form(
        key: globalKey,
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Text('Sign Up', style: TextStyle(fontSize: 25, 
           fontWeight: FontWeight.bold,color: Colors.black),),
           Stack(
            children: [
             Obx( () =>
              CircleAvatar(
    backgroundImage:signUpController.isProfilePicPathSet.value ==
   true? FileImage(File(signUpController.profilePicPath.value))
   as ImageProvider :
    AssetImage('android/assets/images/profile.png'),
                         radius: 60,
                         ),
             ),
            Positioned(
           bottom: 0,
           child: InkWell(child: Icon(Icons.camera),
            onTap: (){    
            print('Camera Clicked'); 
             showModalBottomSheet(context: context, builder: (context)=>bottomsheet(context));
           }, 
           ), 
            ), 
            ],
           ),
        const SizedBox(height: 5,),
         Form(
         key: formKey, 
         child:Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
         Center(
         child: Container(
          width: size.width * 0.8,
         margin: const EdgeInsets.symmetric(vertical:10),
         padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
         decoration: BoxDecoration(color: const Color.fromARGB(255, 238, 213, 239),
         borderRadius: BorderRadius.circular(20)),
         child: TextFormField(
         textInputAction: TextInputAction.next,
         controller: nameController,
         validator: (value){
         if(value!.isEmpty){
         return userIdErrorText;  }
         else{
         return null; } },
         onChanged: (value) {
          print(value);
          } ,
        decoration: InputDecoration(
        hintText: userIdHintText,
         hintStyle: TextStyle(color: userIdHintTextColor),
         border: InputBorder.none,
         prefixIcon: const Icon(
         Icons.person, color: Colors.purple,)                  
         ),),
         ),
         ),
        const SizedBox(height:3,),
         Center(
         child: Container(
         width: size.width * 0.8,
         margin: const EdgeInsets.symmetric(vertical:10),
         padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
         decoration: BoxDecoration(color: const Color.fromARGB(255, 238, 213, 239),
         borderRadius: BorderRadius.circular(20)),
         child: TextFormField(
         textInputAction: TextInputAction.next,
         controller: emailController,
         validator: (value){
        if(value!.isEmpty){
        return userIdEmailErrorText; }
         else{ return null;}
         },
        onChanged: (value) {
        print(value);
         } ,
        decoration: InputDecoration(
        hintText: userIdEmailHintText,
        hintStyle: TextStyle(color: userIdHintTextColor),
        border: InputBorder.none,
        prefixIcon: const Icon(
        Icons.email_outlined, color: Colors.purple,)
        ),
        ),
        ),
        ),
        const SizedBox(height:3,),
         Center(
         child: Container(
         width: size.width * 0.8,
         margin: const EdgeInsets.symmetric(vertical:10),
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        decoration: BoxDecoration(color: const Color.fromARGB(255, 238, 213, 239),
        borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
        maxLength: 10,
         textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        controller: mobileController,
        validator: (value){
         if(value!.isEmpty){
         return userIdMobileErrorText; }
         else{
         return null; }
         },
         onChanged: (value) {
         print(value);
         },
         decoration: InputDecoration(
         counterText: "",
         hintText: userIdMobileHintText,
         hintStyle: TextStyle(color: userIdHintTextColor),
        border: InputBorder.none,
       prefixIcon: const Icon(
        Icons.mobile_friendly_outlined, color: Colors.purple,)                   
        ),                 
        ),
        ),
        ), 
        const SizedBox(height:3,),
        Center(
       child: Container(
       width: size.width * 0.8,
       margin: const EdgeInsets.symmetric(vertical:10),
       padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),  
        decoration: BoxDecoration(color: const Color.fromARGB(255, 238, 213, 239),
       borderRadius: BorderRadius.circular(20)),
         child: TextFormField(
        textInputAction: TextInputAction.next,
       controller: passController,
       validator: (value){
        if(value!.isEmpty){
       return userIdPassErrorText; }
        else{
        return null; }
       },
       onChanged: (value) {
       print(value);
       } ,
       decoration: InputDecoration(
        hintText: userIdPassHintText,
       hintStyle: TextStyle(color: userIdHintTextColor),
       border: InputBorder.none,
       prefixIcon: const Icon(
        Icons.lock, color: Colors.purple,)                    
       ),                
        ), 
        ),           
        ),
       const SizedBox(height:3,),
       Center(
       child: Container(
        width: size.width * 0.8,
        margin: const EdgeInsets.symmetric(vertical:10),
       padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),   
        decoration: BoxDecoration(color: const Color.fromARGB(255, 238, 213, 239),
         borderRadius: BorderRadius.circular(20)),
         child: TextFormField(
       controller: rePassController,
         validator: (value){
        if(value!.isEmpty){
        return userIdRePassErrorText; }
        else{
        return null;}
         },
        onChanged: (value) {
        print(value);
         } ,
        decoration: InputDecoration(
         hintText: userIdRePassHintText,
       hintStyle: TextStyle(color: userIdHintTextColor),
         border: InputBorder.none,
        prefixIcon: const Icon(
       Icons.lock, color: Colors.purple,) ), ), ), ),
       const SizedBox(height:3,),
       Center(
       child: Container(
        width: size.width * 0.8,
       margin: const EdgeInsets.symmetric(vertical:10),
       padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),   
        decoration: BoxDecoration(color: const Color.fromARGB(255, 238, 213, 239),
        borderRadius: BorderRadius.circular(20)),
         child:  Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         const Expanded(
         child: Text('Gender',style: TextStyle(
        fontSize: 15,fontWeight: FontWeight.bold,
        color: Colors.purple),),  ),
        Row(
        children: [
        Obx( ()=>
       Radio(value: "Male", 
       groupValue: genderSelectionController.selectedGender.value,
           onChanged: (value) {
            genderSelectionController.onChangedGender(value);
           },
               activeColor: Colors.purple,
               fillColor: MaterialStateProperty.all(Colors.purple),   ),
        ),
       const Text('Male',style: TextStyle(
        fontSize: 15,fontWeight: FontWeight.bold,
        color: Colors.purple),),    ],),
        Row(
         children: [
        Obx(()=>
           Radio(value: "Female", 
          groupValue: genderSelectionController.selectedGender.value,
           onChanged: (value) {
            genderSelectionController.onChangedGender(value);
           },
            activeColor: Colors.purple,
            fillColor: MaterialStateProperty.all(Colors.purple),  
           ),
        ),
         const Text('Female',style: TextStyle(
         fontSize: 15,fontWeight: FontWeight.bold,
         color: Colors.purple),),
         ],)
          ],
          ),
         ),                      
         ),
         const SizedBox(height:5,),
         Container(
         width: 290,
         height: 52,
         child: ElevatedButton(
         style: ButtonStyle(shape: MaterialStateProperty.all
          (RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(21)),
         ),
       backgroundColor: MaterialStateProperty.all(Colors.purple)
         ),
         onPressed:(){
            signup();
         }, child: const Text('SignUp', style: 
         TextStyle(color: Colors.white, fontWeight: FontWeight.bold
         ),), ), ),
         const SizedBox(height: 9,),
         Row(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Text('Already have account?', style: TextStyle(fontWeight: FontWeight.bold),),
       const SizedBox(width:8,),
       InkWell(
       child:const Text('Login Now',
       style: TextStyle(fontWeight: FontWeight.bold, 
       color: Colors.purple),),
       onTap: () {                         
        Navigator.push(context, MaterialPageRoute(builder:(context)=>  LoginPage()));
         },   )
        ], 
         )              
        ],
        ),
         ),       
        ],
         ),
       ),
     ),
   ),
 );
   
  }
   Widget bottomsheet(BuildContext context){
  Size size  = MediaQuery.of(context).size;
return Container(
  width: double.infinity,
  height: size.height*0.2,
   margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
 child:   Column(
     children: [
 const Text('Choose Profile Photo', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
  const SizedBox(height: 50,),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
children: [ 
  InkWell(
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.image, color: Colors.purple,),
          SizedBox(height: 5,),
   Text('Gallery',style: TextStyle(fontSize: 20,
    fontWeight: FontWeight.bold, color: Colors.purple),),
      ],
    ),
    onTap: (){
      //print('Gallery');
      takePhoto(ImageSource.gallery);
    },
  ),
  const SizedBox(width: 80,),
  InkWell(
    child: const Column(
      children: [
        Icon(Icons.camera, color: Colors.deepPurple,),
    SizedBox(height: 5,),
        Text('Camera',style: TextStyle(fontSize: 20,
    fontWeight: FontWeight.bold, color: Colors.deepPurple),),
      ],
    ),
     onTap: (){
      //print('Camera');
       takePhoto(ImageSource.camera);
    },
  ),

    ],
   ),
     ]
  ), 
);
   }
   
Future<void> takePhoto(ImageSource source) async {
final pickedImage =  await imagePicker.pickImage(source: source,
imageQuality: 100);

pickedFile = File(pickedImage!.path);
//print(pickedFile);
signUpController.setProfileImagePath(pickedFile!.path);
Get.back();
     }
     
       void signup() {
        final isValid =globalKey.currentState!.validate();
        if (isValid){
   // print(nameController.text);
  //  print(emailController.text);
  //  print(mobileController.text);
  // print(passController.text);
  // print(rePassController.text);
 // print(genderSelectionController.selectedGender.value);
signUpController.signUpUser(
 nameController.text,
 emailController.text,
 mobileController.text,
 passController.text,
 rePassController.text,
 genderSelectionController.selectedGender.value
);
 }else{
  return null;
   }
  }
   
}