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
  var page = 0;
  final List<Color> themes = [
    const Color.fromARGB(255, 153, 202, 155),
    const Color.fromARGB(255, 111, 181, 239),
    Colors.amber,
  ];
  final List<Widget> pageList = [StatPage(), ClothesPage(), StatPage()];
  void onChangePage(int page) {
    setState(() {
      this.page = page;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themes[page],
      body: pageList[page],
      bottomNavigationBar: SafeArea(
        child: BottomBar(currentPageIndex: page, onTabSelected: onChangePage),
      ),
    );
  }
}
