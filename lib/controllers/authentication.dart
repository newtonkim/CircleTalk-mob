import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:circle_talk_mob/views/home.dart';
import 'package:circle_talk_mob/constants/constants.dart';
import 'package:circle_talk_mob/views/widget/sign_up_page.dart';

class AuthenticationController extends GetxController {
  var isLoading = false.obs;
  final token = ''.obs;
  final box = GetStorage();

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
        token.value = json.decode(response.body)['token'];
        box.write('token', token.value);
        Get.offAll(() => const HomePage()); // Navigate to home page after successful registration
      } else {
        isLoading.value = false;
        Get.snackbar('Error', 'Registration failed: ${json.decode(response.body)}',
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
        token.value = json.decode(response.body)['token'];
        box.write('token', token.value);
        Get.offAll(() => const HomePage()); // Navigate to home page after successful login
      } else {
        isLoading.value = false;
        Get.snackbar('Error', 'Login failed: ${json.decode(response.body)['message']}',
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
