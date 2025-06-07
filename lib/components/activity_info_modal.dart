import 'package:b_better/models/stat.dart';
import 'package:flutter/material.dart';

class ActivityInfoModal extends StatefulWidget {
  final void Function(ActivityInfo activity) onSubmit;
  final String mode;
  final ActivityInfo? activityInput;
  const ActivityInfoModal({
    super.key,
    required this.mode,
    required this.onSubmit,
    this.activityInput,
  });
  @override
  State<ActivityInfoModal> createState() => _ActivityInfoState();
}

class _ActivityInfoState extends State<ActivityInfoModal> {
  final TextEditingController _newActionController = TextEditingController();
  final TextEditingController _pointController = TextEditingController(
    text: '5',
  );
  int? selectedType = 1;

  @override
  void initState() {
    super.initState();
    if (widget.mode == 'edit' && widget.activityInput != null) {
      _newActionController.text = widget.activityInput!.name;
      _pointController.text = widget.activityInput!.point.toString();
      selectedType =
          widget.activityInput!.type == ActivityType.focusTime ? 1 : 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextField(
        controller: _newActionController,
        decoration: InputDecoration(hintText: 'new action'),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text('Type: '),
              SizedBox(width: 10),
              DropdownButton<int>(
                value: selectedType,
                onChanged: (int? type) {
                  setState(() {
                    selectedType = type;
                  });
                },
                items: [
                  DropdownMenuItem(value: 1, child: Text('focus time')),
                  DropdownMenuItem(value: 2, child: Text('check list')),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text('Point: '),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _pointController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        if (widget.mode != 'create')
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('Delete'),
          ),

        ElevatedButton(
          onPressed: () {
            widget.onSubmit(
              ActivityInfo(
                id: widget.activityInput?.id,
                name: _newActionController.text,
                type:
                    selectedType == 1
                        ? ActivityType.focusTime
                        : ActivityType.checkList,
                point: int.tryParse(_pointController.text) ?? 0,
              ),
            );
            Navigator.pop(context);
          },
          child: widget.mode == 'create' ? Text('Create') : Text('Save'),
        ),
      ],
    );
  }
}
