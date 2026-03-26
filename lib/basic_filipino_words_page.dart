import 'package:flutter/material.dart';

class BasicFilipinoWordsPage extends StatelessWidget {
  const BasicFilipinoWordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Filipino Words',
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
                'Basic Filipino Words',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            // Lecture Notes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Card(
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
                          'The rule of thumb in Baybayin is "Ang siyang bigkas ay siyang baybay"—you spell the word exactly as it is pronounced.'),
                      _buildBullet(
                          'In Baybayin, just like in Filipino, the vowels E and I are interchangeable, and O and U are interchangeable.'),
                      _buildBullet(
                          'Baybayin also follows the traditional Tagalog rule where DA and RA sounds can interchange depending on pronunciation.'),
                      _buildBullet(
                          'These features reflect the natural flow of the Filipino language and how words were historically spoken.'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Word Cards
            _buildWordCard(baybayin: 'byni', latin: 'bayani'),
            const SizedBox(height: 14),
            _buildWordCard(baybayin: 'gin+hw', latin: 'ginhawa'),
            const SizedBox(height: 14),
            _buildWordCard(baybayin: 'alb+', latin: 'alab'),
            const SizedBox(height: 14),
            _buildWordCard(baybayin: 'puso', latin: 'puso'),
            const SizedBox(height: 14),
            _buildWordCard(baybayin: 'td+hn', latin: 'tadhana'),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7C85C).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.swap_horiz_rounded,
                      color: Color(0xFF2F6B3F), size: 22),
                ),
                const SizedBox(width: 10),
                const Flexible(
                  child: Text(
                    'Special Rule: DA ↔ RA Sound Changes',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2F6B3F)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 6, bottom: 14),
              child: Divider(color: Color(0xFFF7C85C), thickness: 2),
            ),

            _buildShiftCard(
              baybayinOld: 'dunoN+',
              latinOld: 'dunong',
              baybayinNew: 'mrunoN+',
              latinNew: 'marunong',
            ),
            const SizedBox(height: 16),
            _buildShiftCard(
              baybayinOld: 'dan+',
              latinOld: 'daan',
              baybayinNew: 'pran+',
              latinNew: 'paraan',
            ),
            const SizedBox(height: 40),

            // Back button
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

  Widget _buildWordCard(
      {required String baybayin, required String latin}) {
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                baybayin,
                style: const TextStyle(
                    fontFamily: 'Baybayin',
                    fontSize: 34,
                    color: Color(0xFF2F6B3F)),
              ),
              const SizedBox(height: 8),
              Text(
                latin,
                style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF7FB77E),
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShiftCard({
    required String baybayinOld,
    required String latinOld,
    required String baybayinNew,
    required String latinNew,
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
            children: [
              Text(baybayinOld,
                  style: const TextStyle(
                      fontFamily: 'Baybayin',
                      fontSize: 30,
                      color: Color(0xFF2F6B3F))),
              const SizedBox(height: 4),
              Text(latinOld,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF7FB77E),
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7C85C).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.arrow_downward,
                    color: Color(0xFF2F6B3F), size: 24),
              ),
              const SizedBox(height: 10),
              Text(baybayinNew,
                  style: const TextStyle(
                      fontFamily: 'Baybayin',
                      fontSize: 30,
                      color: Color(0xFF2F6B3F))),
              const SizedBox(height: 4),
              Text(latinNew,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF7FB77E),
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
