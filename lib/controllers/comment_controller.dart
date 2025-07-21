import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:circle_talk_mob/constants/constants.dart';
import 'package:circle_talk_mob/models/comment_model.dart';

class CommentController extends GetxController {
  Rx<List<CommentModel>> comments = Rx<List<CommentModel>>([]);
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // TODO: Provide a valid id value here or pass it as a parameter
    // getAllComments(id);
  }

    Future<void> getAllComments(id) async {
    // isLoading.value = true;
    try {
      comments.value.clear();
      isLoading.value = true;
      var response = await http.get(
        Uri.parse('${url}feed/comments/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );
      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body)['comments'];
        for (var item in content) {
          comments.value.add(CommentModel.fromJson(item));
        }
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Failed to fetch comments: ${json.decode(response.body)['message']}',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color(0xFFD91512),
          colorText: Color(0xFFFFFFFF),
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Failed to fetch comments: $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xFFD91512),
        colorText: Color(0xFFFFFFFF),
      );
    }
  }
}
