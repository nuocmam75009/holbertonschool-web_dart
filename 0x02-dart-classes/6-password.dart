class Password {
  String _password;

  Password({String password = ''}) : _password = password;

  String get password => _password;
  set password(String value) => _password = value;

  @override
  String toString() {
    return 'Your Password is: $_password';
  }

  bool isValid() {
    if (_password.length < 8 || _password.length > 16) return false;
    if (!_password.contains(RegExp(r'[A-Z]'))) return false;
    if (!_password.contains(RegExp(r'[a-z]'))) return false;
    if (!_password.contains(RegExp(r'[0-9]'))) return false;
    return true;
  }
}

class User extends Password {
  int id;
  String name;
  int age;
  double height;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.height,
    required String user_password,
  }) : super(password: user_password);

  String get user_password => password;
  set user_password(String value) => password = value;

  static User fromJson(Map<dynamic, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      height: map['height'] ?? 0.0,
      user_password: map['user_password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'age': age, 'height': height};
  }

  @override
  String toString() {
    return 'User(id : $id ,name: $name, age: $age, height: $height, Password: ${isValid()})';
  }
}
