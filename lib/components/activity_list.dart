import 'package:b_better/components/action_button.dart';
import 'package:b_better/components/activity_info_modal.dart';
import 'package:b_better/models/stat.dart';
import 'package:flutter/material.dart';

class ActivityList extends StatefulWidget {
  final List<ActivityInfo> activityList;
  const ActivityList({super.key, required this.activityList});

  @override
  State<StatefulWidget> createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  late List<ActivityInfo> activityUpdated;
  void addActivity(ActivityInfo activity) {
    final newAct = ActivityInfo(
      id: activityUpdated.length,
      name: activity.name,
      type: activity.type,
      point: activity.point,
    );
    setState(() {
      activityUpdated.add(newAct);
    });
  }

  void openModal(String mode, ActivityInfo? activityInput) {
    late Function(ActivityInfo activity) onSubmit;
    if (mode == 'create') {
      onSubmit = addActivity;
    } else {
      onSubmit = (ActivityInfo activity) {
        final index = activityUpdated.indexWhere(
          (item) => item.id == activity.id,
        );
        if (index != -1) {
          setState(() {
            activityUpdated[index] = activity;
          });
        }
      };
    }
    showDialog(
      context: context,
      builder:
          (context) => ActivityInfoModal(
            onSubmit: onSubmit,
            mode: mode,
            activityInput: mode == 'edit' ? activityInput : null,
          ),
    );
  }

  @override
  void initState() {
    super.initState();
    activityUpdated = List.from(widget.activityList);
  }

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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: activityUpdated.length,
            itemBuilder: (BuildContext context, int index) {
              return ElevatedButton(
                onPressed: () => openModal('edit', activityUpdated[index]),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
                child: Text(activityUpdated[index].name),
              );
              // return ActionButton(
              //   editInfo: () => openModal('edit', activityUpdated[index]),
              //   activityName: activityUpdated[index].name,
              // );
            },
          ),

          // ...activityUpdated.map(
          //   (activity) => ElevatedButton(
          //     onPressed: () => openModal('edit', activity),
          //     style: ElevatedButton.styleFrom(
          //       foregroundColor: Colors.black,
          //       backgroundColor: Colors.white,
          //     ),
          //     child: Text(activity.name),
          //   ),
          // ),
          ElevatedButton(
            onPressed: () => openModal('create', null),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 0),
              foregroundColor: Colors.black,
              // backgroundColor: Colors.white,
            ),
            child: Text('➕ New Action'),
          ),
        ],
      ),
    );
  }
}
