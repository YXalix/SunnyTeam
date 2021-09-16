class SucceedEntity {
  SucceedEntity({
    required this.succeed,
  });

  bool succeed;

  factory SucceedEntity.fromJson(Map<String, dynamic> json) => SucceedEntity(
        succeed: json["succeed"],
      );

  Map<String, dynamic> toJson() => {
        "succeed": succeed,
      };
}
