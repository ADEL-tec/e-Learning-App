// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'lesson_bloc.dart';

class LessonState extends Equatable {
  final List<LessonVideoItem> lessonVideoItem;
  final Future<void>? initializeVideoPlayerFuture;
  final bool isPlay;
  final int videoIndex;

  LessonState({
    this.lessonVideoItem = const [],
    this.initializeVideoPlayerFuture,
    this.isPlay = false,
    this.videoIndex = 0,
  });

  LessonState copyWith({
    List<LessonVideoItem>? lessonVideoItem,
    Future<void>? initializeVideoPlayerFuture,
    bool? isPlay,
    int? videoIndex,
  }) {
    return LessonState(
      lessonVideoItem: lessonVideoItem ?? this.lessonVideoItem,
      initializeVideoPlayerFuture:
          initializeVideoPlayerFuture ?? this.initializeVideoPlayerFuture,
      isPlay: isPlay ?? this.isPlay,
      videoIndex: videoIndex ?? this.videoIndex,
    );
  }

  @override
  List<Object?> get props => [
    lessonVideoItem,
    initializeVideoPlayerFuture,
    isPlay,
    videoIndex,
  ];
}
