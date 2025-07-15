import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:circle_talk_mob/constants/constants.dart';

class AuthenticationController extends GetxController {
  var isLoading = false.obs;

  Future<void> register({
    required String name,
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    isLoading.value = true;
    try {
      var data = {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      };

      var response = await http.post(
        Uri.parse(url + 'register'),
        headers: {'Accept': 'application/json'},
        body: data,
      );


      if (response.statusCode == 201) {
        isLoading.value = false;
        print(json.decode(response.body));
      
      } else {
        isLoading.value = false;
        print(json.decode(response.body));
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

}
