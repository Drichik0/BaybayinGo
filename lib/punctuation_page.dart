import 'package:flutter/material.dart';

class PunctuationPage extends StatelessWidget {
  const PunctuationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Punctuation in Baybayin',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2F6B3F),
        iconTheme: const IconThemeData(color: Colors.white),
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

            // Example Section
            Container(
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
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF7FB77E).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.format_quote_rounded,
                              color: Color(0xFF2F6B3F), size: 20),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Example Sentences',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2F6B3F),
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Color(0xFFF7C85C), thickness: 1.5),
                    const SizedBox(height: 10),

                    // First example
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Kamusta! Ako si Paul, taga-Manila. Ano pangalan mo?',
                            style: TextStyle(fontSize: 22, height: 1.5),
                          ),
                          const SizedBox(height: 12),

                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 20,
                                height: 1.5,
                                color: Color(0xFF2F6B3F),
                              ),
                              children: _buildBaybayinWithPunctuation(
                                'kmus+t! ako si pol+, tg-mnil. ano pNln+ mo?',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Second example
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Magandang umaga, mga kaibigan! Kilala niyo pa ba ako?',
                            style: TextStyle(fontSize: 22, height: 1.5),
                          ),
                          const SizedBox(height: 12),

                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 20,
                                height: 1.5,
                                color: Color(0xFF2F6B3F),
                              ),
                              children: _buildBaybayinWithPunctuation(
                                'mgn+dN+ Umg, mN kIbign+! kill niyo p b ako?',
                              ),
                            ),
                          ),
                        ],
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
                  backgroundColor: const Color(0xFF2F6B3F),
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
      color: const Color(0xFFFFF6C0),
      elevation: 3,
      shadowColor: const Color(0xFF2F6B3F).withOpacity(0.15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
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
                  child: const Icon(Icons.info_rounded,
                      color: Color(0xFF2F6B3F), size: 20),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2F6B3F),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(color: Color(0xFFF7C85C), thickness: 1.5),
            const SizedBox(height: 6),
            ...bulletPoints.map(
              (point) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child:
                          Icon(Icons.circle, size: 7, color: Color(0xFF7FB77E)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(fontSize: 15, height: 1.4),
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
