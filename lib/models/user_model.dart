class User {
  final String id;
  final String username;
  final String password;
  final String email;
  final String token; // Agregado el token

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.token, // Constructor incluye el token
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      token: json['token'], // Token del backend
    );
  }
}
