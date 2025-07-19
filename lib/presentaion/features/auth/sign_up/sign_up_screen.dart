import 'package:exam_app/core/colors_manager.dart';
import 'package:exam_app/core/routes_manager.dart';
import 'package:exam_app/presentaion/features/auth/sign_up/sign_up_states.dart';
import 'package:exam_app/presentaion/features/auth/sign_up/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../api/model/request/sign_up_request.dart';
import '../../../../core/app_style.dart';
import '../../../../di/di.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
   final _formKey = GlobalKey<FormState>();
 @override
  void dispose() {
   userNameController.dispose();
   firstNameController.dispose();
   lastNameController.dispose();
   emailController.dispose();
   passwordController.dispose();
   confirmPasswordController.dispose();
   phoneController.dispose();
      super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>getIt.get<SignUpViewModel>(),
      child: Scaffold(
       appBar: AppBar(leading: BackButton(), title: Text("Sign Up")),
       body: BlocListener<SignUpViewModel,SignUpStates>(

         listener: (BuildContext context, state) {
           switch(state){
             case SignUpInitial():
               break;
               case SignUpLoading():
                 showDialog(
                   context: context,
                   builder: (context) => AlertDialog(
                     title: Center(
                       child: CircularProgressIndicator(
                         color: Colors.white,
                       ),
                     ),
                   ),
                 );
             case SignUpSuccess():
               Navigator.pop(context);
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                   content: Text("SignUp Successfully",
                       style: AppStyle.snackBarMessage),
                   backgroundColor: Colors.green,
                   duration: Duration(seconds: 2),
                 ),
               );
               Navigator.pushReplacementNamed(context, RoutesManager.logIn);
             case SignUpFailure():
               Navigator.pop(context);
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                   content: Text("Error", style: AppStyle.snackBarMessage),
                   backgroundColor: Colors.red,
                   duration: Duration(seconds: 2),
                 ),
               );




           }

         },
         child: Padding(
           padding: const EdgeInsets.all(15),
           child: SingleChildScrollView(
             child: Form(
               key: _formKey,
               child: Column(
                 children: [
                   TextFormField(
                     controller: userNameController,
                     decoration: InputDecoration(
                       labelText: "user name",
                       hintText: "Enter your user name ",
                       border: OutlineInputBorder(),
                     ),
                     validator: (text) {
                       if (text == null || text.trim().isEmpty) {
                         return "this user name is not valid";
                       }

                       return null;
                     },
                   ),
                   SizedBox(height: 25),
                   Row(
                     children: [
                       Expanded(
                         child: TextFormField(
                           controller: firstNameController,
                           decoration: InputDecoration(
                             labelText: "First name",
                             hintText: "Enter First name ",
                             border: OutlineInputBorder(),
                           ),
                           validator: (text) {
                             if (text == null || text.isEmpty) {
                               return "please enter your first name";
                             }
                           },
                         ),
                       ),
                       SizedBox(width: 20),
                       Expanded(
                         child: TextFormField(
                           controller: lastNameController,
                           decoration: InputDecoration(
                             labelText: "Last name",
                             hintText: "Enter Last name ",
                             border: OutlineInputBorder(),
                           ),
                           validator: (text) {
                             if (text == null || text.isEmpty) {
                               return "please enter your last name";
                             }
                           },
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 25),

                   TextFormField(
                     controller: emailController,
                     decoration: InputDecoration(
                       labelText: "Email",
                       hintText: "Enter your email ",
                       border: OutlineInputBorder(),
                     ),
                     validator: (text) {
                       if (text == null || text.trim().isEmpty) {
                         return "this EMAIL is not valid";
                       }
                       bool isEmailValid = RegExp(
                         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                       ).hasMatch(text);
                       if (!isEmailValid) {
                         return 'Email format is wrong';
                       }
                       return null;
                     },
                   ),
                   SizedBox(height: 25),

                   Row(
                     children: [
                       Expanded(
                         child: TextFormField(
                           controller: passwordController,
                           decoration: InputDecoration(
                             labelText: "password",
                             hintText: "Enter password ",
                             border: OutlineInputBorder(),
                           ),
                           validator: (text) {
                             if (text == null || text.isEmpty) {
                               return "please enter your password";
                             }
                             if (text.length < 6) {
                               return 'Passwords should be more 6';
                             }
                           },
                         ),
                       ),
                       SizedBox(width: 20),

                       Expanded(
                         child: TextFormField(
                           controller: confirmPasswordController,
                           decoration: InputDecoration(
                             labelText: "confirm password",
                             hintText: "Enter confirm password ",
                             border: OutlineInputBorder(),
                           ),
                           validator: (text) {
                             if (text == null || text.isEmpty) {
                               return 'Please enter a password';
                             }
                             if (text != passwordController.text) {
                               return 'password not matched';
                             }
                           },
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 25),
                   TextFormField(
                     controller: phoneController,
                     decoration: InputDecoration(
                       labelText: "Phone number",
                       hintText: "Enter Phone number ",
                       border: OutlineInputBorder(),
                     ),
                     validator: (text) {
                       if (text == null || text.isEmpty) {
                         return 'Enter phone number';
                       }

                       if (text != phoneController.text) {
                         return 'phone number not matched';
                       }

                       }

                   ),

                   SizedBox(height: 75),

                   ElevatedButton(
                     onPressed: () {
                       if (_formKey.currentState!.validate()) {
                         final request = SignUpRequest(
                           username: userNameController.text,
                           firstName: firstNameController.text,
                           lastName: lastNameController.text,
                           email: emailController.text,
                           password: passwordController.text,
                           rePassword: confirmPasswordController.text,
                           phone: phoneController.text,
                         );
                         context.read<SignUpViewModel>().signUp(request);
                        }
                     },
                     child: Container(
                       width: double.infinity,
                       height: 50,
                       decoration: BoxDecoration(
                         color: Colors.blue[900],
                         borderRadius: BorderRadius.circular(25),
                       ),
                       child: Center(
                         child: Text(
                           "Sign up",
                           style: TextStyle(color: Colors.white),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(height: 15),

                   Row(
                     children: [
                        Center(child: Text("Already have an account? ")),
                       GestureDetector(
                         onTap: (){
                           Navigator.pushNamed(context,RoutesManager.logIn);
                         },
                         child:Text('Login',style: TextStyle(color: ColorsManager.blueButton,decoration: TextDecoration.underline),  ),
                       )
                     ],
                   ),
                 ],
               ),
             ),
           ),
         ),
       ),
            ),
    );
  }
}
