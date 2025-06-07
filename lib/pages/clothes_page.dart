import 'package:flutter/material.dart';

class ClothesPage extends StatelessWidget {
  const ClothesPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("clothes page");
    return Scaffold(
      backgroundColor: Colors.transparent, // or any color
      body: Center(child: Text('Clothes')),
    );
  }
}
