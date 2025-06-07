import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final void Function() editInfo;
  final String activityName;
  const ActionButton({
    super.key,
    required this.editInfo,
    required this.activityName,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          // Left: Action name
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => {print('onclick on $activityName')},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Text(
                  activityName,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),

          // Right: Delete icon
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => editInfo(),
            ),
          ),
        ],
      ),
    );
  }
}
