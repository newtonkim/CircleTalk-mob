import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circle_talk_mob/views/login_page.dart';
import 'package:circle_talk_mob/views/verification_page.dart';
import 'package:circle_talk_mob/controllers/authentication.dart';
import 'package:circle_talk_mob/views/widget/input_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthenticationController _authenticationController = Get.put(AuthenticationController());
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                child: Form(
                  key: _formKey,
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
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text("Register to get started", style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 30),
                      // Name Field
                      InputWidget(
                        hintText: 'Enter your name',
                        controller: _nameController,
                        obscureText: false,
                        prefixIcon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Username Field
                      InputWidget(
                        hintText: 'Enter your username',
                        controller: _usernameController,
                        obscureText: false,
                        prefixIcon: Icons.alternate_email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                            return 'Username can only contain letters, numbers, and underscores';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Email Field
                      InputWidget(
                        hintText: 'Enter your email',
                        controller: _emailController,
                        obscureText: false,
                        prefixIcon: Icons.email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Password Field
                      InputWidget(
                        hintText: 'Password',
                        controller: _passwordController,
                        obscureText: true,
                        prefixIcon: Icons.lock,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$').hasMatch(value)) {
                            return 'Password must include letters and numbers';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      InputWidget(
                        hintText: 'Confirm Password',
                        controller: _confirmPasswordController, // Controller for confirm password
                        obscureText: true,
                        prefixIcon: Icons.lock,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          } else if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      
                      const SizedBox(height: 16),
                      // Sign Up Button
                  Obx(() {
                    return _authenticationController.isLoading.value
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(size.width, 50),
                              backgroundColor: const Color(0xFF164863),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await _authenticationController.register(
                                name: _nameController.text.trim(),
                                username: _usernameController.text.trim(),
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                                confirmPassword: _confirmPasswordController.text.trim(),
                              );
                            } else {
                              Get.snackbar(
                                'Error',
                                'Please fill all fields correctly',
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          },
                          child: const Text("Sign Up", style: TextStyle(color: Colors.white)),
                      );
                  }),
                      const SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          width: size.width * 0.9,
                          child: OutlinedButton.icon(
                            onPressed: () => Get.to(() => const VerificationPage()),
                            icon: Image.asset("assets/images/google_logo.png", height: 20),
                            label: Text(
                              "Sign Up with Google",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: const Color(0xFF164863),
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black,
                              side: BorderSide(color: Colors.grey.shade300),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                              minimumSize: Size(size.width * 0.85, 50),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Login Link
                      Center(
                        child: GestureDetector(
                          onTap: () => Get.to(() => const LoginPage()),
                          child: const Text("Already have an account? Login", style: TextStyle(color: Colors.blue)),
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
      ),
    );
  }
}