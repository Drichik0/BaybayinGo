import 'package:flutter/material.dart';

class ConsonantsVowelChangePage extends StatelessWidget {
  const ConsonantsVowelChangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consonants with Vowel Changes',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2F6B3F),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFF2F6B3F),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Consonants with\nVowel Changes',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
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
                          'All Baybayin characters by default have an "a" sound.'),
                      _buildBullet(
                          'To change the vowel, we add a kudlit (small mark).'),
                      _buildBullet(
                          'A kudlit placed ABOVE changes the vowel to E/I.'),
                      _buildBullet(
                          'A kudlit placed BELOW changes the vowel to O/U.'),
                      _buildBullet(
                          'Like Filipino pronunciation, E/I and O/U are interchangeable.'),
                      _buildBullet(
                          'Words like "beke/beki" or "pepe/pipe" are interpreted through context since Baybayin does not mark exact vowels.'),
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
            ),
            const SizedBox(height: 16),
            _buildConsonantExampleCard(
              baybayin: ['P', 'Pe'],
              latin: ['pa', 'pe/pi'],
              exampleBaybayin: ['PePe'],
              exampleLatin: ['pipe / pepe'],
            ),
            const SizedBox(height: 40),
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

  Widget _buildConsonantExampleCard({
    required List<String> baybayin,
    required List<String> latin,
    required List<String> exampleBaybayin,
    required List<String> exampleLatin,
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
                children: List.generate(baybayin.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2F6B3F),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(baybayin[index],
                              style: const TextStyle(
                                  fontFamily: 'Baybayin',
                                  fontSize: 32,
                                  color: Colors.white)),
                        ),
                        const SizedBox(height: 6),
                        Text(latin[index],
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF7FB77E),
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  );
                }),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(color: Color(0xFFF7C85C), thickness: 1.5),
              ),
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
                                fontSize: 30,
                                color: Color(0xFF2F6B3F))),
                        const SizedBox(height: 5),
                        Text(exampleLatin[index],
                            style: const TextStyle(
                                fontSize: 16, color: Color(0xFF7FB77E)),
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
