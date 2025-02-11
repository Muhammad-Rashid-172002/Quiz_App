import 'package:flutter/material.dart';

class Quiz12 extends StatefulWidget {
  const Quiz12({super.key});

  @override
  State<Quiz12> createState() => _Quiz12State();
}

class _Quiz12State extends State<Quiz12> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': '1. What is the primary purpose of clothing?',
      'options': [
        'A) Decoration',
        'B) Protection and modesty',
        'C) Social status',
        'D) None of the above'
      ],
      'answerIndex': 1,
    },
    {
      'question': '2. Which fabric is made from the fibers of the flax plant?',
      'options': ['A) Cotton', 'B) Linen', 'C) Silk', 'D) Polyester'],
      'answerIndex': 1,
    },
    {
      'question': '3. What is the traditional Japanese dress called?',
      'options': ['A) Kimono', 'B) Sari', 'C) Hanbok', 'D) Cheongsam'],
      'answerIndex': 0,
    },
    {
      'question': '4.  Which of the following is a synthetic fiber?',
      'options': ['A) Wool', 'B) Silk', 'C) Nylon', 'D) Cotton'],
      'answerIndex': 2,
    },
    {
      'question':
          '5. Which country is famous for its traditional attire called "Sari"?',
      'options': ['A) China', 'B) Japan', 'C) India', 'D) France'],
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
      appBar: AppBar(
        title: Text('Geography Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...(questions[currentQuestionIndex]['options'] as List<String>)
                .map((option) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          checkAnswer(
                            questions[currentQuestionIndex]['options']
                                .indexOf(option),
                          );
                        },
                        child: Text(option),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
