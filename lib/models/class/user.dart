class User {
  User({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.password,
    this.confirmPassword,
  });

  String? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? password;
  String? confirmPassword;

  static const _idKey = "id";
  static const _nameKey = 'name';
  static const _phoneKey = 'phoneNumber';
  static const _emailKey = 'email';
  static const _passwordKey = 'password';
  static const _confirmKey = 'confirmPassword';

  Map<String, dynamic> toJson() {
    return {
      _idKey: id,
      _nameKey: name,
      _phoneKey: phoneNumber,
      _emailKey: email,
      _passwordKey: password,
      _confirmKey: confirmPassword,
    };
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json[_idKey] as String?,
      name: json[_nameKey] as String?,
      phoneNumber: json[_phoneKey] as String?,
      email: json[_emailKey] as String?,
      password: json[_passwordKey] as String? ?? "",
      confirmPassword: json[_confirmKey] as String? ?? "",
    );
  }

  User copyWith({
    String? name,
    String? avatarPath,
    String? phone,
    String? email,
    String? password,
  }) => User(
    name: name ?? this.name,
    phoneNumber: phone ?? phoneNumber,
    email: email ?? this.email,
    password: password ?? this.password,
  );
}
