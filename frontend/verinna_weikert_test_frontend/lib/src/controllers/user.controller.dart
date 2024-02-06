import 'package:get/get.dart';
import 'package:verinna_weikert_test_frontend/src/models/user.dart';

class UserController extends GetxController {
  final Rx<User?> _user = User().obs;
  User? get user => _user.value;
  set user(User? value) => _user.value = value;

  void clear() => _user.value = User();
}