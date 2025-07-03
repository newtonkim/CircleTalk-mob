// ignore_for_file: deprecated_member_use

import 'package:circle_talk_mob/views/widget/input_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
              onPressed: () {

            }, 
            child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
