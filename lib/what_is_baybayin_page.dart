import 'package:flutter/material.dart';

class WhatIsBaybayinPage extends StatelessWidget {
  const WhatIsBaybayinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What is Baybayin'),
        backgroundColor: const Color(0xFF8CC63F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- ENGLISH CONTENT ----------
            _buildSectionCard(
              title: 'Definition of Baybayin',
              bulletPoints: const [
                'Wika (language) has two aspects: Wikang Pasalita (spoken) and Wikang Pasulat (written).',
                'Baybayin is a syllabary, not an alphabet; each character represents a syllable.',
                'Originally used for Tagalog, but also refers to other Filipino scripts like Kudlitan and Surat Mangyan.',
              ],
            ),
            const SizedBox(height: 20),
            _buildSectionCard(
              title: 'History of Baybayin',
              bulletPoints: const [
                'Widely used before Spanish colonization on documents, poetry, letters, and trade.',
                'Replaced gradually by the Latin alphabet due to religion, education, and administration.',
                'Today revived as part of cultural preservation, modern art, and popular media.',
              ],
            ),
            const SizedBox(height: 20),
            _buildSectionCard(
              title: 'Cultural Significance of Baybayin',
              bulletPoints: const [
                'Represents Filipino cultural identity and connects to pre-colonial roots.',
                'Aligns naturally with Filipino language, preserving syllabic patterns and sounds.',
                'Jose Rizal emphasized the importance of cultural revival, including Baybayin usage.',
              ],
            ),
            const SizedBox(height: 40),

            // ---------- TAGALOG CONTENT ----------
            _buildSectionCard(
              title: 'Kahulugan ng Baybayin',
              bulletPoints: const [
                'Ang wika ay binubuo ng dalawang aspeto: Wikang Pasalita at Wikang Pasulat.',
                'Ang Baybayin ay isang syllabary, hindi alpabeto; bawat karakter ay pantig.',
                'Bagama’t pangunahing sa Tagalog, tumutukoy rin ito sa ibang sinaunang sulat tulad ng Kudlitan at Surat Mangyan.',
              ],
            ),
            const SizedBox(height: 20),
            _buildSectionCard(
              title: 'Kasaysayan ng Baybayin',
              bulletPoints: const [
                'Malawakang ginamit bago dumating ang Kastila sa dokumento, tula, liham, at kalakalan.',
                'Napalitan ng alpabetong Latin dahil sa relihiyon, edukasyon, at administrasyon.',
                'Binabuhay muli bilang bahagi ng pangangalaga sa kultura at modernong sining.',
              ],
            ),
            const SizedBox(height: 20),
            _buildSectionCard(
              title: 'Kahalagahan sa Kultura ng Baybayin',
              bulletPoints: const [
                'Mahalagang bahagi ng pagkakakilanlan ng Pilipino at nag-uugnay sa pre-kolonyal na pinagmulan.',
                'Mas akma sa wikang Filipino kaysa Latin alphabet, pinapreserba ang pantig at tunog.',
                'Binibigyang-diin ni Jose Rizal ang kahalagahan ng muling pagbuhay ng kultura, kabilang ang Baybayin.',
              ],
            ),

            const SizedBox(height: 40),

            // -----------------------------
            // Back Button
            // -----------------------------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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

  // Helper to build section card with title and bullet points
  Widget _buildSectionCard({
    required String title,
    required List<String> bulletPoints,
  }) {
    return Card(
      color: Colors.green[50]!,
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
}
