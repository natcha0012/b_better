import 'package:flutter/material.dart';
import 'package:b_better/components/stat_bar.dart';
import 'package:b_better/models/stat.dart';

class StatPage extends StatelessWidget {
  const StatPage({super.key});
  final statList = const [
    StatData(
      title: 'Health',
      power: 100,
      activityList: [
        ActivityInfo(
          id: 1,
          name: 'eating healthy',
          type: ActivityType.checkList,
          point: 1,
        ),
        ActivityInfo(
          id: 2,
          name: 'sleeping 8 hours',
          type: ActivityType.checkList,
          point: 2,
        ),
      ],
    ),
    StatData(
      title: 'Attack',
      power: 45,
      activityList: [
        ActivityInfo(
          id: 3,
          name: 'studying',
          type: ActivityType.focusTime,
          point: 2,
        ),
        ActivityInfo(
          id: 4,
          name: 'working',
          type: ActivityType.focusTime,
          point: 2,
        ),
      ],
    ),
    StatData(
      title: 'Defense',
      power: 30,
      activityList: [
        ActivityInfo(
          id: 5,
          name: 'running',
          type: ActivityType.focusTime,
          point: 2,
        ),
        ActivityInfo(
          id: 6,
          name: 'swimming',
          type: ActivityType.focusTime,
          point: 2,
        ),
      ],
    ),
    StatData(
      title: 'Mana',
      power: 80,
      activityList: [
        ActivityInfo(
          id: 7,
          name: 'meditation',
          type: ActivityType.focusTime,
          point: 2,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print("build stat page");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 153, 202, 155),
        title: const Text(
          'My Stat',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
        ),
      ),
      backgroundColor: Colors.transparent, // or any color
      body: Stack(
        children: [
          Container(
            height: 484,
            width: double.infinity,
            margin: EdgeInsets.only(top: 20),

            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Image.asset('assets/avatar/base.png', height: 484),
                ),
                Positioned(
                  top: 120,
                  right: 71,
                  child: Image.asset('assets/avatar/eyes.png', width: 115),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Column(
                children:
                    statList.map((stat) {
                      return StatBar(
                        title: stat.title,
                        power: stat.power,
                        activityList: stat.activityList,
                      );
                    }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
