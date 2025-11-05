import 'package:flutter/material.dart';
import '../home.dart';
import 'register.dart';
import 'forgot_password.dart';

const aitTeal = Color(0xFF28D2D1);
const fieldFill = Color(0xFFE0FFFF);
const borderRadius = 5.0;

// Typography Styles 
const TextStyle kHeadlineStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w500,
  letterSpacing: 0,
  height: 1.1,
);

const TextStyle kSubheadlineStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.normal,
  letterSpacing: 0,
  height: 1.15,
);

const TextStyle kBodyTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  letterSpacing: 0.5,
  height: 1.3,
);

const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.5,
  height: 1.2,
);

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 40),

                    /// AIT Logo
                    Center(
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/6/6b/AIT_Horizontal_Logo_Teal_Black_RGB.png',
                        height: 90,
                      ),
                    ),
                    const SizedBox(height: 80),

                    /// Email Field
                    _buildTextField(
                      controller: emailController,
                      hintText: 'Enter your email',
                    ),
                    const SizedBox(height: 24),

                    /// Password Field
                    _buildTextField(
                      controller: passwordController,
                      hintText: 'Enter your password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 8),

                    /// Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ForgetPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot your password',
                          style: kBodyTextStyle.copyWith(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Login Button
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
                          'Login',
                          style: kButtonTextStyle.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    /// Divider
                    Row(
                      children: [
                        const Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Or login with',
                            style: kBodyTextStyle.copyWith(
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        const Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 24),

                    /// Social Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        _SocialButtonImage(
                          imageUrl:
                              'https://cdn-icons-png.flaticon.com/512/174/174857.png', // LinkedIn
                          borderColor: aitTeal,
                        ),
                        _SocialButtonImage(
                          imageUrl:
                              'https://cdn-icons-png.flaticon.com/512/5968/5968764.png', // Facebook
                          borderColor: aitTeal,
                        ),
                        _SocialButtonImage(
                          imageUrl:
                              'https://cdn-icons-png.flaticon.com/512/281/281764.png', // Google
                          borderColor: aitTeal,
                        ),
                        _SocialButtonImage(
                          imageUrl:
                              'https://cdn-icons-png.flaticon.com/512/5968/5968958.png', // Twitter
                          borderColor: aitTeal,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// Register Section at bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: kBodyTextStyle.copyWith(
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Register here',
                      style: kBodyTextStyle.copyWith(
                        color: aitTeal,
                        fontWeight: FontWeight.normal,
                      ),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
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

class _SocialButtonImage extends StatelessWidget {
  final String imageUrl;
  final Color borderColor;

  const _SocialButtonImage({required this.imageUrl, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(imageUrl, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
