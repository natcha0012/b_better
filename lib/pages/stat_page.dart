import 'package:flutter/material.dart';
import 'package:b_better/components/stat_bar.dart';
import 'package:b_better/models/stat.dart';

class StatPage extends StatelessWidget {
  const StatPage({super.key});
  final statList = const [
    StatData(title: 'Health', power: 100),
    StatData(title: 'Attack', power: 45),
    StatData(title: 'Defense', power: 30),
    StatData(title: 'Mana', power: 80),
  ];

  @override
  Widget build(BuildContext context) {
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
                      return StatBar(title: stat.title, power: stat.power);
                    }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
