// File: views/login_page.dart

import 'register_page.dart';
import 'package:get/get.dart';
import 'verification_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Image.asset('assets/images/login_illustration.png', height: 160),
                ),
                const SizedBox(height: 30),
                Text("Welcome back!", style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("Let's login for explore continues", style: GoogleFonts.poppins(color: Colors.grey)),
                const SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixText: 'Forgot password?',
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => Get.to(() => const VerificationPage()),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(size.width, 50),
                    backgroundColor: const Color(0xFF164863),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Sign In", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 20),
                Center(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Image.asset("assets/images/google_logo.png", height: 20),
                    label: const Text("Sign Up with Google"),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    GestureDetector(
                      onTap: () => Get.to(() => const RegisterPage()),
                      child: const Text("Sign Up here", style: TextStyle(color: Colors.blue)),
                    )
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
