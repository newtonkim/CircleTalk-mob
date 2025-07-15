// File: views/verification_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                "Verification", 
                style: GoogleFonts.poppins
                (
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                ),
              const SizedBox(height: 16),
              Text(
                "Enter your Verification Code", 
                  style: GoogleFonts.poppins(
                    fontSize: 16, 
                    color: const Color.fromARGB(255, 39, 87, 66)
                    ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 60,
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.timer, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text("04:59", style: GoogleFonts.poppins(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 16),
              Text("We sent a verification code to your email brajoma****@gmail.com.", style: GoogleFonts.poppins(color: Colors.grey)),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Text("I didn’t receive the code? Send again", style: GoogleFonts.poppins(color: Colors.blue)),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(size.width, 50),
                  backgroundColor: const Color(0xFF164863),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Verify", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
