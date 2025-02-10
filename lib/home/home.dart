import 'package:flutter/material.dart';
import 'package:quiz_app/home/Categories.dart';
import 'package:quiz_app/login/login.dart';

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
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 15, 110, 189),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(100)),
                  child: Image.asset(
                    'assest/a.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Muhammad Rashid',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'mrashid@gamil.com',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Icon(Icons.person_2_outlined),
              SizedBox(
                width: 10,
              ),
              Text('My Profile'),
              SizedBox(
                width: 170,
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Icon(Icons.task_alt_outlined),
              SizedBox(
                width: 10,
              ),
              Text('My Task'),
              SizedBox(
                width: 180,
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Icon(Icons.done_all_rounded),
              SizedBox(
                width: 10,
              ),
              Text('Done Quzies'),
              SizedBox(
                width: 158,
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Icon(Icons.arrow_circle_up),
              SizedBox(
                width: 10,
              ),
              Text('My Marks'),
              SizedBox(
                width: 176,
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Icon(Icons.settings_outlined),
              SizedBox(
                width: 10,
              ),
              Text('Setting'),
              SizedBox(
                width: 188,
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Icon(
                Icons.logout_outlined,
                color: Colors.green,
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              SizedBox(
                width: 185,
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class quizscreen extends StatelessWidget {
  quizscreen({
    super.key,
  });

  List color = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  List name = [
    'General Knowledge',
    'Sports',
    'Science',
    'Politics',
    'Art',
    'CSS',
    'Technology',
    'Geography',
    'Computer',
    'Music',
    'Religious',
    'Dress',
  ];
  List image = [
    'assest/4.jpg',
    'assest/2.png',
    'assest/3.png',
    'assest/4.jpg',
    'assest/5.png',
    'assest/6.png',
    'assest/7.png',
    'assest/8.png',
    'assest/9.png',
    'assest/10.png',
    'assest/11.png',
    'assest/12.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Quiz',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: color.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 10)
                      ],
                      color: color[index]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: 80,
                          width: 80,
                          child: Image.asset(image[index])),
                      SizedBox(
                        width: 10,
                      ),
                      Text(name[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
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
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                  ),
                  child: Column(
                    children: [
                      Image.asset('assest/2.png'),
                      Text(
                        'Sport',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
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
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 10)
                      ]),
                  child: Column(
                    children: [
                      Container(
                          height: 80,
                          width: 80,
                          child: Image.asset('assest/3.png')),
                      Text(
                        'Science',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
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
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 10)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 80,
                          width: 80,
                          child: Image.asset('assest/14.png')),
                      Text(
                        'History',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
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
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 10)
                      ]),
                  child: Column(
                    children: [
                      Container(
                          height: 80,
                          width: 80,
                          child: Image.asset('assest/5.png')),
                      Text(
                        'Paint',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
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
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 10)
                      ]),
                  child: Column(
                    children: [
                      Container(
                          height: 80,
                          width: 80,
                          child: Image.asset(
                            'assest/13.png',
                          )),
                      Text(
                        'Politics',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
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
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 10)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: 80,
                          width: 80,
                          child: Image.asset('assest/7.png')),
                      Text(
                        'Geography',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
              ),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
              ),
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
