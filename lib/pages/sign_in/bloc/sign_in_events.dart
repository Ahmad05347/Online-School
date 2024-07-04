abstract class SignInEvents {
  const SignInEvents();
}

class EmailEvents extends SignInEvents {
  final String email;
  const EmailEvents({required this.email});
}

class PasswordEvent extends SignInEvents {
  final String password;
  const PasswordEvent({required this.password});
}
