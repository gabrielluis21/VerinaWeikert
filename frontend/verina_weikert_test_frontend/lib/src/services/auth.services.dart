// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:verina_weikert_test_frontend/src/configurations/app.config.dart';
import 'package:verina_weikert_test_frontend/src/models/user.dart';

class AuthServices {
  Future<User> signIn({String? email, String? pwd}) async {
    try {
      var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
      final data = json.encode({
        "name": email!,
        "password": pwd!
      });
      final response = await http.post(Uri.parse('${AppConfig.url}/sessions/signIn'),
      body: data,
      headers: header);
      if(response.statusCode == 200){
        final result = json.decode(response.body);
        return User.fromJson(result);
      }else{
        return User();
      }
    } catch (e) {
      print(e);
      return User();
    }
  }
  
  Future<User> signUp({String? email, String? pwd}) async {
    try {
      final data = json.encode({
        "name": email!,
        "password": pwd!
      });
      final response = await http.post(Uri.parse('${AppConfig.url}/session/signUp'),
      body: data,);
      if(response.statusCode == 200){
        final result = json.decode(response.body);
        return User.fromJson(result);
      }else{
        return User();
      }
    } catch (e) {
      print(e);
      return User();
    }
  }
}