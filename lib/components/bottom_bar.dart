import 'package:flutter/material.dart';

// class BottomBar extends StatefulWidget {
//   onst BottomBar({super.key});

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   int currentPageIndex = 0;
class BottomBar extends StatelessWidget {
  final ValueChanged<int> onTabSelected;
  final int currentPageIndex;
  BottomBar({
    super.key,
    required this.currentPageIndex,
    required this.onTabSelected,
  });
  final List<String> labels = ['Stat', 'Clothes', 'Fight'];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(labels.length, (index) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.blue, width: 2)),
              // border: Border(
              //   top: BorderSide(color: Colors.blue),
              //   left: BorderSide(color: Colors.blue),
              // ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // subtle shadow
                  blurRadius: 8,
                  offset: Offset(0, -2), // shadow goes upwards a bit
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                // setState(() {
                //   currentPageIndex = index;
                // });
                return onTabSelected(index);
              },
              style: TextButton.styleFrom(
                minimumSize: Size(
                  double.infinity,
                  currentPageIndex == index ? 70 : 50,
                ),
              ),
              child: Text(labels[index]),
            ),
          ),
        );
      }),
    );
  }
}
