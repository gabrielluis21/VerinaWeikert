// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verina_weikert_test_frontend/src/views/auth/sign-in/signin.screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final confirmPwdController = TextEditingController();
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
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10), 
                    topLeft: Radius.circular(10),
                  ),
                color: Colors.blue[200]
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Form(child:
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
                      SizedBox(height: 15,),
                      TextFormField(
                        controller: confirmPwdController,
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              isObscure = !isObscure;
                            });
                          }, icon: Icon(isObscure? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash)),
                          label: Text("Confirm Password"),
                          hintText: "Confirm Password here",
                          border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        onPressed: (){
                          //if(formKey.currentState?.validate()){
                            
                          //}
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: Size(327, 60)
                        ), 
                        child: Text("Cadastrar"),
                      ),
                      SizedBox(height: 15,),
                      TextButton(onPressed: (){
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginScreen())
                        );
                      }, child: Text("Voltar"))
                   ],
                  ),
                ),
              ),
            ),
    );
  }
}