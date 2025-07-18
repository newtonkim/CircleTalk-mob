import 'package:circle_talk_mob/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostedData extends StatelessWidget {
  const PostedData(
    {
      super.key,
      required this.post 
    }
  );

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      // height: 150,
      decoration: BoxDecoration(
        color: Color.fromARGB(179, 170, 179, 180),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           post.user!.name!,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 5),
          Text(
             post.user!.email!,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height:5),
          Text(
           post.content!,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.thumb_up, color: Colors.green),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.message, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
