class LoginCredentials {
  final String? id;
  final String? role;

  LoginCredentials({
     this.id,
     this.role,
  });

static LoginCredentials LoginCredentialswithid(String id) {
    return LoginCredentials(id: id);
  }

  static LoginCredentials fromJson(Map<String, dynamic> json) {
    return LoginCredentials(
      id: json['uId'],
      role: json['role'],
    );
  }
}
