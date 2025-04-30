import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final ValueChanged<int> onTabSelected;
  final int currentPageIndex;

  const BottomBar({
    super.key,
    required this.currentPageIndex,
    required this.onTabSelected,
  });

  final List<String> labels = const ['Stat', 'Clothes', 'Fight'];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(labels.length, (index) {
        final isSelected = currentPageIndex == index;

        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: const Border(
                top: BorderSide(color: Colors.blue, width: 2),
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: TextButton(
              onPressed: () => onTabSelected(index),
              style: TextButton.styleFrom(
                minimumSize: Size(double.infinity, isSelected ? 70 : 50),
              ),
              child: Text(labels[index]),
            ),
          ),
        );
      }),
    );
  }
}
