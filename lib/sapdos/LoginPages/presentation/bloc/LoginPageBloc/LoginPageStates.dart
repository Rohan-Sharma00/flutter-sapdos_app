abstract class LoginPageStates{}

class LoginPageInitialState extends LoginPageStates{

}

class LoginPageEmailErrorState extends LoginPageStates{
final String message;
LoginPageEmailErrorState(this.message);
}

class LoginPageEmailValidState extends LoginPageStates{
final String message;
LoginPageEmailValidState(this.message);
}

class LoginPagePasswordErrorState extends LoginPageStates{
final String message;
LoginPagePasswordErrorState(this.message);
}

class LoginPagePasswordValidState extends LoginPageStates{
final String message;
LoginPagePasswordValidState(this.message);
}

class LoginPageStatusState extends LoginPageStates{
final String message;
LoginPageStatusState(this.message);
}

class LoginPageSuccessStatusState extends LoginPageStates{
final String message;
LoginPageSuccessStatusState(this.message);
}

