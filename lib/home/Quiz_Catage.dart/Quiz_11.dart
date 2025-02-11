import 'package:flutter/material.dart';

class Quiz11 extends StatefulWidget {
  const Quiz11({super.key});

  @override
  State<Quiz11> createState() => _Quiz11State();
}

class _Quiz11State extends State<Quiz11> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question':
          '1. Which movie won the first-ever Academy Award for Best Picture in 1929?',
      'options': [
        'A) Gone with the Wind',
        'B) Wings',
        'C) The Godfather',
        'D)  Casablanca'
      ],
      'answerIndex': 1,
    },
    {
      'question':
          '2. Who played the role of Jack Dawson in the movie Titanic (1997)?',
      'options': [
        'A) Brad Pitt',
        'B) Tom Cruise',
        'C) Leonardo DiCaprio',
        'D) Johnny Depp'
      ],
      'answerIndex': 2,
    },
    {
      'question':
          '3. Which Marvel movie became the highest-grossing film of all time (before Avatar reclaimed the spot)?',
      'options': [
        'A) Avengers: Endgame',
        'B) Avengers: Infinity War',
        'C) Avengers: Endgame',
        'D) Black Panther'
      ],
      'answerIndex': 2,
    },
    {
      'question': '4. Who directed the Dark Knight trilogy?',
      'options': [
        'A) Martin Scorsese',
        'B)  Christopher Nolan',
        'C) teven Spielberg',
        ' D) James Cameron'
      ],
      'answerIndex': 1,
    },
    {
      'question': '5. What is the highest-grossing animated film of all time?',
      'options': [
        'A) Frozen II',
        'B) The Lion King (2019)',
        'C) Minions',
        'D) Finding Dory'
      ],
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
        title: Text('Movie Quiz'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
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
