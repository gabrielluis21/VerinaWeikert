import 'package:get/get.dart';
import 'package:verina_weikert_test_frontend/src/controllers/user.controller.dart';

class UserBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<UserController>(() => UserController());
  }
}