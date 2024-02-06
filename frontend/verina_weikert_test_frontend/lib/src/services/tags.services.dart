// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:verina_weikert_test_frontend/src/configurations/app.config.dart';
import 'package:verina_weikert_test_frontend/src/controllers/user.controller.dart';
import 'package:verina_weikert_test_frontend/src/models/tags.dart';

class TagsServices {
 Future<List<Tags?>?> getAllTags() async{
  var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorizations': '${Get.find<UserController>().user?.token!}'
    };

    final response = await http.get(Uri.parse('${AppConfig.url}/tags'), headers: header);
    if(response.statusCode == 200){
      final data = json.decode(response.body);
      return List<Tags>.from(data.map((e) => Tags.fromJson(e)));
    }else{ 
      return List<Tags>.empty(growable: true);
    }
 }
 Future<Tags?> getTags(int id) async{
  var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorizations': '${Get.find<UserController>().user?.token!}'
    };

    final response = await http.get(Uri.parse('${AppConfig.url}/tags/$id'), headers: header);
    if(response.statusCode == 200){
      final data = json.decode(response.body);
      return Tags.fromJson(data);
    }else{ 
      return null;
    }
 }
 Future<bool> saveTags(Tags? Tags) async{var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorizations': '${Get.find<UserController>().user?.token!}'
    };

    final response = await http.post(Uri.parse('${AppConfig.url}/tags'), headers: header);
    return response.statusCode == 201;
 }
 Future<bool> deleteTags(int id) async{
  var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorizations': '${Get.find<UserController>().user?.token!}'
    };

    final response = await http.delete(Uri.parse('${AppConfig.url}/tags/$id'), headers: header);
    return response.statusCode == 204;
 }

 Future<bool> updateTags(Tags? tags) async{
  var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorizations': '${Get.find<UserController>().user?.token!}'
    };

    final response = await http.put(Uri.parse('${AppConfig.url}/tags/${tags?.id!}'), headers: header, body: json.encode(tags?.toJson()));
    return response.statusCode == 200;
 }
}