part of 'lesson_bloc.dart';

@immutable
sealed class LessonEvent extends Equatable {}

class LessonVideoEvent extends LessonEvent {
  final List<LessonVideoItem> lessons;
  LessonVideoEvent(this.lessons);

  @override
  List<Object?> get props => [lessons];
}

class UrlItemEvent extends LessonEvent {
  final Future<void>? initVideoPlayFuture;
  UrlItemEvent(this.initVideoPlayFuture);

  @override
  List<Object?> get props => [initVideoPlayFuture];
}

class TriggerPlayEvent extends LessonEvent {
  final bool play;
  TriggerPlayEvent(this.play);

  @override
  List<Object?> get props => [play];
}

class TriggerVideoIndexEvent extends LessonEvent {
  final int videoIndex;
  TriggerVideoIndexEvent(this.videoIndex);

  @override
  List<Object?> get props => [videoIndex];
}
