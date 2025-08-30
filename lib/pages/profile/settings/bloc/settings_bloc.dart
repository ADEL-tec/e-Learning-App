import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<TriggerSettingsEvent>(triggerSettingsEvent);
  }

  FutureOr<void> triggerSettingsEvent(
    TriggerSettingsEvent event,
    Emitter<SettingsState> emit,
  ) {
    emit(SettingsInitial());
  }
}
