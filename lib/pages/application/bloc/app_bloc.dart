import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<AppTriggerEvent>(appTriggerEvent);
  }

  FutureOr<void> appTriggerEvent(
    AppTriggerEvent event,
    Emitter<AppState> emit,
  ) {
    emit(AppState(index: event.index));
  }
}
