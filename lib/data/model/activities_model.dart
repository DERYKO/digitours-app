class ActivityModel {
  final int id;
  final String name;
  final String coverPhoto;
  final List<SubActivityModel> subActivities;

  ActivityModel({this.id, this.name, this.coverPhoto, this.subActivities});

  factory ActivityModel.fromMap(activity) {
    return ActivityModel(
      id: activity['id'],
      name: activity['name'],
      coverPhoto: activity['cover_photo'],
      subActivities: activity['sub_activity'].map<SubActivityModel>((activity) {
        return SubActivityModel.fromMap(activity);
      }).toList(),
    );
  }
}

class SubActivityModel {
  final int id;
  final String name;
  final String coverPhoto;

  SubActivityModel({this.id, this.name, this.coverPhoto});

  factory SubActivityModel.fromMap(activity) {
    return SubActivityModel(
        id: activity['activity_id'],
        name: activity['name'],
        coverPhoto: activity['cover_photo']);
  }
}
