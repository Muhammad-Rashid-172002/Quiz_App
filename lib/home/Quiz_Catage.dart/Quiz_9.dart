import 'package:flutter/material.dart';

class Quiz9 extends StatefulWidget {
  const Quiz9({super.key});

  @override
  State<Quiz9> createState() => _Quiz9State();
}

class _Quiz9State extends State<Quiz9> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': '1. Who is known as the "King of Pop"?',
      'options': [
        'A) Elvis Presley',
        'B) Michael Jackson',
        'C) Freddie Mercury',
        'D) Prince'
      ],
      'answerIndex': 1,
    },
    {
      'question': '2. Which musical instrument has 88 keys?',
      'options': ['A) Violin', 'B) Guitar', 'C) Piano', 'D) Piano Accordion'],
      'answerIndex': 2,
    },
    {
      'question': '3. Which singer released the hit song Rolling in the Deep?',
      'options': ['A) Adele', 'B) Taylor Swift', 'C) Beyoncé', 'D) Rihanna'],
      'answerIndex': 0,
    },
    {
      'question': '4. Who composed Für Elise?',
      'options': ['A) Mozart', 'B) Beethoven', 'C) Bach', ' D) Chopin'],
      'answerIndex': 1,
    },
    {
      'question': '5. What is the national musical instrument of Scotland?',
      'options': ['A) Violin', 'B) Bagpipes', 'C) Harp', 'D) Accordion'],
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
                        setState(() {
                          currentQuestionIndex = 0;
                          Navigator.pop(context);
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
      appBar: AppBar(
        title: Text('Music Quiz'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              questions[currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ...(questions[currentQuestionIndex]['options'] as List<String>)
              .map((option) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          checkAnswer(questions[currentQuestionIndex]['options']
                              .indexOf(option));
                        },
                        child: Text(option)),
                  ))
        ],
      ),
    );
  }
}
