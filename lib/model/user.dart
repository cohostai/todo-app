class User {
  final String fullName;
  final String userName;

  User({required this.fullName, required this.userName});

  static fromJson(dynamic json) {
    return User(fullName: json["fullName"], userName: json["userName"]);
  }
}
