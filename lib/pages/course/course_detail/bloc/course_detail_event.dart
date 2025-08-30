import 'package:elearning/common/entities/entities.dart';

sealed class CourseDetailEvent {}

class CourseDetailTriggerEvent extends CourseDetailEvent {
  final CourseItem courseItem;

  CourseDetailTriggerEvent({required this.courseItem});
}
