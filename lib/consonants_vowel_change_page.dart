import 'package:flutter/material.dart';

class ConsonantsVowelChangePage extends StatelessWidget {
  const ConsonantsVowelChangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consonants with Vowel Changes'),
        backgroundColor: const Color(0xFF8CC63F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Consonants with Vowel Changes',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8CC63F)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
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
                      Text(
                          '• All Baybayin characters by default have an “a” sound.'),
                      Text(
                          '• To change the vowel, we add a kudlit (small mark).'),
                      Text('• A kudlit placed ABOVE changes the vowel to E/I.'),
                      Text('• A kudlit placed BELOW changes the vowel to O/U.'),
                      Text(
                          '• Like Filipino pronunciation, E/I and O/U are interchangeable.'),
                      Text(
                          '• Words like “beke/beki” or “pepe/pipe” are interpreted through context since Baybayin does not mark exact vowels.'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildConsonantExampleCard(
              baybayin: ['B', 'Be', 'Bo'],
              latin: ['ba', 'be/bi', 'bo/bu'],
              exampleBaybayin: ['BK', 'BeKe', 'BoKo'],
              exampleLatin: ['baka', 'beke/beki', 'buko'],
              color: Colors.green[50]!,
            ),
            const SizedBox(height: 20),
            _buildConsonantExampleCard(
              baybayin: ['P', 'Pe'],
              latin: ['pa', 'pe/pi'],
              exampleBaybayin: ['PePe'],
              exampleLatin: ['pipe / pepe'],
              color: Colors.green[50]!,
            ),
            const SizedBox(height: 40),
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

  Widget _buildConsonantExampleCard({
    required List<String> baybayin,
    required List<String> latin,
    required List<String> exampleBaybayin,
    required List<String> exampleLatin,
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
                children: List.generate(baybayin.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Text(baybayin[index],
                            style: const TextStyle(
                                fontFamily: 'Baybayin',
                                fontSize: 36,
                                color: Color(0xFF8CC63F))),
                        const SizedBox(height: 5),
                        Text(latin[index],
                            style: const TextStyle(
                                fontSize: 18, color: Color(0xFF8CC63F))),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(exampleBaybayin.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Text(exampleBaybayin[index],
                            style: const TextStyle(
                                fontFamily: 'Baybayin',
                                fontSize: 32,
                                color: Colors.black)),
                        const SizedBox(height: 5),
                        Text(exampleLatin[index],
                            style: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
