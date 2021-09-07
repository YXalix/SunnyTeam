class UserRequestLoginEntity {
  UserRequestLoginEntity({
    required this.password,
    required this.userId,
  });

  String password;
  String userId;

  factory UserRequestLoginEntity.fromJson(Map<String, dynamic> json) =>
      UserRequestLoginEntity(
        password: json["password"],
        userId: json["userID"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "userID": userId,
      };
}

class UserResponseLoginEntity {
  UserResponseLoginEntity({
    required this.token,
    this.userId,
    this.userName,
  });

  String token;
  String? userId;
  String? userName;

  factory UserResponseLoginEntity.fromJson(Map<String, dynamic> json) =>
      UserResponseLoginEntity(
        token: json["token"],
        userId: json["userID"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "userID": userId,
        "userName": userName,
      };
}

class UserRequestSignupEntity {
  UserRequestSignupEntity({
    required this.school,
    required this.userid,
    required this.username,
    required this.userpassword,
  });

  String school;
  String userid;
  String username;
  String userpassword;

  factory UserRequestSignupEntity.fromJson(Map<String, dynamic> json) =>
      UserRequestSignupEntity(
        school: json["school"],
        userid: json["userid"],
        username: json["username"],
        userpassword: json["userpassword"],
      );

  Map<String, dynamic> toJson() => {
        "school": school,
        "userid": userid,
        "username": username,
        "userpassword": userpassword,
      };
}

class UserResponseSignupEntity {
  UserResponseSignupEntity({
    required this.userid,
  });

  String userid;

  factory UserResponseSignupEntity.fromJson(Map<String, dynamic> json) =>
      UserResponseSignupEntity(
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
      };
}
