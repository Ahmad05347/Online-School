import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/application/bloc/app_events.dart';
import 'package:u_learning/pages/application/bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppState> {
  AppBlocs() : super(const AppState()) {
    on<TrigerAppEvent>(
      (events, emit) {
        emit(
          AppState(index: events.index),
        );
      },
    );
  }
}
