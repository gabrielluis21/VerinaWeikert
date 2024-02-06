import 'package:get/get.dart';
import 'package:verina_weikert_test_frontend/src/controllers/clients.controller.dart';

class ClientsBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ClientsController>(() => ClientsController());
  }
}