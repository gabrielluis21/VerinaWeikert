// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:verinna_weikert_test_frontend/src/controllers/auth.controller.dart';
import 'package:verinna_weikert_test_frontend/src/views/auth/sign-up/signup.screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verina Weikert"),
        centerTitle: true,
      ),
      body: Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10), 
                    topLeft: Radius.circular(10),
                  ),
                color: Colors.blue[200]
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Form(key: formKey, child:
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          label: Text("E-mail/User name"),
                          hintText: "User name here",
                          border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        controller: pwdController,
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              isObscure = !isObscure;
                            });
                          }, icon: Icon(isObscure? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash)),
                          label: Text("Password"),
                          hintText: "Password here",
                          border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        onPressed: (){
                          //if(formKey.currentState?.validate()){}

                          var auth = Get.put<AuthController>(AuthController());
                          auth.signIn(emailController.text, pwdController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: Size(327, 60)
                        ), 
                        child: Text("Entrar"),
                      ),
                      SizedBox(height: 15,),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
                      }, child: Text("Criar uma nova conta"))
                   ],
                  ),
                ),
              ),
            ),
    );
  }
}