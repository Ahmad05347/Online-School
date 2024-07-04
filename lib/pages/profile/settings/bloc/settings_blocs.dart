import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/profile/settings/bloc/settings_events.dart';
import 'package:u_learning/pages/profile/settings/bloc/settings_state.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingsState> {
  SettingsBlocs()
      : super(
          const SettingsState(),
        ) {
    on<TriggerSettings>(_triggerSettings);
  }
  _triggerSettings(SettingsEvents event, Emitter<SettingsState> emit) {
    emit(
      const SettingsState(),
    );
  }
}
