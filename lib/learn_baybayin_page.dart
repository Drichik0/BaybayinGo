import 'package:flutter/material.dart';
import 'basic_vowels_page.dart';
import 'consonants_vowel_change_page.dart';
import 'consonants_vowel_cancellation_page.dart';
import 'basic_filipino_words_page.dart';
import 'basic_foreign_words_page.dart';
import 'punctuation_page.dart'; // Added Punctuation Page

class LearnBaybayinPage extends StatelessWidget {
  const LearnBaybayinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Baybayin'),
        backgroundColor: const Color(0xFF8CC63F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Baybayin Chart
            const Text(
              'Baybayin Chart',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8CC63F)),
            ),
            const SizedBox(height: 20),

            // Vowel Row
            _buildVowelRow(),
            const SizedBox(height: 30),

            // Default Consonants (all "a" sounds)
            _buildDefaultConsonantRows(),
            const SizedBox(height: 30),

            // Example for Sound Change (using ba)
            const Text(
              'Example: Sound Changes (ba)',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8CC63F)),
            ),
            const SizedBox(height: 10),
            _buildSoundChangeExample(
              ['b', 'be', 'bo', 'b+'], // Baybayin TTF input
              ['ba', 'be/bi', 'bo/bu', 'b'], // Latin alphabet display
            ),

            const SizedBox(height: 40),

            // Rules Section
            const Text(
              'Rules',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8CC63F)),
            ),
            const SizedBox(height: 20),

            // Rules as small cards
            _buildRuleCard(
              'Basic Vowels',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BasicVowelsPage()),
              ),
            ),
            _buildRuleCard(
              'Basic Consonants w/ Vowel Changes',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ConsonantsVowelChangePage()),
              ),
            ),
            _buildRuleCard(
              'Basic Consonants w/ Vowel Cancellation',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const ConsonantsVowelCancellationPage()),
              ),
            ),
            _buildRuleCard(
              'Basic Filipino Words',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BasicFilipinoWordsPage()),
              ),
            ),
            _buildRuleCard(
              'Basic Foreign Words',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BasicForeignWordsPage()),
              ),
            ),
            _buildRuleCard(
              'Punctuation',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PunctuationPage()),
              ),
            ),

            const SizedBox(height: 40),

            // -----------------------------
            // Back Button (larger)
            // -----------------------------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8CC63F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Back",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Small card for each rule button
  Widget _buildRuleCard(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Card(
          color: Colors.green[100],
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.black54)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Vowels row
  Widget _buildVowelRow() {
    final vowelsBaybayin = ['A', 'E', 'O'];
    final vowelsLatin = ['a', 'e/i', 'o/u'];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: vowelsBaybayin
              .map((v) => Text(
                    v,
                    style:
                        const TextStyle(fontFamily: 'Baybayin', fontSize: 36),
                  ))
              .toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: vowelsLatin
              .map((v) => Text(
                    v,
                    style: const TextStyle(fontSize: 24),
                  ))
              .toList(),
        ),
      ],
    );
  }

  // Default consonants rows ("a" sound)
  Widget _buildDefaultConsonantRows() {
    const consonantsBaybayin = [
      'b',
      'k',
      'd',
      'g',
      'h',
      'l',
      'm',
      'n',
      'N',
      'p',
      's',
      't',
      'w',
      'y'
    ];
    const consonantsLatin = [
      'ba',
      'ka',
      'da/ra',
      'ga',
      'ha',
      'la',
      'ma',
      'na',
      'nga',
      'pa',
      'sa',
      'ta',
      'wa',
      'ya'
    ];

    List<Widget> rows = [];
    for (int i = 0; i < consonantsBaybayin.length; i += 5) {
      final end = (i + 5 <= consonantsBaybayin.length)
          ? i + 5
          : consonantsBaybayin.length;
      rows.add(_buildConsonantRow(
          consonantsBaybayin.sublist(i, end), consonantsLatin.sublist(i, end)));
      rows.add(const SizedBox(height: 10));
    }
    return Column(children: rows);
  }

  Widget _buildConsonantRow(
      List<String> baybayinInput, List<String> latinDisplay) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: baybayinInput
              .map((char) => Text(
                    char,
                    style:
                        const TextStyle(fontFamily: 'Baybayin', fontSize: 36),
                  ))
              .toList(),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: latinDisplay
              .map((char) => Text(
                    char,
                    style: const TextStyle(fontSize: 20),
                  ))
              .toList(),
        ),
      ],
    );
  }

  // Sound change example
  Widget _buildSoundChangeExample(
      List<String> baybayinInput, List<String> latinDisplay) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: baybayinInput
              .map((char) => Text(
                    char,
                    style:
                        const TextStyle(fontFamily: 'Baybayin', fontSize: 36),
                  ))
              .toList(),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: latinDisplay
              .map((char) => Text(
                    char,
                    style: const TextStyle(fontSize: 20),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
