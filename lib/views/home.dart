import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:circle_talk_mob/views/widget/post_widget.dart';
import 'package:circle_talk_mob/controllers/post_controller.dart';
import 'package:circle_talk_mob/views/widget/posted_data_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostController _postController = Get.put(PostController());
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xB316BFC4),
        title: const Text(
          'Circle Talk Forum',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PostWidget(
                hintText: 'What\'s on your mind?',
                controller: _textController,
              ),
              const SizedBox(height: 5),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xB316BFC4),
                  elevation: 0,
                ),
                onPressed: () async {
                  await _postController.createPost(
                    content: _textController.text.trim(),
                  );
                  _textController.clear();
                  _postController.getAllPosts();
                },
                label: Obx(() {
                  return _postController.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('Post');
                }),
                icon: const Icon(Icons.send),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 35,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Posts',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(() {
                return _postController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: List.generate(
                          _postController.posts.value.length,
                          (index) {
                            return Column(
                              children: [
                                PostedData(
                                  post: _postController.posts.value[index],
                                ),
                                if (index <
                                    _postController.posts.value.length - 1)
                                  const SizedBox(
                                    height: 10,
                                  ), // Add spacing between posts
                              ],
                            );
                          },
                        ),
                      );
              }),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
