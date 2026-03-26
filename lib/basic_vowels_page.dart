import 'package:flutter/material.dart';

class BasicVowelsPage extends StatelessWidget {
  const BasicVowelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Vowels',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2F6B3F),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFF2F6B3F),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Basic Vowels',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            // Lecture notes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Card(
                color: const Color(0xFFFFF6C0),
                elevation: 3,
                shadowColor: const Color(0xFF2F6B3F).withOpacity(0.15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF7FB77E).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.lightbulb_rounded,
                                color: Color(0xFFF7C85C), size: 20),
                          ),
                          const SizedBox(width: 10),
                          const Text('Lecture Notes:',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2F6B3F))),
                        ],
                      ),
                      const Divider(color: Color(0xFFF7C85C), thickness: 1.5),
                      const SizedBox(height: 6),
                      _buildBullet(
                          'Baybayin has three main vowels: A, E, and O.'),
                      _buildBullet(
                          'E and I are interchangeable in everyday spoken Filipino.'),
                      _buildBullet(
                          'O and U are interchangeable in everyday spoken Filipino.'),
                      _buildBullet(
                          'This flexibility reflects natural Filipino pronunciation and spelling.'),
                      _buildBullet(
                          'Helps learners understand how words are pronounced and written in Baybayin.'),
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
            ),
            const SizedBox(height: 16),
            _buildVowelSection(
              baybayin: 'E',
              latin: 'E/I',
              exampleBaybayin: 'InY+',
              exampleLatin: 'Inay',
              exampleEnglish: 'Mother',
            ),
            const SizedBox(height: 16),
            _buildVowelSection(
              baybayin: 'O',
              latin: 'O/U',
              exampleBaybayin: 'UPo',
              exampleLatin: 'Upo',
              exampleEnglish: 'Sit',
            ),
            const SizedBox(height: 40),

            // Back Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F6B3F),
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

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 7, color: Color(0xFF7FB77E)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text,
                style: const TextStyle(fontSize: 15, height: 1.4)),
          ),
        ],
      ),
    );
  }

  Widget _buildVowelSection({
    required String baybayin,
    required String latin,
    required String exampleBaybayin,
    required String exampleLatin,
    required String exampleEnglish,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFF6C0),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFF7C85C),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF2F6B3F).withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2F6B3F),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(baybayin,
                        style: const TextStyle(
                            fontFamily: 'Baybayin',
                            fontSize: 36,
                            color: Colors.white)),
                  ),
                  const SizedBox(width: 16),
                  Text(latin,
                      style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFF2F6B3F),
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(color: Color(0xFFF7C85C), thickness: 1.5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(exampleBaybayin,
                      style: const TextStyle(
                          fontFamily: 'Baybayin',
                          fontSize: 32,
                          color: Color(0xFF2F6B3F))),
                  const SizedBox(height: 10),
                  Text('$exampleLatin — $exampleEnglish',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF7FB77E),
                          fontWeight: FontWeight.w600),
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
