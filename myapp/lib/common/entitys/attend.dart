class AttendRequestEntity {
  AttendRequestEntity({
    required this.activityid,
    required this.attendreason,
    required this.attendtime,
    required this.userid,
  });

  String activityid;
  String attendreason;
  String attendtime;
  String userid;

  factory AttendRequestEntity.fromJson(Map<String, dynamic> json) =>
      AttendRequestEntity(
        activityid: json["activityid"],
        attendreason: json["attendreason"],
        attendtime: json["attendtime"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "activityid": activityid,
        "attendreason": attendreason,
        "attendtime": attendtime,
        "userid": userid,
      };
}
