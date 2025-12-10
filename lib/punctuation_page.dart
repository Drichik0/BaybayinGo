import 'package:flutter/material.dart';

class PunctuationPage extends StatelessWidget {
  const PunctuationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Punctuation in Baybayin'),
        backgroundColor: const Color(0xFF8CC63F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSectionCard(
              title: 'Definition and Modern Usage',
              bulletPoints: const [
                'Originally, "|" and "||" are used for short and long pauses while reading Baybayin texts.',
                'They act as signals to breathe while reading.',
                '"|" stands for comma (,) in modern usage',
                '"||" stands for period (.) in modern usage',
                'Other punctuation marks (!, ?, ;, :, -) are adopted as in English.'
              ],
            ),
            const SizedBox(height: 20),

            // Example Section with different fonts
            Card(
              color: Colors.green[50],
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Example Sentences',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8CC63F),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // First English / Latin sentence
                    const Text(
                      'Kamusta! Ako si Paul, taga-Manila. Ano pangalan mo?',
                      style: TextStyle(fontSize: 25, height: 1.5),
                    ),
                    const SizedBox(height: 12),

                    // First Baybayin sentence with selective punctuation
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 20, // Base font size
                          height: 1.5,
                          color: Colors.black,
                        ),
                        children: _buildBaybayinWithPunctuation(
                          'kmus+t! ako si pol+, tg-mnil. ano pNln+ mo?',
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Second English / Latin sentence
                    const Text(
                      'Magandang umaga, mga kaibigan! Kilala niyo pa ba ako?',
                      style: TextStyle(fontSize: 25, height: 1.5),
                    ),
                    const SizedBox(height: 12),

                    // Second Baybayin sentence with selective punctuation
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 20,
                          height: 1.5,
                          color: Colors.black,
                        ),
                        children: _buildBaybayinWithPunctuation(
                          'mgn+dN+ Umg, mN kIbign+! kill niyo p b ako?',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for definition cards
  Widget _buildSectionCard({
    required String title,
    required List<String> bulletPoints,
  }) {
    return Card(
      color: Colors.green[50],
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8CC63F),
              ),
            ),
            const SizedBox(height: 10),
            ...bulletPoints.map(
              (point) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ',
                        style: TextStyle(fontSize: 16, height: 1.5)),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method: Baybayin text with selective punctuation
  List<TextSpan> _buildBaybayinWithPunctuation(String text) {
    const normalPunctuations = ['!', '?', '-', ';', ':'];
    List<TextSpan> spans = [];
    String buffer = '';

    for (int i = 0; i < text.length; i++) {
      final char = text[i];
      if (normalPunctuations.contains(char)) {
        // Flush buffer in Baybayin font
        if (buffer.isNotEmpty) {
          spans.add(TextSpan(
            text: buffer,
            style: const TextStyle(fontFamily: 'Baybayin', fontSize: 34),
          ));
          buffer = '';
        }
        // Add punctuation in normal font
        spans.add(TextSpan(
          text: char,
          style: const TextStyle(fontFamily: 'Roboto', fontSize: 34),
        ));
      } else {
        buffer += char;
      }
    }

    // Flush remaining buffer
    if (buffer.isNotEmpty) {
      spans.add(TextSpan(
        text: buffer,
        style: const TextStyle(fontFamily: 'Baybayin', fontSize: 34),
      ));
    }

    return spans;
  }
}
