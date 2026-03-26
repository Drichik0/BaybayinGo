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
  bool _isRetryMode = false;
  int _originalScore = 0;
  int _originalTotal = 0;
  List<int> _incorrectIndexes = [];

  // Pre-shuffled choices per question to avoid reshuffling on rebuild
  Map<int, List<String>> _shuffledChoicesCache = {};

  @override
  void initState() {
    super.initState();
    _prepareNewQuiz();
  }

  void _prepareNewQuiz() {
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
    _isRetryMode = false;
    _originalScore = 0;
    _originalTotal = 0;
    _incorrectIndexes = [];
    _shuffledChoicesCache = {};
    _cacheShuffledChoices();

    setState(() {
      _quizStarted = true;
    });
  }

  void _cacheShuffledChoices() {
    final random = Random();
    _shuffledChoicesCache = {};
    for (int i = 0; i < _questions.length; i++) {
      final q = _questions[i];
      final shuffled = List<String>.from(q.choices);
      if (!shuffled
          .any((c) => c.trim().toLowerCase() == q.correct.trim().toLowerCase())) {
        shuffled.add(q.correct);
      }
      shuffled.shuffle(random);
      _shuffledChoicesCache[i] = shuffled;
    }
  }

  void _onSelectAnswer(String selected) {
    SystemSound.play(SystemSoundType.click);
    final q = _questions[_current];
    final isCorrect =
        selected.trim().toLowerCase() == q.correct.trim().toLowerCase();

    if (isCorrect) _score++;

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
    // Calculate display score
    int displayScore;
    int displayTotal;

    if (_isRetryMode) {
      // In retry mode: original correct + newly correct from retry
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
          // Only show "Retry incorrect" if there are incorrect answers
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
    setState(() {
      // Save the score from correct answers so far
      _originalScore = currentTotalScore - _incorrectIndexes.length +
          (_isRetryMode ? 0 : 0); // already excluded incorrect
      // Actually: the score at this point already only counts correct ones
      _originalScore = _score + (_isRetryMode ? _originalScore : 0) -
          _incorrectIndexes.length; // wrong
    });

    // Simpler logic: displayScore at end was (originalScore + retryScore)
    // originalScore = correct answers NOT in the retry set
    // retryScore = correct answers in the retry round
    int correctFromThisRound = _score; // includes both retry correct and original correct
    int incorrectCount = _incorrectIndexes.length;
    int correctNotRetried = correctFromThisRound; // score only counts correct answers

    setState(() {
      _originalScore = correctNotRetried;
      _originalTotal = totalQuestions;
      _questions = List<_Question>.from(incorrectQuestions);
      _current = 0;
      _score = 0;
      _isRetryMode = true;
      _incorrectIndexes = [];
      _shuffledChoicesCache = {};
      _cacheShuffledChoices();
    });
  }

  @override
  Widget build(BuildContext context) {
    final total = _questions.length;
    final progress = (total == 0) ? 0.0 : (_current + 1) / total;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading Quiz',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2F6B3F),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Progress & Title
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
                        const Text('Reading Quiz',
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
                          ? 'Retrying ${_questions.length} incorrect question(s). Correct answers will be added to your score.'
                          : 'Answer multiple choice by tapping the correct translation. This quiz has 4 word questions + 1 phrase question (randomized).',
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
            const SizedBox(height: 20),

            // Question
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                      color: const Color(0xFFF7C85C).withOpacity(0.5),
                      width: 1.5)),
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
                        color: Color(0xFF2F6B3F),
                      ),
                    ),
                    const SizedBox(height: 18),
                    ..._buildChoiceButtons(_current),
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
                      backgroundColor: const Color(0xFF2F6B3F),
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
                      backgroundColor: const Color(0xFF2F6B3F),
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

  List<Widget> _buildChoiceButtons(int questionIndex) {
    // Use cached shuffled choices to avoid reshuffling on rebuild
    final choices = _shuffledChoicesCache[questionIndex] ?? [];

    return choices
        .map((choice) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _onSelectAnswer(choice),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFF6C0),
                    foregroundColor: const Color(0xFF2F6B3F),
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
      title: Text(correct ? 'Correct! ✅' : 'Not quite ❌'),
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
