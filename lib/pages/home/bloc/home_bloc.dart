import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../common/entities/entities.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeDotsEvent>(homeEvent);
    on<HomeFetchCoursesEvent>(homeFetchCoursesEvent);
  }

  FutureOr<void> homeEvent(HomeDotsEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(index: event.index));
  }

  FutureOr<void> homeFetchCoursesEvent(
    HomeFetchCoursesEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(courses: event.courses));
  }
}
