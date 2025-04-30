import 'package:b_better/pages/fight_page.dart';
import 'package:flutter/material.dart';
import 'package:b_better/pages/stat_page.dart';
import 'package:b_better/pages/clothes_page.dart';
import 'package:b_better/components/bottom_bar.dart';

class BackgroundScreen extends StatefulWidget {
  const BackgroundScreen({super.key});

  @override
  State<BackgroundScreen> createState() => _BackgroundScreenState();
}

class _BackgroundScreenState extends State<BackgroundScreen> {
  int currentPage = 0;

  final List<Color> themes = const [
    Color.fromARGB(255, 153, 202, 155),
    Color.fromARGB(255, 111, 181, 239),
    Colors.amber,
  ];

  final List<Widget> pages = [StatPage(), const ClothesPage(), FightPage()];

  void onChangePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themes[currentPage],
      body: IndexedStack(index: currentPage, children: pages),
      bottomNavigationBar: SafeArea(
        child: BottomBar(
          currentPageIndex: currentPage,
          onTabSelected: onChangePage,
        ),
      ),
    );
  }
}
