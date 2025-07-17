import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
        Get.snackbar('Error', 'Registration failed: ${json.decode(response.body)}',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Color(0xFFD91512),
            colorText: Color(0xFFFFFFFF));
        // print(json.decode(response.body));
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> login({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    try {
      var data = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse(url + 'login'),
        headers: {'Accept': 'application/json'},
        body: data,
      );

      if (response.statusCode == 200) {
        isLoading.value = false;
        print(json.decode(response.body));
      
      } else {
        isLoading.value = false;
        Get.snackbar('Error', 'Login failed: ${json.decode(response.body)}',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Color(0xFFD91512),
            colorText: Color(0xFFFFFFFF));
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

}
