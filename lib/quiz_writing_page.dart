import 'dart:math';
import 'package:flutter/material.dart';

class QuizWritingPage extends StatefulWidget {
  const QuizWritingPage({super.key});

  @override
  State<QuizWritingPage> createState() => _QuizWritingPageState();
}

class _QuizWritingPageState extends State<QuizWritingPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  String _userAnswer = '';
  List<Map<String, String>> _allQuestions = [
    {'question': 'Ano daw', 'answer': 'ano dw+'},
    {'question': 'Kumusta', 'answer': 'komos+t'},
    {'question': 'Magandang Gabi', 'answer': 'mgn+dN+ gbe'},
    {'question': 'Magandang Umaga', 'answer': 'mgn+dN+ omg'},
    {'question': 'Magandang Hapon', 'answer': 'mgn+dN+ hpon+'},
    {'question': 'Ilaw', 'answer': 'Elw+'},
    {'question': 'Dilim', 'answer': 'delem+'},
    {'question': 'Sino may sabi', 'answer': 'seno my+ sbe'},
    {'question': 'Tahanan', 'answer': 'thnn+'},
    {'question': 'Umiibig', 'answer': 'OmeEbeg+'},
    {'question': 'Karagatan', 'answer': 'kdgtn+'},
    {'question': 'Ihip ng hangin', 'answer': 'Ehep+ N+ hNen+'},
    {'question': 'Diretso', 'answer': 'dedet+so'},
    {'question': 'Kaliwa', 'answer': 'klew'},
    {'question': 'Kanan', 'answer': 'knn+'},
    {'question': 'manok', 'answer': 'mnok+'},
    {'question': 'pusuan', 'answer': 'posoan+'},
    {'question': 'kinilaw', 'answer': 'kenelw+'},
    {'question': 'adobo', 'answer': 'adobo'},
    {'question': 'barbero', 'answer': 'bd+bedo'},
    {'question': 'gunting', 'answer': 'gon+teN+'},
    {'question': 'papel', 'answer': 'ppel+'},
    {'question': 'lapis', 'answer': 'lpes+'},
    {'question': 'kultura', 'answer': 'kol+tod'},
    {'question': 'identidad', 'answer': 'Eden+tedd+'},
  ];

  late List<Map<String, String>> _quizQuestions;

  @override
  void initState() {
    super.initState();
    _quizQuestions = List.from(_allQuestions)..shuffle();
    _quizQuestions = _quizQuestions.take(5).toList();
  }

  void _checkAnswer() {
    String correctAnswer = _quizQuestions[_currentQuestionIndex]['answer']!;
    String normalize(String s) =>
        s.trim().toLowerCase().replaceAll(RegExp(r'\s+'), ' ');
    bool isCorrect = normalize(_userAnswer) == normalize(correctAnswer);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCorrect ? 'Correct!' : 'Wrong!'),
        duration: const Duration(seconds: 1),
        backgroundColor: isCorrect ? Colors.green : Colors.red,
      ),
    );

    if (isCorrect) _score++;

    Future.delayed(const Duration(seconds: 1), () {
      if (_currentQuestionIndex < _quizQuestions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _userAnswer = '';
        });
      } else {
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed!'),
        content: Text('Your score: $_score / ${_quizQuestions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _insertCharacter(String char) {
    setState(() {
      _userAnswer += char;
    });
  }

  void _deleteCharacter() {
    setState(() {
      if (_userAnswer.isNotEmpty) {
        _userAnswer = _userAnswer.substring(0, _userAnswer.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = _quizQuestions[_currentQuestionIndex]['question']!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Writing Quiz',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2F6B3F),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1} of ${_quizQuestions.length}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F6B3F)),
            ),
            const SizedBox(height: 6),
            const Text(
              'Translate this word into Baybayin:',
              style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 4),
            Text(
              question,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2F6B3F)),
            ),
            const SizedBox(height: 10),
            TextField(
              readOnly: true,
              style: const TextStyle(
                fontFamily: 'Baybayin',
                fontSize: 24,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                hintText: 'Ity+p+ aN+ IyoN+ sgot+',
                hintStyle: TextStyle(
                  fontFamily: 'Baybayin',
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              controller: TextEditingController(text: _userAnswer),
            ),
            const SizedBox(height: 10),
            _buildKeyboard(),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _checkAnswer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F6B3F),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Submit', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    final List<List<String>> keys = [
      ['b', 'k', 'd', 'g', 'h'],
      ['l', 'm', 'n', 'N', 'p'],
      ['s', 't', 'w', 'y', 'a'],
      ['E', 'O', '+', ',', '.'],
      ['e', 'o', ' ']
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate button size based on available width
        // 5 buttons per row with spacing
        final maxButtonsPerRow = 5;
        final totalHorizontalPadding = (maxButtonsPerRow - 1) * 6.0; // 3px padding each side
        final availableWidth = constraints.maxWidth - totalHorizontalPadding;
        final buttonWidth = (availableWidth / maxButtonsPerRow).clamp(30.0, 60.0);
        final buttonHeight = 42.0;
        final fontSize = buttonWidth * 0.45;

        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ...keys.map((row) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: row.map((key) {
                    final isSpace = key == ' ';
                    // Space button takes up width of 3 normal buttons
                    final keyWidth = isSpace ? buttonWidth * 2 + 6 : buttonWidth;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: SizedBox(
                        width: keyWidth,
                        height: buttonHeight,
                        child: ElevatedButton(
                          onPressed: () => _insertCharacter(key),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFF6C0),
                            foregroundColor: const Color(0xFF2F6B3F),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: const Color(0xFF7FB77E).withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Text(
                            isSpace ? 'Is+pey+s+' : key,
                            style: TextStyle(
                              fontFamily: 'Baybayin',
                              fontSize: isSpace ? fontSize * 0.6 : fontSize,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
            const SizedBox(height: 5),
            SizedBox(
              width: buttonWidth * 2 + 6,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: _deleteCharacter,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Icon(Icons.backspace, size: 20),
              ),
            ),
          ],
        );
      },
    );
  }
}
