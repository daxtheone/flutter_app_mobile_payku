class User {
  final String id;
  final String email;
  final String fullName;
  final List<String> roles;
  final String token;

  User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.roles,
    required this.token
  });

  bool get isAdmin {
    return roles.contains('admin');
  }
}

class UserMapper {
  static User userJsonToEntity(Map<String,dynamic> json) => User(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      roles: List<String>.from(json['roles'].map((role)=>role)),
      token: json['token']
  );
}