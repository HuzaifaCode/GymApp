import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> imagePaths = [
    'assets/images/G9.jpg',
    'assets/images/G8.jpg',
    'assets/images/G6.jpg',
    'assets/images/G7.jpg',
    'assets/images/G11.jpg',
    'assets/images/G5.jpg',
    'assets/images/G2.jpg',
    'assets/images/G1.jpg',
    'assets/images/G4.jpg',
    'assets/images/G3.jpg',
  ];
  List<String> txt = [
    'Planks Plan',
    'Diet Plan',
    'Exercise',
    'Supplement Plan',
    'Yoga Plan',
    'Training Plan',
    'Daily Plan',
    'Meat Plan',
    'Food Plan',
    'Cheat Plan',
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffE8EBF5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffE8EBF5),
        actions: const [
          Icon(Icons.notifications, color: Color(0XffA4ADBC)),
          SizedBox(width: 10),
          Padding(
            padding: EdgeInsets.only(right: 17.0),
            child: Icon(
              Icons.person,
              color: Color(0XffA4ADBC),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 12, left: 24),
            child: Row(
              children: [
                Text(
                  "Store",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                itemCount: imagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 20.0,
                    ),
                    child: Stack(children: [
                      Container(
                        height: screenHeight * 0.25,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePaths[index]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 95.0, left: 26),
                        child: Text(
                          txt[index],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        ),
                      )
                    ]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
