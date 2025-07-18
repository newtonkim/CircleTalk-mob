import 'package:flutter/material.dart';
class PostWidget extends StatelessWidget {
  const PostWidget(
    {
      super.key,
      required this.hintText,
      required this.controller
    }
  );

  final String hintText;
  final TextEditingController controller ;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromARGB(179, 170, 179, 180),
        borderRadius: BorderRadius.circular(10),
      ),
    
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}