import 'package:flutter/material.dart';

class Quiz2 extends StatefulWidget {
  const Quiz2({super.key});

  @override
  State<Quiz2> createState() => _Quiz2State();
}

class _Quiz2State extends State<Quiz2> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': '1. Which country won the FIFA World Cup in 2018?',
      'options': ['A) Germany', 'B) Argentina', 'C) France ', 'D) Brazil'],
      'answerIndex': 2,
    },
    {
      'question': '2. How many players are there in a standard soccer team?"?',
      'options': ['A) 9', 'B) 10', 'C) 11', 'D) 12'],
      'answerIndex': 2,
    },
    {
      'question': '3. Who is known as the "King of Cricket"?',
      'options': [
        'A) Virat Kohli',
        'B) Don Bradman ',
        'C) Sachin Tendulkar',
        'D) MS Dhoni'
      ],
      'answerIndex': 1,
    },
    {
      'question': '4. Which sport is played at Wimbledon?',
      'options': ['A) Cricket', 'B) Tennis ', 'C) Golf', 'D) Badminton'],
      'answerIndex': 1,
    },
    {
      'question': '5. How many rings are there in the Olympic logo?',
      'options': ['A) 3', 'B) 4', 'C) 5', 'D) 6'],
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
        title: Text('Sports Quiz'),
      ),
      body: Center(
        child: Padding(
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
                Center(
                  child: Text(
                    questions[currentQuestionIndex]['question'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ...List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 190,
                      child: ElevatedButton(
                          onPressed: () => checkAnswer(index),
                          child: Text(questions[currentQuestionIndex]['options']
                              [index])),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
