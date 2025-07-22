import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circle_talk_mob/models/post_model.dart';
import 'package:circle_talk_mob/views/post_details.dart';
import 'package:circle_talk_mob/controllers/post_controller.dart';
import 'package:http/http.dart' as box;

class PostedData extends StatefulWidget {
  const PostedData(
    {
      super.key,
      required this.post 
    }
  );

  final PostModel post;

  @override
  State<PostedData> createState() => _PostedDataState();
}

class _PostedDataState extends State<PostedData> {

 final PostController _postController = Get.put(PostController());
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      // height: 150,
      decoration: BoxDecoration(
        color: Color.fromARGB(179, 228, 233, 233),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           widget.post.user!.name!,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 5),
          Text(
             widget.post.user!.email!,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height:5),
          Text(
           widget.post.content!,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () async{
                  await _postController.likeAndDislike(widget.post.id!);
                  _postController.getAllPosts();
                },
                icon: Icon(Icons.thumb_up, 
                color: widget.post.liked! ? Colors.blue[400] : Colors.black),
              ),
              IconButton(
                onPressed: () {
                    Get.to(() => PostDetails(
                      post: widget.post
                    ),
                  );
                },
                icon: Icon(Icons.message, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );

  }
}
