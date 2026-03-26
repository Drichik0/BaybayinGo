import 'package:flutter/material.dart';

class ConsonantsVowelCancellationPage extends StatelessWidget {
  const ConsonantsVowelCancellationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consonants with Vowel Cancellation',
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
                'Consonants with\nVowel Cancellation',
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
                          'We add pamudpod ")" or ekis "+" to the bottom right of a character to "cancel" or "cross-out" the default "a" sound.'),
                      _buildBullet(
                          'Originally Baybayin did not have consonants without vowels, but Spanish influence introduced the ekis "+". Later styles used the pamudpod ")".'),
                      _buildBullet(
                          'The word "ng" in Filipino must be spelled differently from "nang" in modern Baybayin.'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            _buildExampleCard(
              title: "Example 1: Original vs Modern Baybayin",
              items: const [
                [
                  "Elo",
                  "Ilo – can be read as ilo, ilog, itlog (open interpretation)"
                ],
                ["Elog+", "Ilog (modern) – river"],
                ["mh", "maha – can be read as maha or mahal"],
                ["mhl+", "mahal (modern) – love"],
              ],
            ),
            const SizedBox(height: 20),
            _buildExampleCard(
              title: "Example 2: Pamudpod and Ekis Usage",
              items: const [
                ["pg+-Ibig+", "pag-ibig (ekis style)"],
                ["pg)-Ibig)", "pag-ibig (pamudpod style)"],
              ],
            ),
            const SizedBox(height: 20),
            _buildExampleCard(
              title: "Example 3: ng vs nang",
              items: const [
                ["N+", "ng"],
                ["nN+", "nang"],
              ],
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
                  padding: const EdgeInsets.symmetric(vertical: 14),
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

  Widget _buildExampleCard(
      {required String title, required List<List<String>> items}) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2F6B3F))),
              const Divider(color: Color(0xFFF7C85C), thickness: 1.5),
              const SizedBox(height: 8),
              Column(
                children: items.map((row) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2F6B3F),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(row[0],
                              style: const TextStyle(
                                  fontFamily: "Baybayin",
                                  fontSize: 22,
                                  color: Colors.white)),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(row[1],
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  height: 1.3)),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
