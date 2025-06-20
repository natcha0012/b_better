import 'package:b_better/models/stat.dart';
import 'package:flutter/material.dart';
import 'package:b_better/components/activity_list.dart';

class StatBar extends StatefulWidget {
  final String title;
  final int power;
  final List<ActivityInfo> activityList;
  const StatBar({
    super.key,
    required this.title,
    required this.power,
    required this.activityList,
  });

  @override
  State<StatefulWidget> createState() => _StatBarState();
}

class _StatBarState extends State<StatBar> {
  bool isExpanded = false;
  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            toggleExpanded();
          },

          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 70, child: Text(widget.title)),
              SizedBox(width: 40, child: Text('${widget.power}')),
              SizedBox(
                width: 20,
                height: 30,
                child: Transform.rotate(
                  angle:
                      isExpanded
                          ? 1.57 * 3
                          : 1.57, // in radians (180 degrees = π)
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    weight: 900,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ActivityList(activityList: widget.activityList),
          ),
      ],
    );
  }
}
