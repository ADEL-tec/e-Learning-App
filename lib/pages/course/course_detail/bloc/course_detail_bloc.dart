import 'dart:async';

import 'package:bloc/bloc.dart';

import 'course_detail_event.dart';
import 'course_detail_state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(CourseDetailState()) {
    on<CourseDetailTriggerEvent>(courseDetailEvent);
    on<LessonListTriggerEvent>(lessonListTriggerEvent);
  }

  FutureOr<void> courseDetailEvent(
    CourseDetailTriggerEvent event,
    Emitter<CourseDetailState> emit,
  ) {
    emit(state.copyWith(courseItem: event.courseItem));
  }

  FutureOr<void> lessonListTriggerEvent(
    LessonListTriggerEvent event,
    Emitter<CourseDetailState> emit,
  ) {
    emit(state.copyWith(lessonItems: event.lessonItems));
  }
}
