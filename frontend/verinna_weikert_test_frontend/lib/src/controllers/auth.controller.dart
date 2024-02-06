import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verinna_weikert_test_frontend/src/controllers/user.controller.dart';
import 'package:verinna_weikert_test_frontend/src/services/auth.services.dart';
import 'package:verinna_weikert_test_frontend/src/views/home/home.screen.dart';

class AuthController extends GetxController {

  final AuthServices repository = AuthServices();
  AuthController();

  Future signIn(String email, String pwd) async{
    print('$email : $pwd');
    final result = await repository.signIn(email: email, pwd: pwd);

    if (result.id == null){
      Get.snackbar("Erro", "Falha ao entrar", backgroundColor: Colors.red[400]);
      return;
    }
    Get.snackbar("Erro", "Falha ao entrar", backgroundColor: Colors.red[400]);
    Get.find<UserController>(tag: "currentUser").user = result;
    Get.to(const HomeScren());
  }

  Future signUp(String email, String pwd) async{
    print('$email : $pwd');
    final result = await repository.signIn(email: email, pwd: pwd);

    if (result.id == null){
      Get.snackbar("Erro", "Falha ao entrar", backgroundColor: Colors.red[400]);
      return;
    }
    Get.snackbar("Erro", "Falha ao entrar", backgroundColor: Colors.red[400]);
    Get.find<UserController>(tag: "currentUser").user = result;
    Get.to(const HomeScren());
  }
}