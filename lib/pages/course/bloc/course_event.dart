part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class CourseTriggerEvent extends CourseEvent {
  final CourseItem courseItem;

  CourseTriggerEvent({required this.courseItem});
}
