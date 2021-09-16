class AccountResponseEntity {
  AccountResponseEntity({
    this.userid,
    this.password,
    this.registertime,
    this.username,
    this.school,
    this.activitynum,
    this.attentnum,
    this.commentnum,
  });

  String? userid;
  String? password;
  String? registertime;
  String? username;
  String? school;
  String? activitynum;
  String? attentnum;
  String? commentnum;

  factory AccountResponseEntity.fromJson(Map<String, dynamic> json) =>
      AccountResponseEntity(
        userid: json["userid"],
        password: json["password"],
        registertime: json["registertime"],
        username: json["username"],
        school: json["school"],
        activitynum: json["activitynum"],
        attentnum: json["attentnum"],
        commentnum: json["commentnum"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "password": password,
        "registertime": registertime,
        "username": username,
        "school": school,
        "activitynum": activitynum,
        "attentnum": attentnum,
        "commentnum": commentnum,
      };
}

class AccountChangeRequest {
  AccountChangeRequest({
    required this.school,
    required this.userid,
    required this.username,
  });

  String school;
  String userid;
  String username;

  factory AccountChangeRequest.fromJson(Map<String, dynamic> json) =>
      AccountChangeRequest(
        school: json["school"],
        userid: json["userid"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "school": school,
        "userid": userid,
        "username": username,
      };
}
