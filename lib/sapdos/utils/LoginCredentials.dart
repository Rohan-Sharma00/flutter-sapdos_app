class LoginCredentials {
  final String? id;
  final String? role;

  LoginCredentials({
     this.id,
     this.role,
  });

  // JSON serialization (fromJson) method
  static LoginCredentials fromJson(Map<String, dynamic> json) {
    return LoginCredentials(
      id: json['uId'],
      role: json['role'],
    );
  }
}
