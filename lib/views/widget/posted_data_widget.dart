import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class PostedData extends StatelessWidget {
  const PostedData({
    super.key,
  });

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
     child:Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           'Post 1', 
           style: GoogleFonts.poppins(
             fontSize: 12,
             fontWeight: FontWeight.w400
           ),
         ),
         Text(
           'Post 2',
           style: GoogleFonts.poppins(
             fontSize: 12,
             fontWeight: FontWeight.w400
           ),
         ),
         SizedBox(height: 10,),
         Text(
           'Post 3',
           style: GoogleFonts.poppins(
             fontSize: 12,
             fontWeight: FontWeight.w400
           ),
         ),
         Row(
           children: [
             IconButton(onPressed: () {},
              icon: Icon(
               Icons.thumb_up,
               color: Colors.green,
              ),
             ),
             IconButton(onPressed: () {}, icon: 
             Icon(
               Icons.message,
               color: Colors.red,
             ),
             ),
           ],
         ),
    
       ],
     ),
     );
  }
}