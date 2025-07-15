// ignore_for_file: deprecated_member_use
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:circle_talk_mob/views/login_page.dart';
import 'package:circle_talk_mob/views/widget/input_widget.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Image.asset(
                        'assets/images/login_illustration.png',
                        height: 260,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Register to get started",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    // Name Field
                    InputWidget(
                      hintText: 'Enter your name',
                      controller: _nameController,
                      obscureText: false,
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(height: 16),
                    // Username Field
                    InputWidget(
                      hintText: 'Enter your username',
                      controller: _usernameController,
                      obscureText: false,
                      prefixIcon: Icons.alternate_email,
                    ),
                    const SizedBox(height: 16),
                    // Email Field
                    InputWidget(
                      hintText: 'Enter your email',
                      controller: _emailController,
                      obscureText: false,
                      prefixIcon: Icons.email,
                      
                    ),
                    const SizedBox(height: 16),
                    // Password Field
                    InputWidget(
                      hintText: 'Password',
                      controller: _passwordController,
                      obscureText: true,
                      prefixIcon: Icons.lock,
                    ),
                     const SizedBox(height: 16),
                    // Sign Up Button
                    ElevatedButton(
                      onPressed: () {
                        // Add sign up logic here
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width, 50),
                        backgroundColor: const Color(0xFF164863),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Login Link
                    Center(
                      child: GestureDetector(
                        onTap: () => Get.to(() => const LoginPage()),
                        child: const Text(
                          "Already have an account? Login",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}