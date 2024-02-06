import 'package:get/get.dart';
import 'package:verina_weikert_test_frontend/src/controllers/tags.controller.dart';

class TagsBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<TagsController>(() => TagsController());
  }
}