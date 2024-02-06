import 'package:get/get.dart';
import 'package:verinna_weikert_test_frontend/src/models/clients.dart';
import 'package:verinna_weikert_test_frontend/src/services/clients.services.dart';

class ClientsController extends GetxController {

  final ClientServices repository = ClientServices();
  final all = RxList<Clientes?>.empty(growable: true);
  ClientsController();


  Future loadAll()async{}
  Future find(int? id)async{}
  Future add(Clientes? data)async{}
  Future delete(int id)async{}
  Future alter(Clientes? data)async{}

}