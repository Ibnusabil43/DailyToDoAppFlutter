import 'package:flutter/material.dart';

import 'package:todoapp/Screen/toDoScreen.dart';
import '../model/database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> Day = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  final List<String> dayImage = [
    "assets/dayImage/Monday.png",
    "assets/dayImage/Tuesday.png",
    "assets/dayImage/Wednesday.webp",
    "assets/dayImage/Thursday.webp",
    "assets/dayImage/Friday.png",
    "assets/dayImage/Saturday.png",
    "assets/dayImage/Sunday.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'ToDoApp for Erii',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              SizedBox(
                width: 2,
              ),
              Image.asset("assets/sunflower.png",
                  width: 22, height: 22, fit: BoxFit.fill)
            ],
          ),
          backgroundColor: Colors.pink[300],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ListView.builder(
            itemCount: Day.length,
            itemBuilder: (BuildContext context, int index) {
              return DayTiles(Day: Day[index], dayImage: dayImage[index]);
            },
          ),
        ));
  }
}

class DayTiles extends StatelessWidget {
  final String Day;
  final String dayImage;
  const DayTiles({super.key, required this.Day, required this.dayImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => toDo(
                        Day: Day,
                        dayImage: dayImage,
                      )),
            );
          },
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      dayImage,
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      Day,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
