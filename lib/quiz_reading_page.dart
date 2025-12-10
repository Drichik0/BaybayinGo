// lib/quiz_reading_page.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizReadingPage extends StatefulWidget {
  const QuizReadingPage({super.key});

  @override
  State<QuizReadingPage> createState() => _QuizReadingPageState();
}

class _QuizReadingPageState extends State<QuizReadingPage> {
  // ----- SOURCE DATA -----
  final List<Map<String, dynamic>> _wordBank = [
    {
      'baybayin': 'Pilipino',
      'latin': 'Filipino/Pilipino',
      'choices': [
        'Filipino/Pilipino',
        'Filipina/Pilipina',
        'Pilipinas',
        'Philippines'
      ]
    },
    {
      'baybayin': 'Pilipins+',
      'latin': 'Pilipinas',
      'choices': [
        'Filipino/Pilipino',
        'Filipina/Pilipina',
        'Pilipinas',
        'Philippines'
      ]
    },
    {
      'baybayin': 'as+y',
      'latin': 'Asia/Asya',
      'choices': ['Atsara', 'Ansaya', 'Asia/Asya', 'Asta']
    },
    {
      'baybayin': 'bk',
      'latin': 'baka',
      'choices': ['baka', 'beki/beke', 'buko', 'bak']
    },
    {
      'baybayin': 'beki',
      'latin': 'beki/beke',
      'choices': ['baka', 'beki/beke', 'buko', 'bak']
    },
    {
      'baybayin': 'mhik',
      'latin': 'mahika',
      'choices': ['nahika', 'mahika', 'nehika', 'mehika']
    },
    {
      'baybayin': 'milg+ro',
      'latin': 'milagro',
      'choices': ['milagro', 'maligno', 'maligo', 'mahika']
    },
    {
      'baybayin': 'kpypan+',
      'latin': 'kapayapaan',
      'choices': ['kalayaan', 'kapayapaan', 'kapighatian', 'kaulayaw']
    },
    {
      'baybayin': 'siN+siN+pri',
      'latin': 'singsing pari',
      'choices': ['singsing', 'sungsung', 'singsing pari', 'singsing puro']
    },
    {
      'baybayin': 'kUlyw+',
      'latin': 'kaulayaw',
      'choices': ['kalayaan', 'kapayapaan', 'kapighatian', 'kaulayaw']
    },
    {
      'baybayin': 'Upo',
      'latin': 'upo/opo',
      'choices': ['upo', 'opo', 'upo/opo']
    },
    {
      'baybayin': 'bn+dil',
      'latin': 'bandila',
      'choices': ['maydila', 'kandila', 'bandila', 'bandido']
    },
    {
      'baybayin': 'wgy+wy+',
      'latin': 'wagayway',
      'choices': ['wagayway', 'watawat', 'wakas', 'ligwak']
    },
    {
      'baybayin': 'tubig+',
      'latin': 'tubig',
      'choices': ['tubig', 'hangin', 'bato', 'apoy']
    },
    {
      'baybayin': 'apoy+',
      'latin': 'apoy',
      'choices': ['tubig', 'hangin', 'bato', 'apoy']
    },
    {
      'baybayin': 'hNin+',
      'latin': 'hangin',
      'choices': ['tubig', 'hangin', 'bato', 'apoy']
    },
    {
      'baybayin': 'bto',
      'latin': 'bato',
      'choices': ['tubig', 'hangin', 'bato', 'apoy']
    },
    {
      'baybayin': 'luplop+',
      'latin': 'lupalop',
      'choices': ['lupa', 'kalupaan', 'lupain', 'lupalop']
    },
    {
      'baybayin': 'sel+pon+',
      'latin': 'cellphone',
      'choices': ['cellphone', 'computer', 'mouse', 'tablet']
    },
    {
      'baybayin': 'tb+let+',
      'latin': 'tablet',
      'choices': ['cellphone', 'computer', 'mouse', 'tablet']
    },
    {
      'baybayin': 'kom+p+yuter+',
      'latin': 'computer',
      'choices': ['cellphone', 'computer', 'mouse', 'tablet']
    },
    {
      'baybayin': 'mw+s+',
      'latin': 'mouse',
      'choices': ['cellphone', 'computer', 'mouse', 'tablet']
    },
    {
      'baybayin': 'Upuan+',
      'latin': 'upuan',
      'choices': ['upo', 'upuan', 'ipo', 'ipuna']
    },
    {
      'baybayin': 'Es+tsiyon+',
      'latin': 'station',
      'choices': ['station', 'ration', 'irritation', 'staycation']
    },
  ];

