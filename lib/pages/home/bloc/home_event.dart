part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeDotsEvent extends HomeEvent {
  final int index;

  HomeDotsEvent(this.index);
}

class HomeFetchCoursesEvent extends HomeEvent {
  final List<CourseItem> courses;

  HomeFetchCoursesEvent(this.courses);
}
