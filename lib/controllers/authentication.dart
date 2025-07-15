import 'dart:convert';

import 'package:circle_talk_mob/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthenticationController extends GetxController {
  var isLoading = false.obs;

  Future<void> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
      try {
        isLoading.value = true;
    var data = {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };
    var response = await http.post(
      Uri.parse('$url/register'),
      headers: {'Accept': 'application/json'},
      body: data,
    );
    if (response.statusCode == 201) {
      isLoading.value = false;
      debugPrint(jsonDecode(response.body));
    } else {
      isLoading.value = false;
      debugPrint(jsonDecode(response.body));
    }
      } catch (e) {
        isLoading.value = false;
        debugPrint(e.toString());
      }
  }
}
