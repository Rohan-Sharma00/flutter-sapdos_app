abstract class LoginPageEvents {}

class LoginPageEmailEvent extends LoginPageEvents {
  final String email;
  LoginPageEmailEvent(this.email);
}

class LoginPagePasswordEvent extends LoginPageEvents {
  final String password;
  LoginPagePasswordEvent(this.password);
}

class LoginPageSubmitEvent extends LoginPageEvents {
  final String email;
  final String password;
  LoginPageSubmitEvent(this.email, this.password);
}
