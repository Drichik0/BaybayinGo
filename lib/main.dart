import 'package:flutter/material.dart';
import 'what_is_baybayin_page.dart';
import 'learn_baybayin_page.dart';
import 'baybayin_quiz_page.dart';
import 'about_app_page.dart';

void main() {
  runApp(const BaybayinApp());
}

class BaybayinApp extends StatelessWidget {
  const BaybayinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baybayin Go!',
      theme: ThemeData(
        primaryColor: const Color(0xFF2F6B3F),
        scaffoldBackgroundColor: Colors.white,
      ),
      builder: (context, child) {
        return Container(
          color: const Color(0xFFE5E5E5), // Soft grey background for web desktop view
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: child ?? const SizedBox.shrink(),
            ),
          ),
        );
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF6C0),
              Colors.white,
            ],
            stops: [0.0, 0.4],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/BGoLogo.png',
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 30),
            const Text(
              'BaybayinGo!',
              style: TextStyle(
                fontSize: 32,
                color: Color(0xFF2F6B3F),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 44,
                  color: Color(0xFF2F6B3F),
                ),
                children: [
                  TextSpan(
                    text: 'By+byin+Go',
                    style: TextStyle(fontFamily: 'Baybayin'),
                  ),
                  TextSpan(
                    text: '!',
                    style: TextStyle(fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                _buildButton(context, 'What is Baybayin', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WhatIsBaybayinPage()),
                  );
                }),
                const SizedBox(height: 20),

                _buildButton(context, 'Learn Baybayin', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LearnBaybayinPage()),
                  );
                }),
                const SizedBox(height: 20),

                _buildButton(context, 'Baybayin Quiz', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BaybayinQuizPage()),
                  );
                }),
                const SizedBox(height: 20),

                _buildButton(context, 'About App', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutAppPage()),
                  );
                }),
              ],
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2F6B3F),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          elevation: 5,
        ),
        child: Text(text),
      ),
    );
  }
}
