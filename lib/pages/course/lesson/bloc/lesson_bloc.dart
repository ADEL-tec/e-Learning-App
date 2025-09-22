import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../../common/entities/lesson.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc() : super(LessonState()) {
    on<LessonVideoEvent>(lessonVideoEvent);
    on<UrlItemEvent>(urlItemEvent);
    on<TriggerPlayEvent>(triggerPlayEvent);
    on<TriggerVideoIndexEvent>(triggerVideoIndexEvent);
  }

  FutureOr<void> lessonVideoEvent(
    LessonVideoEvent event,
    Emitter<LessonState> emit,
  ) {
    emit(state.copyWith(lessonVideoItem: event.lessons));
  }

  FutureOr<void> urlItemEvent(UrlItemEvent event, Emitter<LessonState> emit) {
    emit(
      state.copyWith(initializeVideoPlayerFuture: event.initVideoPlayFuture),
    );
  }

  FutureOr<void> triggerPlayEvent(
    TriggerPlayEvent event,
    Emitter<LessonState> emit,
  ) {
    emit(state.copyWith(isPlay: event.play));
  }

  FutureOr<void> triggerVideoIndexEvent(
    TriggerVideoIndexEvent event,
    Emitter<LessonState> emit,
  ) {
    emit(state.copyWith(videoIndex: event.videoIndex));
  }
}
