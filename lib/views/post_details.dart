import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circle_talk_mob/models/post_model.dart';
import 'package:circle_talk_mob/views/widget/input_widget.dart';
import 'package:circle_talk_mob/views/widget/posted_data_widget.dart';
import 'package:circle_talk_mob/controllers/comment_controller.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({super.key, required this.post});

  final PostModel post;

  @override
  State<PostDetails> createState() {
    return _PostDetailsState();
  }
}

class _PostDetailsState extends State<PostDetails> {
  final prefixIcon = Icons.comment;
  final TextEditingController _textEditingController = TextEditingController();
  final CommentController _commentController = Get.put(CommentController());

  String timeAgo(DateTime date) {
    final Duration diff = DateTime.now().difference(date);
    if (diff.inDays >= 1) {
      return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour${diff.inHours > 1 ? 's' : ''} ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute${diff.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'just now';
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _commentController.getAllComments(widget.post.id!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xB316BFC4),
        title: Text(
          widget.post.user!.name!,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostedData(post: widget.post),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 380,
                child: Obx(() {
                  return _commentController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: _commentController.comments.value.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                _commentController.comments.value[index].user!.name!,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _commentController.comments.value[index].body!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    _commentController.comments.value[index].createdAt != null
                                        ? timeAgo(_commentController.comments.value[index].createdAt!)
                                        : '',
                                    style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                }),
              ),
              InputWidget(
                hintText: 'Write a comment...',
                controller: _textEditingController,
                obscureText: false,
                prefixIcon: prefixIcon,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xB316BFC4),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text('Comment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
