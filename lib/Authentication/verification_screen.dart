import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'new_password_screen.dart';
import 'register.dart';

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

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
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
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 100, 28, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Enter Verification Code',
                        style: kBodyTextStyle,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                          (index) => SizedBox(
                            width: 50,
                            child: TextField(
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                counterText: '',
                                filled: true,
                                fillColor: fieldFill,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(borderRadius),
                                  borderSide: const BorderSide(color: aitTeal),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(borderRadius),
                                  borderSide: const BorderSide(color: aitTeal),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const NewPasswordScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: aitTeal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                          ),
                          child: const Text(
                            'Send',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Resend alert dialog
                      RichText(
                        text: TextSpan(
                          text: "If you didn’t receive a code,  ",
                          style: kBodyTextStyle.copyWith(color: Colors.black, fontSize: 14),
                          children: [
                            TextSpan(
                              text: 'Resend',
                              style: kBodyTextStyle.copyWith(
                                color: aitTeal,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Code Sent'),
                                        content: Text(
                                            'A verification code has been sent to your email.',
                                            style: kBodyTextStyle.copyWith(color: Colors.black, fontSize: 14),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom section: "Don't have an account?"
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: kBodyTextStyle.copyWith(color: const Color(0xFF666666)),
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
                      style: kButtonTextStyle.copyWith(color: aitTeal),
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
}