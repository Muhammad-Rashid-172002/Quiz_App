import 'package:flutter/material.dart';

class Quiz3 extends StatefulWidget {
  const Quiz3({super.key});

  @override
  State<Quiz3> createState() => _Quiz3State();
}

class _Quiz3State extends State<Quiz3> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': '1. What is the chemical symbol for water?',
      'options': ['A) O₂', 'B) H₂O', 'C) CO₂', 'D) H₂O₂'],
      'answerIndex': 1,
    },
    {
      'question': '2. Which planet is known as the Red Planet?',
      'options': ['A) Venus', 'B)  Mars', 'C) Jupiter', 'D) Mercury'],
      'answerIndex': 1,
    },
    {
      'question':
          '3. What gas do plants absorb from the atmosphere during photosynthesis?',
      'options': [
        'A) Oxygen',
        'B) Carbon Dioxide',
        'C) Nitrogen',
        'D) Hydrogen'
      ],
      'answerIndex': 1,
    },
    {
      'question': '4. What is the hardest natural substance on Earth?',
      'options': ['A) Iron', 'B) Gold', 'C) Diamond', 'D) Quartz'],
      'answerIndex': 2,
    },
    {
      'question': '5. Which organ in the human body produces insulin?',
      'options': ['A) Liver', 'B) Pancreas', 'C) Kidney', 'D) Heart'],
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
                title: Text('Play Again'),
                content: Text('Your score is $score/${questions.length}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Science Quiz'),
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
            ...((questions[currentQuestionIndex]['options'] as List<String>)
                .map((option) {
              return Padding(
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
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}
