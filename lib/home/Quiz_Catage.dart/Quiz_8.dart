import 'package:flutter/material.dart';

class Quiz8 extends StatefulWidget {
  const Quiz8({super.key});

  @override
  State<Quiz8> createState() => _Quiz8State();
}

class _Quiz8State extends State<Quiz8> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': '1. What does "CPU" stand for?',
      'options': [
        'A) Central Processing Unit',
        'B) Computer Personal Unit',
        'C) Central Process Utility',
        'D)  Core Processing Unit'
      ],
      'answerIndex': 0,
    },
    {
      'question': '2. Who is known as the father of the computer?',
      'options': [
        'A) Alan Turing',
        'B) Charles Babbage',
        'C) Bill Gates',
        'D) Steve Jobs'
      ],
      'answerIndex': 1,
    },
    {
      'question': '3. Which company created the Android operating system?',
      'options': ['A) IBM', 'B) Apple', 'C) Microsoft', 'D) Google'],
      'answerIndex': 3,
    },
    {
      'question': '4. What does "HTTP" stand for in web addresses??',
      'options': [
        'A) Hyper Transfer Text Protocol',
        'B) HyperText Transmission Process',
        'C) HyperLink Transfer Protocol',
        ' D) HyperText Transfer Protocol'
      ],
      'answerIndex': 3,
    },
    {
      'question':
          '5. Which social media platform was originally launched as "The Facebook"?',
      'options': ['A) Twitter', 'B) LinkedIn', 'C) Instagram', 'D) Facebook'],
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
      appBar: AppBar(
        title: Text('Technology Quiz'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
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
