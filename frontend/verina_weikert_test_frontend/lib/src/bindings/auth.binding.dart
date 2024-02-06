import 'package:get/get.dart';
import 'package:verina_weikert_test_frontend/src/controllers/auth.controller.dart';

class AuthBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<AuthController>(() => AuthController());
  }
}