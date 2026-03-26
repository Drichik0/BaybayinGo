import 'package:flutter/material.dart';

class WhatIsBaybayinPage extends StatefulWidget {
  const WhatIsBaybayinPage({super.key});

  @override
  State<WhatIsBaybayinPage> createState() => _WhatIsBaybayinPageState();
}

class _WhatIsBaybayinPageState extends State<WhatIsBaybayinPage> {
  bool _isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What is Baybayin',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2F6B3F),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Language Toggle Buttons
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF6C0),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTabButton('English', _isEnglish, () {
                      setState(() => _isEnglish = true);
                    }),
                    _buildTabButton('Filipino', !_isEnglish, () {
                      setState(() => _isEnglish = false);
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Content based on selected language
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _isEnglish ? _buildEnglishContent() : _buildFilipinoContent(),
            ),

            const SizedBox(height: 40),

            // Back Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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

  Widget _buildTabButton(String text, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF2F6B3F) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : const Color(0xFF2F6B3F),
          ),
        ),
      ),
    );
  }

  Widget _buildEnglishContent() {
    return Column(
      key: const ValueKey('english'),
      children: [
        _buildSectionCard(
          title: 'Definition of Baybayin',
          icon: Icons.menu_book_rounded,
          bulletPoints: const [
            'Wika (language) has two aspects: Wikang Pasalita (spoken) and Wikang Pasulat (written).',
            'Baybayin is a syllabary, not an alphabet; each character represents a syllable.',
            'Originally used for Tagalog, but also refers to other Filipino scripts like Kudlitan and Surat Mangyan.',
          ],
        ),
        const SizedBox(height: 20),
        _buildSectionCard(
          title: 'History of Baybayin',
          icon: Icons.history_edu_rounded,
          bulletPoints: const [
            'Widely used before Spanish colonization on documents, poetry, letters, and trade.',
            'Replaced gradually by the Latin alphabet due to religion, education, and administration.',
            'Today revived as part of cultural preservation, modern art, and popular media.',
          ],
        ),
        const SizedBox(height: 20),
        _buildSectionCard(
          title: 'Cultural Significance of Baybayin',
          icon: Icons.diversity_3_rounded,
          bulletPoints: const [
            'Represents Filipino cultural identity and connects to pre-colonial roots.',
            'Aligns naturally with Filipino language, preserving syllabic patterns and sounds.',
            'Jose Rizal emphasized the importance of cultural revival, including Baybayin usage.',
          ],
        ),
      ],
    );
  }

  Widget _buildFilipinoContent() {
    return Column(
      key: const ValueKey('filipino'),
      children: [
        _buildSectionCard(
          title: 'Kahulugan ng Baybayin',
          icon: Icons.menu_book_rounded,
          bulletPoints: const [
            'Ang wika ay binubuo ng dalawang aspeto: Wikang Pasalita at Wikang Pasulat.',
            'Ang Baybayin ay isang syllabary, hindi alpabeto; bawat karakter ay pantig.',
            'Bagama\'t pangunahing sa Tagalog, tumutukoy rin ito sa ibang sinaunang sulat tulad ng Kudlitan at Surat Mangyan.',
          ],
        ),
        const SizedBox(height: 20),
        _buildSectionCard(
          title: 'Kasaysayan ng Baybayin',
          icon: Icons.history_edu_rounded,
          bulletPoints: const [
            'Malawakang ginamit bago dumating ang Kastila sa dokumento, tula, liham, at kalakalan.',
            'Napalitan ng alpabetong Latin dahil sa relihiyon, edukasyon, at administrasyon.',
            'Binabuhay muli bilang bahagi ng pangangalaga sa kultura at modernong sining.',
          ],
        ),
        const SizedBox(height: 20),
        _buildSectionCard(
          title: 'Kahalagahan sa Kultura ng Baybayin',
          icon: Icons.diversity_3_rounded,
          bulletPoints: const [
            'Mahalagang bahagi ng pagkakakilanlan ng Pilipino at nag-uugnay sa pre-kolonyal na pinagmulan.',
            'Mas akma sa wikang Filipino kaysa Latin alphabet, pinapreserba ang pantig at tunog.',
            'Binibigyang-diin ni Jose Rizal ang kahalagahan ng muling pagbuhay ng kultura, kabilang ang Baybayin.',
          ],
        ),
      ],
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required List<String> bulletPoints,
  }) {
    return Card(
      color: const Color(0xFFFFF6C0),
      elevation: 3,
      shadowColor: const Color(0xFF2F6B3F).withOpacity(0.2),
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
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7FB77E).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: const Color(0xFF2F6B3F), size: 22),
                ),
                const SizedBox(width: 12),
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(color: Color(0xFFF7C85C), thickness: 2),
            ),
            ...bulletPoints.map(
              (point) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(Icons.circle,
                          size: 8, color: Color(0xFF7FB77E)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(
                            fontSize: 15, height: 1.5, color: Colors.black87),
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
