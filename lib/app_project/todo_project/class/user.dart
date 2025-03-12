class User {
  final String? id;
  final String? name;
  final String? avatar;
  final String? phoneNumber;

  User({this.id, this.name, this.phoneNumber, this.avatar});

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phoneNumber": phoneNumber,
      "avatar": avatar,
    };
  }
}
