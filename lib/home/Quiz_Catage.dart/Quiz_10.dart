import 'package:flutter/material.dart';

class Quiz10 extends StatefulWidget {
  const Quiz10({super.key});

  @override
  State<Quiz10> createState() => _Quiz10State();
}

class _Quiz10State extends State<Quiz10> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': '1. What is the first pillar of Islam?',
      'options': [
        'A) Salah (Prayer)',
        'B) Shahada (Faith)',
        'C) Zakat (Charity)',
        'D) Hajj (Pilgrimage)'
      ],
      'answerIndex': 1,
    },
    {
      'question': '2. How many times do Muslims pray each day?',
      'options': ['A) 3', 'B) 4', 'C) 2', 'D) 5'],
      'answerIndex': 3,
    },
    {
      'question': '3. Which holy book was revealed to Prophet Muhammad (PBUH)?',
      'options': ['A) Torah', 'B) Bible', 'C) Quran', 'D) Zabur'],
      'answerIndex': 2,
    },
    {
      'question':
          '4. What is the name of the angel who brought revelations to Prophet Muhammad (PBUH)?',
      'options': ['A) Israfil', 'B) Jibreel', 'C) Mikail', 'D) Azrael'],
      'answerIndex': 1,
    },
    {
      'question': '5. In which city was Prophet Muhammad (PBUH) born?',
      'options': ['A) Madinah', 'B) Mecca', 'C) Jerusalem', 'D) Cairo'],
      'answerIndex': 1,
    },
  ];
  void checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex]['answerIndex']) {
      score++;
    }
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Quiz Over'),
          content: Text('Your score: $score/5'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Play Again'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Religious Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 5)
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                questions[currentQuestionIndex]['question'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ...(questions[currentQuestionIndex]['options'] as List<String>)
                  .map((option) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              checkAnswer(questions[currentQuestionIndex]
                                      ['options']
                                  .indexOf(option));
                            },
                            child: Text(option)),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
