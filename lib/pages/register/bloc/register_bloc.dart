import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'register_state.dart';

part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<RegisterUsernameEvent>(_registerUsernameEvent);
    on<RegisterEmailEvent>(_registerEmailEvent);
    on<RegisterPasswordEvent>(_registerPasswordEvent);
    on<RegisterRePasswordEvent>(_registerRePasswordEvent);
  }

  FutureOr<void> _registerUsernameEvent(
    RegisterUsernameEvent event,
    Emitter<RegisterState> emit,
  ) {
    print(event.username);
    emit(state.copyWith(username: event.username));
  }

  FutureOr<void> _registerEmailEvent(
    RegisterEmailEvent event,
    Emitter<RegisterState> emit,
  ) {
    print(event.email);

    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _registerPasswordEvent(
    RegisterPasswordEvent event,
    Emitter<RegisterState> emit,
  ) {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _registerRePasswordEvent(
    RegisterRePasswordEvent event,
    Emitter<RegisterState> emit,
  ) {
    print(event.rePassword);
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
