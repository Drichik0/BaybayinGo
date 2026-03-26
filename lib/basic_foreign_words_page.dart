import 'package:flutter/material.dart';

class BasicForeignWordsPage extends StatelessWidget {
  const BasicForeignWordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Foreign Words',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2F6B3F),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Page Title
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFF2F6B3F),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Basic Foreign Words',
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
            Card(
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
                        'Foreign words that can be translated into Filipino should be translated before writing in Baybayin.'),
                    _buildBullet(
                        'For foreign words without translation, simply spell as pronounced.'),
                    _buildBullet(
                        'Rule of thumb still applies: "Ang siyang bigkas ay siyang baybay."'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Foreign Sounds Table
            _buildSectionTitle('Foreign Sounds'),
            _buildForeignSoundTable(),

            const SizedBox(height: 30),

            // Example Words Table
            _buildSectionTitle('Example Words'),
            _buildExampleWordsTable(),

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

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2F6B3F),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Container(
            width: 60,
            height: 3,
            decoration: BoxDecoration(
              color: const Color(0xFFF7C85C),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  // Foreign Sounds Table
  Widget _buildForeignSoundTable() {
    final List<Map<String, String>> foreignSounds = [
      {'English/Latin': 'fa/pha', 'Filipino': 'pa', 'Baybayin': 'p'},
      {'English/Latin': 'va', 'Filipino': 'ba', 'Baybayin': 'b'},
      {
        'English/Latin': 'ja',
        'Filipino': 'diya/dya/ha',
        'Baybayin': 'diy/d+y/h'
      },
      {'English/Latin': 'za', 'Filipino': 'sa', 'Baybayin': 's'},
      {'English/Latin': 'ca', 'Filipino': 'sa/ka', 'Baybayin': 's/k'},
      {'English/Latin': 'ña', 'Filipino': 'niya/nya', 'Baybayin': 'niy/n+y'},
      {
        'English/Latin': 'qa',
        'Filipino': 'kya/kwa/ka',
        'Baybayin': 'k+y/k+w/k'
      },
      {'English/Latin': 'xa', 'Filipino': 'sa/ka', 'Baybayin': 's/k'},
      {'English/Latin': 'cha', 'Filipino': 'tsa/sya', 'Baybayin': 't+s/s+y'},
      {'English/Latin': 'lla', 'Filipino': 'liya/lya', 'Baybayin': 'liy/l+y'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6C0),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF7C85C), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2F6B3F).withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: foreignSounds
              .map(
                (row) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          row['English/Latin']!,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2F6B3F)),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          row['Filipino']!,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black87),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          row['Baybayin']!,
                          style: const TextStyle(
                              fontFamily: 'Baybayin',
                              fontSize: 23,
                              color: Color(0xFF2F6B3F)),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  // Example Words Table
  Widget _buildExampleWordsTable() {
    final List<Map<String, String>> exampleWords = [
      {'English': 'Freedom', 'Filipino': 'Kalayaan', 'Baybayin': 'klyan+'},
      {'English': 'Gender', 'Filipino': 'Kasarian', 'Baybayin': 'ksrian+'},
      {
        'English': 'Humility',
        'Filipino': 'Pagpapakumbaba',
        'Baybayin': 'pg+ppkum+bb'
      },
      {'English': 'McDo', 'Filipino': 'Makdo', 'Baybayin': 'mk+do'},
      {'English': 'Jollibee', 'Filipino': 'Dyalibi', 'Baybayin': 'd+ylibi'},
      {'English': 'Felicity', 'Filipino': 'Pelisiti', 'Baybayin': 'pelisiti'},
      {'English': 'Alex', 'Filipino': 'Aleks', 'Baybayin': 'alek+s+'},
      {'English': 'Queso', 'Filipino': 'Keso', 'Baybayin': 'keso'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6C0),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF7C85C), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2F6B3F).withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: exampleWords
              .map(
                (row) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          row['English']!,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2F6B3F)),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          row['Filipino']!,
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xFF7FB77E)),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          row['Baybayin']!,
                          style: const TextStyle(
                              fontFamily: 'Baybayin',
                              fontSize: 25,
                              color: Color(0xFF2F6B3F)),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
