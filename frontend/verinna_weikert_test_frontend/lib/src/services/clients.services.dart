// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:verinna_weikert_test_frontend/src/configurations/app.config.dart';
import 'package:verinna_weikert_test_frontend/src/controllers/user.controller.dart';
import 'package:verinna_weikert_test_frontend/src/models/clients.dart';

class ClientServices {
 Future<List<Clientes?>?> getAllclients() async{
  var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorizations': '${Get.find<UserController>().user?.token!}'
    };

    final response = await http.get(Uri.parse('${AppConfig.url}/clients'), headers: header);
    if(response.statusCode == 200){
      final data = json.decode(response.body);
      return List<Clientes>.from(data.map((e) => Clientes.fromJson(e)));
    }else{ 
      return List<Clientes>.empty(growable: true);
    }
 }
 Future<Clientes?> getClientes(int id) async{
  var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorizations': '${Get.find<UserController>().user?.token!}'
    };

    final response = await http.get(Uri.parse('${AppConfig.url}/clients/$id'), headers: header);
    if(response.statusCode == 200){
      final data = json.decode(response.body);
      return Clientes.fromJson(data);
    }else{ 
      return null;
    }
 }
 Future<bool> saveclients(Clientes? clients) async{var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorizations': '${Get.find<UserController>().user?.token!}'
    };

    final response = await http.post(Uri.parse('${AppConfig.url}/clients'), headers: header);
    return response.statusCode == 201;
 }
 Future<bool> deleteclients(int id) async{
  var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorizations': '${Get.find<UserController>().user?.token!}'
    };

    final response = await http.delete(Uri.parse('${AppConfig.url}/clients/$id'), headers: header);
    return response.statusCode == 204;
 }

 Future<bool> updateClients(Clientes? clients) async{
  var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorizations': '${Get.find<UserController>().user?.token!}'
    };

    final response = await http.put(Uri.parse('${AppConfig.url}/clients/${clients?.id!}'), headers: header, body: json.encode(clients?.toJson()));
    return response.statusCode == 200;
 }
}