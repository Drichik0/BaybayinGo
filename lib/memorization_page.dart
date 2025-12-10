import 'package:flutter/material.dart';
import 'dart:math';

class MemorizationFlashcardsPage extends StatefulWidget {
  const MemorizationFlashcardsPage({super.key});

  @override
  State<MemorizationFlashcardsPage> createState() =>
      _MemorizationFlashcardsPageState();
}

class _MemorizationFlashcardsPageState
    extends State<MemorizationFlashcardsPage> {
  // Flashcards data
  final List<Map<String, String>> _items = [
    {'baybayin': 'a', 'latin': 'a'},
    {'baybayin': 'b', 'latin': 'ba'},
    {'baybayin': 'k', 'latin': 'ka'},
    {'baybayin': 'd', 'latin': 'da / ra'},
    {'baybayin': 'E', 'latin': 'e / i'},
    {'baybayin': 'g', 'latin': 'ga'},
    {'baybayin': 'h', 'latin': 'ha'},
    {'baybayin': 'l', 'latin': 'la'},
    {'baybayin': 'm', 'latin': 'ma'},
    {'baybayin': 'n', 'latin': 'na'},

    // NGA
    {'baybayin': 'N', 'latin': 'nga'},

    {'baybayin': 'O', 'latin': 'o / u'},
    {'baybayin': 'p', 'latin': 'pa'},
    {'baybayin': 's', 'latin': 'sa'},
    {'baybayin': 't', 'latin': 'ta'},
    {'baybayin': 'w', 'latin': 'wa'},
    {'baybayin': 'y', 'latin': 'ya'},

    // e/i marks
    {'baybayin': 'be', 'latin': 'be / bi'},
    {'baybayin': 'ke', 'latin': 'ke / ki'},
    {'baybayin': 'de', 'latin': 'de / di (re / ri)'},
    {'baybayin': 'ge', 'latin': 'ge / gi'},
    {'baybayin': 'he', 'latin': 'he / hi'},
    {'baybayin': 'le', 'latin': 'le / li'},
    {'baybayin': 'me', 'latin': 'me / mi'},
    {'baybayin': 'ne', 'latin': 'ne / ni'},
    {'baybayin': 'Ne', 'latin': 'nge / ngi'},
    {'baybayin': 'pe', 'latin': 'pe / pi'},
    {'baybayin': 'se', 'latin': 'se / si'},
    {'baybayin': 'te', 'latin': 'te / ti'},
    {'baybayin': 'we', 'latin': 'we / wi'},
    {'baybayin': 'ye', 'latin': 'ye / yi'},

    // o/u marks
    {'baybayin': 'bo', 'latin': 'bo / bu'},
    {'baybayin': 'ko', 'latin': 'ko / ku'},
    {'baybayin': 'do', 'latin': 'do / du (ro / ru)'},
    {'baybayin': 'go', 'latin': 'go / gu'},
    {'baybayin': 'ho', 'latin': 'ho / hu'},
    {'baybayin': 'lo', 'latin': 'lo / lu'},
    {'baybayin': 'mo', 'latin': 'mo / mu'},
    {'baybayin': 'no', 'latin': 'no / nu'},
    {'baybayin': 'No', 'latin': 'ngo / ngu'},
    {'baybayin': 'po', 'latin': 'po / pu'},
    {'baybayin': 'so', 'latin': 'so / su'},
    {'baybayin': 'to', 'latin': 'to / tu'},
    {'baybayin': 'wo', 'latin': 'wo / wu'},
    {'baybayin': 'yo', 'latin': 'yo / yu'},

    // special
    {'baybayin': 't+s/s+y', 'latin': 'tsa / cha'},
    {'baybayin': 'd+y/diy', 'latin': 'ja (dya / diya)'},
    {'baybayin': 'n+y/niy', 'latin': 'ña / nya'},
    {'baybayin': 'l+y/liy', 'latin': 'lla'},

    // final consonants
    {'baybayin': 'b+', 'latin': 'b'},
    {'baybayin': 'k+', 'latin': 'k'},
    {'baybayin': 'd+', 'latin': 'd / r'},
    {'baybayin': 'g+', 'latin': 'g'},
    {'baybayin': 'h+', 'latin': 'h'},
    {'baybayin': 'l+', 'latin': 'l'},
    {'baybayin': 'm+', 'latin': 'm'},
    {'baybayin': 'n+', 'latin': 'n'},
    {'baybayin': 'N+', 'latin': 'ng'},
    {'baybayin': 'p+', 'latin': 'p'},
    {'baybayin': 's+', 'latin': 's'},
    {'baybayin': 't+', 'latin': 't'},
    {'baybayin': 'w+', 'latin': 'w'},
    {'baybayin': 'y+', 'latin': 'y'},
  ];

  int currentIndex = 0;
  bool revealed = false;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _items.shuffle(Random());
  }

  void _answer(bool correct) {
    if (correct) {
      setState(() => score++);
    }

    setState(() {
      currentIndex++;
      revealed = false;
    });

    if (currentIndex >= _items.length) {
      _showScoreDialog();
    }
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Flashcards Completed!"),
        content: Text("Your score is $score / ${_items.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= _items.length) {
      return Scaffold(
        appBar: AppBar(backgroundColor: const Color(0xFF8CC63F)),
        body: const Center(child: Text("Loading...")),
      );
    }

    final item = _items[currentIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8CC63F),
        title: const Text("Memorization Flashcards",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // CARD
            GestureDetector(
              onTap: () => setState(() => revealed = true),
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item['baybayin']!,
                      style: const TextStyle(
                        fontFamily: "Baybayin",
                        fontSize: 70,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      revealed ? item['latin']! : "Tap to Reveal",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: revealed ? 28 : 20,
                        color: revealed ? Colors.green : Colors.grey,
                      ),
                    ),
                    if (revealed)
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text("Select below",
                            style: TextStyle(color: Colors.black54)),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // BUTTONS (only show after reveal)
            if (revealed)
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => _answer(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      fixedSize: const Size(180, 45),
                    ),
                    child: const Text("I GOT IT RIGHT",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => _answer(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      fixedSize: const Size(180, 45),
                    ),
                    child: const Text("I GOT IT WRONG",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
