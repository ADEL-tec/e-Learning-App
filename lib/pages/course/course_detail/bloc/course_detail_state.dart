import '../../../../common/entities/entities.dart';

class CourseDetailState {
  final CourseItem? courseItem;
  final List<LessonItem> lessonItems;

  CourseDetailState({this.courseItem, this.lessonItems = const []});

  CourseDetailState copyWith({
    CourseItem? courseItem,
    List<LessonItem>? lessonItems,
  }) {
    return CourseDetailState(
      courseItem: courseItem ?? this.courseItem,
      lessonItems: lessonItems ?? this.lessonItems,
    );
  }
}
