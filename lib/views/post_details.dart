
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:circle_talk_mob/models/post_model.dart';
import 'package:circle_talk_mob/views/widget/input_widget.dart';
import 'package:circle_talk_mob/views/widget/posted_data_widget.dart';
import 'package:circle_talk_mob/controllers/comment_controller.dart';

class PostDetails  extends StatefulWidget{
  const PostDetails(
      {
        super.key,
        required this.post
      }
  );

  final PostModel post;
  
  @override
  State<PostDetails> createState() {
      return _PostDetailsState();
  }
}
class _PostDetailsState extends State<PostDetails>{  
  final prefixIcon = Icons.comment;
  final TextEditingController _textEditingController = TextEditingController();
  final CommentController _commentController = Get.put(CommentController());

@override
  void initState() {
    super.initState();
    _commentController.getAllComments(widget.post.id!);
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
              PostedData(
                post: widget.post
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 380,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Text('Comment');
                }),
                ),
              InputWidget(
                hintText: 'Write a comment...', 
                controller: _textEditingController, 
                obscureText: false, 
                prefixIcon: prefixIcon
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
      )
    );
  }
}



