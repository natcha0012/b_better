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
        Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 5),
          width: 160,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(width: 70, child: Text(widget.title)),
              SizedBox(width: 40, child: Text('${widget.power}')),
              SizedBox(
                width: 20,
                height: 30,
                child: TextButton(
                  style: TextButton.styleFrom(padding: const EdgeInsets.all(5)),
                  onPressed: () {
                    toggleExpanded();
                  },
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
              ),
            ],
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5),
            child: ActivityList(activityList: widget.activityList),
          ),
      ],
    );
  }
}
