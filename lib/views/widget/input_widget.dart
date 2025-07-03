
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {
        super.key, 
        required this.hintText, 
        required this.controller, 
        required this.obscureText
      }
  );

  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          // prefixIcon: const Icon(Icons.email),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),

    
    );
  }
}
