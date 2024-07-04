import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/register/bloc/register_events.dart';
import 'package:u_learning/pages/register/bloc/register_state.dart';

class RegisterBlocs extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBlocs() : super(const RegisterStates()) {
    on<UserNameEvents>(_userNameEvents);
    on<EmailEvents>(_emailEvents);
    on<PasswordEvents>(_passwordEvents);
    on<RePasswordEvents>(_rePasswordEvents);
  }
  void _userNameEvents(UserNameEvents events, Emitter<RegisterStates> emit) {
    print("${events.username}");
    emit(
      state.copyWith(userName: events.username),
    );
  }

  void _emailEvents(EmailEvents events, Emitter<RegisterStates> emit) {
    print("${events.email}");
    emit(
      state.copyWith(email: events.email),
    );
  }

  void _passwordEvents(PasswordEvents events, Emitter<RegisterStates> emit) {
    print("${events.password}");
    emit(
      state.copyWith(password: events.password),
    );
  }

  void _rePasswordEvents(
      RePasswordEvents events, Emitter<RegisterStates> emit) {
    print("${events.rePassword}");
    emit(
      state.copyWith(rePassword: events.rePassword),
    );
  }
}
