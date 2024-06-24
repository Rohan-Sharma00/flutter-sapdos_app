class LoginCredential {
  final String email;
  final String password;
  final String? confirmPassword;

  LoginCredential(
      {required this.email, required this.password, this.confirmPassword});
}
