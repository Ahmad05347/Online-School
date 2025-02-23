import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/home/bloc/homepage_events.dart';
import 'package:u_learning/home/bloc/homepage_states.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBlocs() : super(const HomePageStates()) {
    on<HomePageDots>(_homePageDots);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(
      state.copyWith(event.index),
    );
  }
}
