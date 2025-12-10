import 'package:flutter/material.dart';
import 'what_is_baybayin_page.dart';
import 'learn_baybayin_page.dart';
import 'baybayin_quiz_page.dart';

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
        primaryColor: const Color(0xFF8CC63F),
        scaffoldBackgroundColor: Colors.white,
      ),
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
                fontSize: 36,
                color: Color(0xFF8CC63F),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 48,
                  color: Color(0xFF8CC63F),
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

                // NEW — BAYBAYIN QUIZ BUTTON
                _buildButton(context, 'Baybayin Quiz', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BaybayinQuizPage()),
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
          backgroundColor: const Color(0xFF8CC63F),
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
