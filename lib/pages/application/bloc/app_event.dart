part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

class AppTriggerEvent extends AppEvent {
  final int index;

  AppTriggerEvent(this.index) : super();
}
