import 'package:flutter/material.dart';
import 'login.dart';
import '../home.dart';

const aitTeal = Color(0xFF28D2D1);
const fieldFill = Color(0xFFE0FFFF);
const borderRadius = 5.0;

const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
);

const TextStyle kBodyTextStyle = TextStyle(
  fontSize: 16,
  letterSpacing: 0.5,
);

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 30),

                    Center(
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/6/6b/AIT_Horizontal_Logo_Teal_Black_RGB.png',
                        height: 90,
                      ),
                    ),
                    const SizedBox(height: 80),

                    _buildTextField(emailController, 'Enter your email'),
                    const SizedBox(height: 24),
                    _buildTextField(
                      passwordController,
                      'Enter your password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    _buildTextField(
                      confirmController,
                      'Confirm password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 32),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const HomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: aitTeal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: kButtonTextStyle.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),                   
                  ],
                ),
              ),
            ),

            /// Bottom Text
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: kBodyTextStyle.copyWith(color: Color(0xFF666666)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                    child: Text(
                      'Login Here',
                      style: kBodyTextStyle.copyWith(color: aitTeal),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hintText, {
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: kBodyTextStyle,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: kBodyTextStyle.copyWith(color: aitTeal),
        filled: true,
        fillColor: fieldFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: aitTeal),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: aitTeal),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: aitTeal, width: 2),
        ),
      ),
    );
  }
}
