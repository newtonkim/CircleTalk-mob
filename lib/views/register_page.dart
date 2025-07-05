// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circle_talk_mob/views/login_page.dart';
import 'package:circle_talk_mob/views/widget/input_widget.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register Page',
                style: GoogleFonts.poppins(
                  fontSize: size * 0.05,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              InputWidget(
                hintText: 'Name',
                controller: _nameController,
                obscureText: false,
              ),
             const SizedBox(height: 20),
              InputWidget(
                hintText: 'Username',
                controller: _usernameController,
                obscureText: false,
              ),
              const SizedBox(height: 20),
              InputWidget(
                hintText: 'Email',
                controller: _emailController,
                obscureText: false,
              ),
              SizedBox(height: 20),
              InputWidget(
                hintText: 'Password',
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () {},
                child: Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    fontSize: size * 0.04,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: GoogleFonts.poppins(
                      fontSize: size * 0.03,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginPage());
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: size * 0.03,
                        color: Colors.blue,
                      ),                      
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
