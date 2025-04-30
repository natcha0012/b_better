import 'package:flutter/material.dart';

class ActivitiesList extends StatelessWidget {
  ActivitiesList({super.key});
  final activityList = ['Runing', 'Fighting', 'Meditation'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4, left: 4),
            child: const Text(
              'Power-Up Actions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          ...activityList
              .map(
                (activity) => ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  child: Text(activity),
                ),
              )
              .toList(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 0),
              // backgroundColor: Colors.white,
            ),
            child: Text('➕ New Action'),
          ),
        ],
      ),
    );
  }
}
