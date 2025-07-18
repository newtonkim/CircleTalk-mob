import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circle_talk_mob/views/widget/post_widget.dart';
import 'package:circle_talk_mob/views/widget/posted_data_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _postController = TextEditingController();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostWidget(
                hintText: 'What\'s on your mind?',
                controller: _postController,
              ),
          
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xB316BFC4),
                  elevation: 0,
                ),
                onPressed: () {
          
                }, 
                label: const Text('Post'), 
                icon: const Icon(Icons.send),
              ),
              SizedBox(height: 10),
              // Text('Posts');
             PostedData(),
              SizedBox(height: 10),
             PostedData(),
              SizedBox(height: 10),
             PostedData(),
             SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}



