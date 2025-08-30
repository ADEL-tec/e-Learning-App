import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomePageChangedState> {
  WelcomeBloc() : super(WelcomePageChangedState()) {
    on<WelcomeChangePageEvent>((event, emit) {
      emit(WelcomePageChangedState(page: state.page));
    });
  }
}
