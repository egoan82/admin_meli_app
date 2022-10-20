class Session {
  final String token;
  final int expiresIn;
  final DateTime createdAt;
  final String user;
  final String rol;
  final String name;

  Session({
    required this.token,
    required this.expiresIn,
    required this.createdAt,
    required this.user,
    required this.rol,
    required this.name,
  });

  static Session fromJson(Map<String, dynamic> json) {
    return Session(
      token: json['token'],
      expiresIn: json['expiresIn'],
      createdAt: DateTime.parse(json['createdAt']),
      user: json['user'],
      rol: json['rol'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "expiresIn": expiresIn,
      "createdAt": createdAt.toIso8601String(),
      "user": user,
      "rol": rol,
      "name": name,
    };
  }
}
