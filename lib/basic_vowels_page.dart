import 'package:flutter/material.dart';

class BasicVowelsPage extends StatelessWidget {
  const BasicVowelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Vowels'),
        backgroundColor: const Color(0xFF8CC63F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Basic Vowels',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8CC63F)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Lecture notes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                color: Colors.green[50]!,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Lecture Notes:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8CC63F))),
                      SizedBox(height: 10),
                      Text('• Baybayin has three main vowels: A, E, and O.'),
                      Text(
                          '• E and I are interchangeable in everyday spoken Filipino.'),
                      Text(
                          '• O and U are interchangeable in everyday spoken Filipino.'),
                      Text(
                          '• This flexibility reflects natural Filipino pronunciation and spelling.'),
                      Text(
                          '• Helps learners understand how words are pronounced and written in Baybayin.'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            _buildVowelSection(
              baybayin: 'A',
              latin: 'A',
              exampleBaybayin: 'ALMT+',
              exampleLatin: 'Alamat',
              exampleEnglish: 'Legend',
              color: Colors.green[50]!,
            ),
            const SizedBox(height: 20),
            _buildVowelSection(
              baybayin: 'E',
              latin: 'E/I',
              exampleBaybayin: 'InY+',
              exampleLatin: 'Inay',
              exampleEnglish: 'Mother',
              color: Colors.green[50]!,
            ),
            const SizedBox(height: 20),
            _buildVowelSection(
              baybayin: 'O',
              latin: 'O/U',
              exampleBaybayin: 'UPo',
              exampleLatin: 'Upo',
              exampleEnglish: 'Sit',
              color: Colors.green[50]!,
            ),
            const SizedBox(height: 40),

            // Back Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8CC63F),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text("Back",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVowelSection({
    required String baybayin,
    required String latin,
    required String exampleBaybayin,
    required String exampleLatin,
    required String exampleEnglish,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: color,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(baybayin,
                      style: const TextStyle(
                          fontFamily: 'Baybayin',
                          fontSize: 36,
                          color: Color(0xFF8CC63F))),
                  const SizedBox(width: 20),
                  Text(latin,
                      style: const TextStyle(
                          fontSize: 24, color: Color(0xFF8CC63F))),
                ],
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(exampleBaybayin,
                      style: const TextStyle(
                          fontFamily: 'Baybayin',
                          fontSize: 32,
                          color: Colors.black)),
                  const SizedBox(height: 10),
                  Text('$exampleLatin — $exampleEnglish',
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.center),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
