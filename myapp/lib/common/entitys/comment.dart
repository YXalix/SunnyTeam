class CommentListResponseEntity {
  CommentListResponseEntity({
    this.comments,
  });

  List<Comment>? comments;

  factory CommentListResponseEntity.fromJson(Map<String, dynamic> json) =>
      CommentListResponseEntity(
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
      };
}

class Comment {
  Comment({
    required this.commentid,
    required this.userid,
    required this.activityid,
    required this.publishtime,
    required this.content,
    required this.username,
  });

  String commentid;
  String userid;
  String activityid;
  String publishtime;
  String content;
  String username;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        commentid: json["commentid"],
        userid: json["userid"],
        activityid: json["activityid"],
        publishtime: json["publishtime"],
        content: json["content"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "commentid": commentid,
        "userid": userid,
        "activityid": activityid,
        "publishtime": publishtime,
        "content": content,
        "username": username,
      };
}
