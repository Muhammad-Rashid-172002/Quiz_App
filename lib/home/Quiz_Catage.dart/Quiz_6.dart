import 'package:flutter/material.dart';

class Quiz6 extends StatefulWidget {
  const Quiz6({super.key});

  @override
  State<Quiz6> createState() => _Quiz6State();
}

class _Quiz6State extends State<Quiz6> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': '1. Which is the oldest branch of the military?',
      'options': ['A) Army', 'B) Navy', 'C) Air Force', 'D) National Guard'],
      'answerIndex': 0,
    },
    {
      'question':
          '2. What is the largest military in the world by active personnel?',
      'options': ['A) United States', 'B) Russia', 'C) China', 'D) India'],
      'answerIndex': 2,
    },
    {
      'question': '3. What does NATO stand for?',
      'options': [
        'A) North Atlantic Treaty Organization',
        'B) North American Trade Organization',
        'C) New Armed Tactical Orde',
        'D) National Association of Testing Organizations'
      ],
      'answerIndex': 0,
    },
    {
      'question': '4. Which country has the highest defense budget?',
      'options': ['A) China', 'B) United States', 'C) China', ' D) Pakistan'],
      'answerIndex': 1,
    },
    {
      'question':
          '5. What is the rank of a soldier with three chevrons and three rockers in the US Army?',
      'options': [
        'A) Sergeant',
        'B) Staff Sergeant',
        'C) Master Sergeant',
        'D) Sergeant Major'
      ],
      'answerIndex': 3,
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
                title: Text('Play Again'),
                content: Text('Your score is $score/${questions.length}'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        setState(() {
                          currentQuestionIndex = 0;
                          score = 0;
                        });
                      },
                      child: Text('Quiz Over'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Military Quiz'),
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
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            checkAnswer(questions[currentQuestionIndex]
                                    ['options']
                                .indexOf(option));
                          },
                          child: Text(option),
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
