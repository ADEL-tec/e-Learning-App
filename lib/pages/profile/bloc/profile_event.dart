part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileNameEvent extends ProfileEvent {
  final UserItem userItem;

  const ProfileNameEvent(this.userItem);

  @override
  List<Object> get props => [userItem];
}
