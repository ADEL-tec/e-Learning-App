// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState {
  final int index;
  final List<CourseItem> courses;
  const HomeState({this.index = 0, this.courses = const <CourseItem>[]});

  HomeState copyWith({int? index, List<CourseItem>? courses}) {
    return HomeState(
      index: index ?? this.index,
      courses: courses ?? this.courses,
    );
  }
}
