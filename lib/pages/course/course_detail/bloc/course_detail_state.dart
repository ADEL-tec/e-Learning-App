import 'package:elearning/common/entities/entities.dart';

class CourseDetailState {
  final CourseItem? courseItem;

  CourseDetailState({this.courseItem});

  CourseDetailState copyWith({CourseItem? courseItem}) {
    return CourseDetailState(courseItem: courseItem ?? this.courseItem);
  }
}
