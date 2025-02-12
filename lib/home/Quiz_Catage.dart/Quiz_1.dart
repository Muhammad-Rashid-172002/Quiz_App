import 'package:flutter/material.dart';

class Quiz1 extends StatefulWidget {
  const Quiz1({super.key});

  @override
  State<Quiz1> createState() => _Quiz1State();
}

class _Quiz1State extends State<Quiz1> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': '1. What is the capital of Australia?',
      'options': ['Sydney', 'Melbourne', 'Canberra', 'Perth'],
      'answerIndex': 2,
    },
    {
      'question':
          '2. Who wrote the national anthem of India, "Jana Gana Mana"?',
      'options': [
        'Rabindranath Tagore',
        'Mahatma Gandhi',
        'Bankim Chandra Chattopadhyay',
        'Subhas Chandra Bose'
      ],
      'answerIndex': 0,
    },
    {
      'question': '3. What is the largest planet in our solar system?',
      'options': ['Earth', 'Jupiter', 'Saturn', 'Neptune'],
      'answerIndex': 1,
    },
    {
      'question': '4. Which continent has the most countries?',
      'options': ['Africa', 'Asia', 'Europe', 'South America'],
      'answerIndex': 0,
    },
    {
      'question': '5. Who was the first President of the United States?',
      'options': [
        'Thomas Jefferson',
        'John Adams',
        'George Washington',
        'Abraham Lincoln'
      ],
      'answerIndex': 2,
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
        title: Text('General Knowledge'),
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
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              ...List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () => checkAnswer(index),
                      child: Text(
                          questions[currentQuestionIndex]['options'][index])),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