  final List<Map<String, dynamic>> _phraseBank = [
    {
      'baybayin': 'mgn+dN+ hpon+ mN kk+lse!',
      'latin': 'Magandang hapon, mga kaklase!',
      'choices': [
        'Magandang hapon, mga kaklase!',
        'Magandang umaga, mga kaklase!',
        'Magandang hapon, mga kaibigan!',
        'Magandang umaga, mga kaibigan!'
      ]
    },
    {
      'baybayin': 'huwn+, puwede mo b Iabot+ aN+ tubign+ pr skin+?',
      'latin': 'Juan, puwede mo ba iabot ang tubigan para sakin?',
      'choices': [
        'Juan, puwede mo ba iabot ang tubigan para sakin?',
        'Jose, puwede mo ba iabot ang tubigan para sakin?',
        'Juan, puwede mo ba iabot ang tubig para sakin?',
        'Jose, puwede mo ba iabot ang tubig para sakin?'
      ]
    },
    {
      'baybayin': 'mhl+ ko aN+ akiN+ tinubuaN+ lup',
      'latin': 'mahal ko ang aking tinubuang lupa',
      'choices': [
        'mahal ko ang aking tinubuang bayan',
        'mahal ko ang aking tinubuang lupa',
        'mahal ko ang aking lupa',
        'mahal ko ang aking bayan'
      ]
    },
    {
      'baybayin': 'Is lN+ nmn+ aN+ kIlNn+ ko syo',
      'latin': 'Isa lang naman ang kailangan ko sayo',
      'choices': [
        'Isa lang naman ang ikakalakal ko sayo',
        'Isa lng naman ang kailangan ko sayo',
        'Isa lang naman ako sayo',
        'Isa lang ang gagawin ko sayo'
      ]
    },
  ];

  // ----- QUIZ STATE -----
  late List<_Question> _questions;
  int _current = 0;
  int _score = 0;
  bool _quizStarted = false;
  bool _allowScoring = true;
  List<int> _incorrectIndexes = [];

  @override
  void initState() {
    super.initState();
    _prepareNewQuiz();
  }

  void _prepareNewQuiz({bool fromIncorrectOnly = false}) {
    final random = Random();

    final availableWordIndices = List<int>.generate(_wordBank.length, (i) => i);
    availableWordIndices.shuffle(random);

    final chosenWords = availableWordIndices.take(4).map((i) {
      final item = _wordBank[i];
      return _Question(
        baybayin: item['baybayin'] as String,
        correct: item['latin'] as String,
        choices: List<String>.from(item['choices'] as List),
      );
    }).toList();

    final chosenPhrase = (_phraseBank..shuffle(random)).first;
    final phraseQuestion = _Question(
      baybayin: chosenPhrase['baybayin'] as String,
      correct: chosenPhrase['latin'] as String,
      choices: List<String>.from(chosenPhrase['choices'] as List),
    );

    _questions = [...chosenWords, phraseQuestion];
    _questions.shuffle(random);

    _current = 0;
    _score = 0;
    _quizStarted = true;
    _allowScoring = true;
    _incorrectIndexes = [];

    setState(() {});
  }

  void _onSelectAnswer(String selected) {
    SystemSound.play(SystemSoundType.click);
    final q = _questions[_current];
    final isCorrect =
        selected.trim().toLowerCase() == q.correct.trim().toLowerCase();

    if (isCorrect && _allowScoring) _score++;

    if (!isCorrect) _incorrectIndexes.add(_current);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _FeedbackDialog(
        correct: isCorrect,
        correctText: q.correct,
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
      });
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Complete'),
        content: Text('Your score: $_score / ${_questions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (_incorrectIndexes.isNotEmpty) {
                _startRetryIncorrect();
              } else {
                _prepareNewQuiz();
              }
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

  void _startRetryIncorrect() {
    final incorrectQuestions =
        _incorrectIndexes.map((i) => _questions[i]).toList();
    setState(() {
      _questions = List<_Question>.from(incorrectQuestions);
      _current = 0;
      _allowScoring = false;
      _score = 0;
      _incorrectIndexes = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final total = _questions.length;
    final progress = (total == 0) ? 0.0 : (_current + 1) / total;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading Quiz'),
        backgroundColor: const Color(0xFF8CC63F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Progress & Title
            Card(
              color: Colors.green[50],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Reading Quiz',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8CC63F))),
                    const SizedBox(height: 8),
                    const Text(
                      'Answer multiple choice by tapping the correct translation. This quiz has 4 word questions + 1 phrase question (randomized).',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(value: progress),
                        ),
                        const SizedBox(width: 12),
                        Text('${_current + 1} / $total'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Question
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      _questions[_current].baybayin,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Baybayin',
                        fontSize: 36,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 18),
                    ..._buildChoiceButtons(_questions[_current]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Back & New Quiz Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _prepareNewQuiz,
                    icon: const Icon(Icons.refresh, color: Colors.white),
                    label: const Text('New Quiz',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8CC63F),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    label: const Text('Back',
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8CC63F),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Score display
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Score: $_score',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(width: 12),
                if (!_allowScoring)
                  const Text('(Retry mode — score not counted)',
                      style: TextStyle(fontSize: 12, color: Colors.red)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChoiceButtons(_Question q) {
    final shuffled = List<String>.from(q.choices);
    if (!shuffled
        .any((c) => c.trim().toLowerCase() == q.correct.trim().toLowerCase())) {
      shuffled.add(q.correct);
    }
    shuffled.shuffle(Random());

    return shuffled
        .map((choice) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _onSelectAnswer(choice),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[100],
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(choice, textAlign: TextAlign.left),
                ),
              ),
            ))
        .toList();
  }
}

class _Question {
  final String baybayin;
  final String correct;
  final List<String> choices;

  _Question({
    required this.baybayin,
    required this.correct,
    required this.choices,
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
      title: Text(correct ? 'Correct!' : 'Not quite'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(correct ? 'Great job!' : 'Correct answer:'),
          const SizedBox(height: 8),
          Text(
            correctText,
            style: const TextStyle(fontWeight: FontWeight.bold),
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
