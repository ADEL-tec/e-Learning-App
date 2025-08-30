import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../common/entities/entities.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseState()) {
    on<CourseTriggerEvent>(courseTriggerEvent);
  }

  FutureOr<void> courseTriggerEvent(
    CourseTriggerEvent event,
    Emitter<CourseState> emit,
  ) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
