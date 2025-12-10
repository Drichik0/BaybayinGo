import 'package:flutter/material.dart';

class BasicFilipinoWordsPage extends StatelessWidget {
  const BasicFilipinoWordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Filipino Words'),
        backgroundColor: const Color(0xFF8CC63F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Basic Filipino Words',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8CC63F),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Lecture Notes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                color: Colors.green[50]!,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Lecture Notes:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8CC63F),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                          '• The rule of thumb in Baybayin is “Ang siyang bigkas ay siyang baybay”—you spell the word exactly as it is pronounced.'),
                      Text(
                          '• In Baybayin, just like in Filipino, the vowels E and I are interchangeable, and O and U are interchangeable.'),
                      Text(
                          '• Baybayin also follows the traditional Tagalog rule where DA and RA sounds can interchange depending on pronunciation.'),
                      Text(
                          '• These features reflect the natural flow of the Filipino language and how words were historically spoken.'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Word Cards
            _buildWordCard(
                baybayin: 'byni', latin: 'bayani', color: Colors.green[50]!),
            const SizedBox(height: 20),
            _buildWordCard(
                baybayin: 'gin+hw', latin: 'ginhawa', color: Colors.green[50]!),
            const SizedBox(height: 20),
            _buildWordCard(
                baybayin: 'alb+', latin: 'alab', color: Colors.green[50]!),
            const SizedBox(height: 20),
            _buildWordCard(
                baybayin: 'puso', latin: 'puso', color: Colors.green[50]!),
            const SizedBox(height: 20),
            _buildWordCard(
                baybayin: 'td+hn', latin: 'tadhana', color: Colors.green[50]!),
            const SizedBox(height: 30),

            const Text(
              'Special Rule: DA ↔ RA Sound Changes',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8CC63F)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),

            _buildShiftCard(
              baybayinOld: 'dunoN+',
              latinOld: 'dunong',
              baybayinNew: 'mrunoN+',
              latinNew: 'marunong',
              color: Colors.green[50]!,
            ),
            const SizedBox(height: 20),
            _buildShiftCard(
              baybayinOld: 'dan+',
              latinOld: 'daan',
              baybayinNew: 'pran+',
              latinNew: 'paraan',
              color: Colors.green[50]!,
            ),
            const SizedBox(height: 40),

            // Back button
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

  Widget _buildWordCard(
      {required String baybayin, required String latin, required Color color}) {
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
              Text(
                baybayin,
                style: const TextStyle(
                    fontFamily: 'Baybayin', fontSize: 34, color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                latin,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShiftCard({
    required String baybayinOld,
    required String latinOld,
    required String baybayinNew,
    required String latinNew,
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
            children: [
              Text(baybayinOld,
                  style: const TextStyle(
                      fontFamily: 'Baybayin',
                      fontSize: 32,
                      color: Colors.black)),
              const SizedBox(height: 6),
              Text(latinOld,
                  style: const TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 14),
              const Icon(Icons.arrow_downward, color: Colors.grey, size: 26),
              const SizedBox(height: 14),
              Text(baybayinNew,
                  style: const TextStyle(
                      fontFamily: 'Baybayin',
                      fontSize: 32,
                      color: Colors.black)),
              const SizedBox(height: 6),
              Text(latinNew,
                  style: const TextStyle(fontSize: 16, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
