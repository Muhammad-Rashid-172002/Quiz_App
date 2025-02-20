import 'package:flutter/material.dart';

class Quiz7 extends StatefulWidget {
  const Quiz7({super.key});

  @override
  State<Quiz7> createState() => _Quiz7State();
}

class _Quiz7State extends State<Quiz7> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': '1. What is the longest river in the world?',
      'options': [
        'A) Amazon River',
        'B) Nile River',
        'C) Yangtze River',
        'D) Mississippi River'
      ],
      'answerIndex': 1,
    },
    {
      'question': '2. Which is the largest continent by land area?',
      'options': ['A) Africa', 'B) North America', 'C) Europe', 'D) Asia'],
      'answerIndex': 3,
    },
    {
      'question': '3. Mount Everest is located in which two countries?',
      'options': [
        'A) China and India',
        'B)  India and Nepal',
        'C) Nepal and China',
        'D) Pakistan and China'
      ],
      'answerIndex': 2,
    },
    {
      'question': '4. Which ocean is the largest by surface area?',
      'options': [
        'A) Atlantic Ocean',
        'B) Indian Ocean',
        'C) Pacific Ocean',
        'D) Arctic Ocean'
      ],
      'answerIndex': 2,
    },
    {
      'question': '5. What is the capital city of Canada?',
      'options': ['A) Toronto', 'B) Ottawa', 'C) Vancouver', 'D) Montreal'],
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
                      child: Text('Play Again'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Geography Quiz'),
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
                        child: Container(
                          width: 190,
                          child: ElevatedButton(
                            onPressed: () {
                              checkAnswer(questions[currentQuestionIndex]
                                      ['options']
                                  .indexOf(option));
                            },
                            child: Text(
                              option,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
