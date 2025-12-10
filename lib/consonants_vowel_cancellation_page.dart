import 'package:flutter/material.dart';

class ConsonantsVowelCancellationPage extends StatelessWidget {
  const ConsonantsVowelCancellationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consonants with Vowel Cancellation'),
        backgroundColor: const Color(0xFF8CC63F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Consonants with Vowel Cancellation',
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
                          '• We add pamudpod ")" or ekis "+" to the bottom right of a character to “cancel” or “cross-out” the default “a” sound.'),
                      Text(
                          '• Originally Baybayin did not have consonants without vowels, but Spanish influence introduced the ekis "+". Later styles used the pamudpod ")".'),
                      Text(
                          '• The word "ng" in Filipino must be spelled differently from "nang" in modern Baybayin.'),
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
            const SizedBox(height: 25),
            _buildExampleCard(
              title: "Example 2: Pamudpod and Ekis Usage",
              items: const [
                ["pg+-Ibig+", "pag-ibig (ekis style)"],
                ["pg)-Ibig)", "pag-ibig (pamudpod style)"],
              ],
            ),
            const SizedBox(height: 25),
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
                  backgroundColor: const Color(0xFF8CC63F),
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

  Widget _buildExampleCard(
      {required String title, required List<List<String>> items}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: Colors.green[50]!,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8CC63F))),
              const SizedBox(height: 15),
              Column(
                children: items.map((row) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(row[0],
                            style: const TextStyle(
                                fontFamily: "Baybayin", fontSize: 24)),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(row[1],
                              style: const TextStyle(
                                  fontSize: 16,
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
