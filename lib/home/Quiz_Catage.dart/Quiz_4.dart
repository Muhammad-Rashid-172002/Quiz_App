import 'package:flutter/material.dart';

class Quiz4 extends StatefulWidget {
  const Quiz4({super.key});

  @override
  State<Quiz4> createState() => _Quiz4State();
}

class _Quiz4State extends State<Quiz4> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': '1. Who was the first Governor-General of Pakistan?',
      'options': [
        'A) Liaquat Ali Khan',
        'B) Muhammad Ali Jinnah',
        'C) Allama Iqbal',
        'D) Ayub Khan'
      ],
      'answerIndex': 1,
    },
    {
      'question': '2. When was the first Constitution of Pakistan enacted?',
      'options': ['A) 1956', 'B) 1962', 'C) 1973', 'D) 1985'],
      'answerIndex': 0,
    },
    {
      'question': '3. Who is known as the "Father of the Nation" in Pakistan?',
      'options': [
        'A) Allama Iqbal',
        'B) Liaquat Ali Khan',
        'C) Muhammad Ali Jinnah',
        'D) Zulfikar Ali Bhutto'
      ],
      'answerIndex': 2,
    },
    {
      'question': '4. Which city is the capital of Pakistan?',
      'options': ['A) Karachi', 'B) Lahore', 'C) Islamabad', ' D) Quetta'],
      'answerIndex': 2,
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
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Politics Quiz'),
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
              SizedBox(height: 20),
              ...((questions[currentQuestionIndex]['options'] as List<String>)
                  .asMap()
                  .entries
                  .map((option) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 190,
                          child: ElevatedButton(
                            onPressed: () {
                              checkAnswer(option.key);
                            },
                            child: Text(
                              option.value,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ))
                  .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
