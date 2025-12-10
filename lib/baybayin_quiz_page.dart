import 'package:flutter/material.dart';
import 'memorization_page.dart';
import 'quiz_reading_page.dart';
import 'quiz_writing_page.dart'; // ← add the writing quiz import

class BaybayinQuizPage extends StatelessWidget {
  const BaybayinQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF8CC63F),
        title: const Text(
          "Baybayin Quiz",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildQuizCard(
              context,
              title: "Memorization Flashcards",
              subtitle: "Practice identifying all Baybayin characters.",
              onStart: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MemorizationFlashcardsPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildQuizCard(
              context,
              title: "Reading Quiz",
              subtitle: "Test your Baybayin reading skills.",
              onStart: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuizReadingPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildQuizCard(
              context,
              title: "Writing Quiz",
              subtitle: "Identify the correct Baybayin writing form.",
              onStart: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuizWritingPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required VoidCallback onStart,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8CC63F),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: onStart,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8CC63F),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text("Start"),
            ),
          ),
        ],
      ),
    );
  }
}
