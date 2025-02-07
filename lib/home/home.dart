import 'package:flutter/material.dart';
import 'package:quiz_app/home/Categories.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentindex = 0;
  List pages = [homescreen(), quizscreen(), settingscreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
        currentIndex: currentindex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}

class settingscreen extends StatelessWidget {
  const settingscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.amber,
    );
  }
}

class quizscreen extends StatelessWidget {
  const quizscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.amber,
    );
  }
}

class homescreen extends StatelessWidget {
  homescreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 15, 110, 189),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 10),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(100)),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  'assest/a.jpeg',
                                  fit: BoxFit.cover,
                                  height: 60,
                                  width: 60,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Muhammad Rashid',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('Lets start your quiz now!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 77),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 17,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search Topic',
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Quiz Categories',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Categories()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(204, 150, 186, 214),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          'View all',
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [Image.asset('assest/2.jpg'), Text('Sport')],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [Image.asset('assest/3.png'), Text('Science')],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assest/4.jpg'),
                      SizedBox(
                        height: 17,
                      ),
                      Text('History')
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [Image.asset('assest/5.png'), Text('Paint')],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [Image.asset('assest/6.png'), Text('Police')],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Image.asset('assest/7.png'), Text('Geography')],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 10),
              child: Row(
                children: [
                  Text(
                    'Explore Topics',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                      height: 100,
                      width: 70,
                      child: Image.asset('assest/8.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Technology',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Expoler the topic \nbefore starting quiz!'),
                    ],
                  ),
                  SizedBox(
                    width: 65,
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                      height: 100,
                      width: 70,
                      child: Image.asset('assest/9.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Music',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Expoler the topic \nbefore starting quiz!'),
                    ],
                  ),
                  SizedBox(
                    width: 65,
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
