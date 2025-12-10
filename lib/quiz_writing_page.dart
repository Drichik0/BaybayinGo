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
    const double buttonWidth = 35;
    const double buttonHeight = 40;
    const double fontSize = 18;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Writing Quiz'),
        backgroundColor: const Color(0xFF8CC63F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1} of ${_quizQuestions.length}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Translate this word into Baybayin:',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 5),
            Text(
              question,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            TextField(
              readOnly: true,
              style: const TextStyle(
                fontFamily: 'Baybayin',
                fontSize: 28,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ity+p+ aN+ IyoN+ sgot+',
              ),
              controller: TextEditingController(text: _userAnswer),
            ),
            const SizedBox(height: 15),
            Expanded(
                child: _buildKeyboard(buttonWidth, buttonHeight, fontSize)),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _checkAnswer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8CC63F),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                ),
                child: const Text('Submit', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboard(
      double buttonWidth, double buttonHeight, double fontSize) {
    final List<List<String>> keys = [
      ['b', 'k', 'd', 'g', 'h'],
      ['l', 'm', 'n', 'N', 'p'],
      ['s', 't', 'w', 'y', 'a'],
      ['E', 'O', '+', ',', '.'],
      ['e', 'o', ' '] // last row with space button
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ...keys.map((row) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((key) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: ElevatedButton(
                    onPressed: () => _insertCharacter(key),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      minimumSize: Size(buttonWidth, buttonHeight),
                    ),
                    child: Text(
                      key == ' ' ? 'Is+pey+s+' : key,
                      style: TextStyle(
                        fontFamily: 'Baybayin',
                        fontSize: key == ' ' ? fontSize * 0.7 : fontSize,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }).toList(),
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: _deleteCharacter,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[300],
            foregroundColor: Colors.white,
            minimumSize: Size(buttonWidth + 10, buttonHeight),
          ),
          child: const Icon(Icons.backspace, size: 20),
        ),
      ],
    );
  }
}
