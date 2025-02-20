import 'package:flutter/material.dart';

class Quiz5 extends StatefulWidget {
  const Quiz5({super.key});

  @override
  State<Quiz5> createState() => _Quiz5State();
}

class _Quiz5State extends State<Quiz5> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': '1. Who painted the Mona Lisa?',
      'options': [
        'A) Vincent van Gogh',
        'B) Pablo Picasso',
        'C) Leonardo da Vinci',
        'D) Michelangelo'
      ],
      'answerIndex': 2,
    },
    {
      'question':
          '2. What is the primary color that is not a part of the RGB model?',
      'options': ['A) Red', 'B) Blue', 'C) Yellow', 'D) Yellow'],
      'answerIndex': 2,
    },
    {
      'question': '3. Which art movement is Salvador Dalí associated with?',
      'options': [
        'A) Cubism',
        'B) Surrealism',
        'C) Impressionism',
        'D) Baroque'
      ],
      'answerIndex': 1,
    },
    {
      'question': '4. Which famous artist cut off part of his own ear?',
      'options': [
        'A) Claude Monet',
        'B) Vincent van Gogh',
        'C) Edvard Munch',
        ' D) Michelangelo'
      ],
      'answerIndex': 1,
    },
    {
      'question':
          '5. What does "Renaissance" mean in the context of art history?',
      'options': ['Rebirth', 'Revolution', 'Reformation', 'Reconstruction'],
      'answerIndex': 0,
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
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Art Quiz'),
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
      ),
    );
  }
}
