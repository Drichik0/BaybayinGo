import 'package:flutter/material.dart';
import 'basic_vowels_page.dart';
import 'consonants_vowel_change_page.dart';
import 'consonants_vowel_cancellation_page.dart';
import 'basic_filipino_words_page.dart';
import 'basic_foreign_words_page.dart';
import 'punctuation_page.dart';

class LearnBaybayinPage extends StatelessWidget {
  const LearnBaybayinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Baybayin',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2F6B3F),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Baybayin Chart
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF6C0),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2F6B3F).withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: const Color(0xFFF7C85C),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF7FB77E).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.grid_view_rounded,
                            color: Color(0xFF2F6B3F), size: 24),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Baybayin Chart',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2F6B3F)),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(color: Color(0xFFF7C85C), thickness: 2),
                  ),

                  // Vowel Row
                  _buildVowelRow(),
                  const SizedBox(height: 24),

                  // Default Consonants
                  _buildDefaultConsonantRows(),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Example for Sound Change
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF6C0),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2F6B3F).withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Example: Sound Changes (ba)',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2F6B3F)),
                  ),
                  const SizedBox(height: 12),
                  _buildSoundChangeExample(
                    ['b', 'be', 'bo', 'b+'],
                    ['ba', 'be/bi', 'bo/bu', 'b'],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 36),

            // Rules Section Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7C85C).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.auto_stories_rounded,
                      color: Color(0xFF2F6B3F), size: 24),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Rules',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2F6B3F)),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 6, bottom: 16),
              child: Divider(color: Color(0xFFF7C85C), thickness: 2),
            ),

            // Rules as cards
            _buildRuleCard(
              'Basic Vowels',
              Icons.text_fields_rounded,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BasicVowelsPage()),
              ),
            ),
            _buildRuleCard(
              'Basic Consonants w/ Vowel Changes',
              Icons.swap_horiz_rounded,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ConsonantsVowelChangePage()),
              ),
            ),
            _buildRuleCard(
              'Basic Consonants w/ Vowel Cancellation',
              Icons.cancel_rounded,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const ConsonantsVowelCancellationPage()),
              ),
            ),
            _buildRuleCard(
              'Basic Filipino Words',
              Icons.translate_rounded,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BasicFilipinoWordsPage()),
              ),
            ),
            _buildRuleCard(
              'Basic Foreign Words',
              Icons.language_rounded,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BasicForeignWordsPage()),
              ),
            ),
            _buildRuleCard(
              'Punctuation',
              Icons.more_horiz_rounded,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PunctuationPage()),
              ),
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

  // Rule card with icon
  Widget _buildRuleCard(String title, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFF6C0),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2F6B3F).withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
            border: Border.all(
              color: const Color(0xFF7FB77E).withOpacity(0.4),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7FB77E).withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: const Color(0xFF2F6B3F), size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2F6B3F),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7C85C).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.arrow_forward_ios,
                      size: 14, color: Color(0xFF2F6B3F)),
                ),
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
                    style: const TextStyle(
                        fontFamily: 'Baybayin',
                        fontSize: 36,
                        color: Color(0xFF2F6B3F)),
                  ))
              .toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: vowelsLatin
              .map((v) => Text(
                    v,
                    style: const TextStyle(
                        fontSize: 20, color: Color(0xFF7FB77E)),
                  ))
              .toList(),
        ),
      ],
    );
  }

  // Default consonants rows
  Widget _buildDefaultConsonantRows() {
    const consonantsBaybayin = [
      'b', 'k', 'd', 'g', 'h', 'l', 'm', 'n', 'N', 'p', 's', 't', 'w', 'y'
    ];
    const consonantsLatin = [
      'ba', 'ka', 'da/ra', 'ga', 'ha', 'la', 'ma', 'na', 'nga', 'pa', 'sa',
      'ta', 'wa', 'ya'
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
                    style: const TextStyle(
                        fontFamily: 'Baybayin',
                        fontSize: 36,
                        color: Color(0xFF2F6B3F)),
                  ))
              .toList(),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: latinDisplay
              .map((char) => Text(
                    char,
                    style: const TextStyle(
                        fontSize: 18, color: Color(0xFF7FB77E)),
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
                    style: const TextStyle(
                        fontFamily: 'Baybayin',
                        fontSize: 36,
                        color: Color(0xFF2F6B3F)),
                  ))
              .toList(),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: latinDisplay
              .map((char) => Text(
                    char,
                    style: const TextStyle(
                        fontSize: 18, color: Color(0xFF7FB77E)),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
