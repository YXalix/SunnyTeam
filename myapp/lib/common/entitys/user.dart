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
