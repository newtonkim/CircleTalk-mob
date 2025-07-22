import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:circle_talk_mob/models/post_model.dart';
import 'package:circle_talk_mob/constants/constants.dart';
import 'package:circle_talk_mob/models/comment_model.dart';

class PostController extends GetxController {
  Rx<List<PostModel>> posts = Rx<List<PostModel>>([]);
  Rx<List<CommentModel>> comments = Rx<List<CommentModel>>([]);
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getAllPosts();
  }

  Future<void> getAllPosts() async {
    // isLoading.value = true;
    try {
      posts.value.clear();
      isLoading.value = true;
      var response = await http.get(
        Uri.parse('${url}feeds'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );
      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body)['feeds'];
        for (var item in content) {
          posts.value.add(PostModel.fromJson(item));
          SizedBox(height: 10);
        }
        // isLoading.value = false;
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Failed to fetch posts: ${json.decode(response.body)['message']}',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color(0xFFD91512),
          colorText: Color(0xFFFFFFFF),
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Failed to fetch posts: $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xFFD91512),
        colorText: Color(0xFFFFFFFF),
      );
    }
  }

  Future<void> createPost({required String content}) async {
    isLoading.value = true;
    try {
      var data = {'content': content};

      var response = await http.post(
        Uri.parse('${url}feed/store'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
        body: data,
      );

      if (response.statusCode == 201) {
        isLoading.value = false;

        Get.snackbar('Success', 'Post created successfully',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Color.fromARGB(255, 30, 207, 66),
            colorText: Color(0xFFFFFFFF));

        getAllPosts();

      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Failed to create post: ${json.decode(response.body)['message']}',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color(0xFFD91512),
          colorText: Color(0xFFFFFFFF),
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Failed to create post: $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xFFD91512),
        colorText: Color(0xFFFFFFFF),
      );
    }
  }

  Future<void> likeAndDislike(id) async {
    isLoading.value = true;
    try {
      var response = await http.post(
        Uri.parse('${url}feed/like/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );  
      var message = json.decode(response.body)['message'];
      if (response.statusCode == 200 && (message == 'Like Post' || message == 'Unlike Post')) {
          isLoading.value = false;
          getAllPosts();
        } else {
          isLoading.value = false;
          Get.snackbar(
            'Error',
            'Failed to like or dislike: $message',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Color(0xFFD91512),
            colorText: Color(0xFFFFFFFF),
          );
        }
    } catch (e) {
      isLoading.value = false;
        Get.snackbar(
          'Error',
          'Failed to like or dislike: $e',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color(0xFFD91512),
          colorText: Color(0xFFFFFFFF),
        );
    }
  }
}
