import 'package:flutter/material.dart';

class BasicForeignWordsPage extends StatelessWidget {
  const BasicForeignWordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Foreign Words'),
        backgroundColor: const Color(0xFF8CC63F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Page Title
            const Text(
              'Basic Foreign Words',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8CC63F),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Lecture Notes
            Card(
              color: Colors.green[50]!,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Lecture Notes:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8CC63F),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        '• Foreign words that can be translated into Filipino should be translated before writing in Baybayin.'),
                    Text(
                        '• For foreign words without translation, simply spell as pronounced.'),
                    Text(
                        '• Rule of thumb still applies: “Ang siyang bigkas ay siyang baybay.”'),
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

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF8CC63F),
        ),
        textAlign: TextAlign.center,
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

    return Card(
      color: Colors.green[50]!,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: foreignSounds
              .map(
                (row) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          row['English/Latin']!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          row['Filipino']!,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          row['Baybayin']!,
                          style: const TextStyle(
                              fontFamily: 'Baybayin', fontSize: 25),
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

    return Card(
      color: Colors.green[50]!,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: exampleWords
              .map(
                (row) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      Text(
                        row['English']!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        row['Filipino']!,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        row['Baybayin']!,
                        style: const TextStyle(
                            fontFamily: 'Baybayin', fontSize: 25),
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
}
