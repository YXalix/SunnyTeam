class ActivityResponseEntity {
  ActivityResponseEntity({
    required this.activitys,
  });

  List<Activity> activitys;

  factory ActivityResponseEntity.fromJson(Map<String, dynamic> json) =>
      ActivityResponseEntity(
        activitys: List<Activity>.from(
            json["activitys"].map((x) => Activity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "activitys": List<dynamic>.from(activitys.map((x) => x.toJson())),
      };
}

class Activity {
  Activity({
    required this.activityid,
    required this.activityname,
    required this.position,
    required this.deadline,
    required this.activitytime,
    required this.userid,
    required this.username,
    required this.content,
    required this.likes,
  });

  String activityid;
  String activityname;
  String position;
  String deadline;
  String activitytime;
  String userid;
  String username;
  String content;
  String likes;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        activityid: json["activityid"],
        activityname: json["activityname"],
        position: json["position"],
        deadline: json["deadline"],
        activitytime: json["activitytime"],
        userid: json["userid"],
        username: json["username"],
        content: json["content"],
        likes: json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "activityid": activityid,
        "activityname": activityname,
        "position": position,
        "deadline": deadline,
        "activitytime": activitytime,
        "userid": userid,
        "username": username,
        "content": content,
        "likes": likes,
      };
}
