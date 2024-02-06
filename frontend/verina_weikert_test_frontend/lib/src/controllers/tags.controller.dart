import 'package:get/get.dart';
import 'package:verina_weikert_test_frontend/src/models/tags.dart';
import 'package:verina_weikert_test_frontend/src/services/tags.services.dart';

class TagsController extends GetxController {

final TagsServices repository = TagsServices();
  final all = RxList<Tags?>.empty(growable: true);
TagsController();

  Future loadAll()async{}
  Future find(int? id)async{}
  Future add(Tags? data)async{}
  Future delete(int id)async{}
  Future alter(Tags? data)async{}
}