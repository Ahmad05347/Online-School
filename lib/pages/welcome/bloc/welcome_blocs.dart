import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/welcome/bloc/welcome_evnts.dart';
import 'package:u_learning/pages/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvents>(
      (event, emit) {
        emit(
          WelcomeState(page: state.page),
        );
      },
    );
  }
}
