import 'dart:math';
import 'package:flutter/material.dart';

class QuizWritingPage extends StatefulWidget {
  const QuizWritingPage({super.key});

  @override
  State<QuizWritingPage> createState() => _QuizWritingPageState();
}

class _QuizWritingPageState extends State<QuizWritingPage> {
  // ----- SOURCE DATA -----
  final List<Map<String, String>> _allQuestions = [
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

  // ----- QUIZ STATE -----
  late List<_Question> _questions;
  int _current = 0;
  int _score = 0;
  bool _quizStarted = false;
  bool _isRetryMode = false;
  int _originalScore = 0;
  int _originalTotal = 0;
  List<int> _incorrectIndexes = [];
  String _userAnswer = '';

  @override
  void initState() {
    super.initState();
    _prepareNewQuiz();
  }

  void _prepareNewQuiz() {
    final random = Random();
    final available = List<Map<String, String>>.from(_allQuestions)..shuffle(random);
    final chosen = available.take(5).toList();

    _questions = chosen.map((q) => _Question(
      question: q['question']!,
      correctAnswer: q['answer']!,
    )).toList();

    _current = 0;
    _score = 0;
    _isRetryMode = false;
    _originalScore = 0;
    _originalTotal = 0;
    _incorrectIndexes = [];
    _userAnswer = '';

    setState(() {
      _quizStarted = true;
    });
  }

  void _checkAnswer() {
    if (_userAnswer.isEmpty) return;

    final q = _questions[_current];
    String normalize(String s) =>
        s.trim().toLowerCase().replaceAll(RegExp(r'\s+'), ' ');
    final isCorrect = normalize(_userAnswer) == normalize(q.correctAnswer);

    if (isCorrect) _score++;
    if (!isCorrect) _incorrectIndexes.add(_current);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _FeedbackDialog(
        correct: isCorrect,
        correctText: q.correctAnswer,
        onContinue: () {
          Navigator.of(context).pop();
          _nextQuestion();
        },
      ),
    );
  }

  void _nextQuestion() {
    if (_current < _questions.length - 1) {
      setState(() {
        _current++;
        _userAnswer = '';
      });
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    int displayScore;
    int displayTotal;

    if (_isRetryMode) {
      displayScore = _originalScore + _score;
      displayTotal = _originalTotal;
    } else {
      displayScore = _score;
      displayTotal = _questions.length;
    }

    final isPerfect = _incorrectIndexes.isEmpty;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(isPerfect ? 'Perfect Score! 🎉' : 'Quiz Complete'),
        content: Text('Your score: $displayScore / $displayTotal'),
        actions: [
          if (!isPerfect)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _startRetryIncorrect(displayScore, displayTotal);
              },
              child: const Text('Retry incorrect'),
            ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _prepareNewQuiz();
            },
            child: const Text('Try new quiz'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _startRetryIncorrect(int currentTotalScore, int totalQuestions) {
    final incorrectQuestions =
        _incorrectIndexes.map((i) => _questions[i]).toList();
    
    int correctFromThisRound = _score;
    int correctNotRetried = correctFromThisRound;

    setState(() {
      _originalScore = correctNotRetried + (_isRetryMode ? _originalScore : 0);
      _originalTotal = totalQuestions;
      _questions = List<_Question>.from(incorrectQuestions);
      _current = 0;
      _score = 0;
      _isRetryMode = true;
      _incorrectIndexes = [];
      _userAnswer = '';
    });
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
    if (!_quizStarted || _questions.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final total = _questions.length;
    final progress = (total == 0) ? 0.0 : (_current + 1) / total;
    final q = _questions[_current];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Writing Quiz',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2F6B3F),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Progress tracker card
            Card(
              color: const Color(0xFFFFF6C0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Writing Quiz',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2F6B3F))),
                        if (_isRetryMode) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7C85C),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text('RETRY',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2F6B3F))),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isRetryMode
                          ? 'Retrying ${_questions.length} incorrect question(s).'
                          : 'Translate this word into Baybayin using the keyboard below.',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: progress,
                              backgroundColor:
                                  const Color(0xFF7FB77E).withOpacity(0.3),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFF2F6B3F)),
                              minHeight: 8,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text('${_current + 1} / $total',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2F6B3F))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Question text
            Text(
              q.question,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F6B3F)),
            ),
            const SizedBox(height: 12),

            // Input field
            TextField(
              readOnly: true,
              style: const TextStyle(
                fontFamily: 'Baybayin',
                fontSize: 28,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                hintText: 'Ity+p+ aN+ IyoN+ sgot+',
                hintStyle: TextStyle(
                  fontFamily: 'Baybayin',
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              controller: TextEditingController(text: _userAnswer),
            ),
            const SizedBox(height: 16),
            
            // Custom Keyboard
            _buildKeyboard(),
            const SizedBox(height: 16),

            // Back & New Quiz & Submit Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _prepareNewQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F6B3F),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Icon(Icons.refresh, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: _checkAnswer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F6B3F),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Submit', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Score Display
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF6C0),
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: const Color(0xFFF7C85C), width: 1.5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star_rounded,
                          color: Color(0xFFF7C85C), size: 20),
                      const SizedBox(width: 6),
                      Text(
                        _isRetryMode
                            ? 'Score: ${_originalScore + _score} (retry mode)'
                            : 'Score: $_score',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2F6B3F)),
                      ),
                    ],
                  ),
                ),
              ],
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
        final maxButtonsPerRow = 5;
        final totalHorizontalPadding = (maxButtonsPerRow - 1) * 6.0;
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

class _Question {
  final String question;
  final String correctAnswer;

  _Question({
    required this.question,
    required this.correctAnswer,
  });
}

class _FeedbackDialog extends StatelessWidget {
  final bool correct;
  final String correctText;
  final VoidCallback onContinue;

  const _FeedbackDialog({
    required this.correct,
    required this.correctText,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(correct ? 'Correct! ✅' : 'Not quite ❌'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(correct ? 'Great job!' : 'Correct answer in Baybayin:'),
          const SizedBox(height: 8),
          Text(
            correctText,
            style: const TextStyle(
                fontFamily: 'Baybayin',
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F6B3F)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onContinue,
          child: const Text('Continue'),
        ),
      ],
    );
  }
}
