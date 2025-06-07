class StatData {
  final String title;
  final int power;
  final List<ActivityInfo> activityList;
  const StatData({
    required this.title,
    required this.power,
    this.activityList = const [],
  });
}

enum ActivityType { focusTime, checkList }

class ActivityInfo {
  final int? id;
  final String name;
  final ActivityType type;
  final int point;
  const ActivityInfo({
    this.id,
    required this.name,
    required this.type,
    required this.point,
  });
}
