import 'package:flutter/material.dart';

class StatPage extends StatelessWidget {
  const StatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // or any color
      body: Center(child: Text('Stat')),
    );
  }
}
