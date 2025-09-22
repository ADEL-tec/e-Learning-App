import '../../../../common/entities/entities.dart';

sealed class CourseDetailEvent {}

class CourseDetailTriggerEvent extends CourseDetailEvent {
  final CourseItem courseItem;

  CourseDetailTriggerEvent({required this.courseItem});
}

class LessonListTriggerEvent extends CourseDetailEvent {
  final List<LessonItem> lessonItems;

  LessonListTriggerEvent({required this.lessonItems});
}
