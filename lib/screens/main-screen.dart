import 'package:b_better/pages/fight_page.dart';
import 'package:flutter/material.dart';
import 'package:b_better/pages/status_page.dart';
import 'package:b_better/pages/clothes_page.dart';
import 'package:b_better/components/bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;

  final List<Widget> pages = [StatPage(), const ClothesPage(), FightPage()];
  final List<String> pageTitles = ['Status', 'Clothes', 'Fight'];

  void onChangePage(int index) {
    print('onchange page');
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Background image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background/status_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // 2. Scaffold with transparent background
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0, // ตัดเงา
            title: Text(
              pageTitles[currentPage],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
            ),
          ),
          body: IndexedStack(index: currentPage, children: pages),
          bottomNavigationBar: SafeArea(
            child: BottomBar(
              currentPageIndex: currentPage,
              onTabSelected: onChangePage,
            ),
          ),
        ),
      ],
    );
  }
}
