import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/sign_in/bloc/sign_in_events.dart';
import 'package:u_learning/pages/sign_in/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvents, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvents>(_emailEvent);
    on<PasswordEvent>(_passwordEvents);
  }

  void _emailEvent(EmailEvents events, Emitter<SignInState> emit) {
    // print("my email is ${events.email}");
    emit(
      state.copyWith(email: events.email),
    );
  }

  void _passwordEvents(PasswordEvent events, Emitter<SignInState> emit) {
    //  print("my pass is ${events.password}");
    emit(
      state.copyWith(password: events.password),
    );
  }
}
