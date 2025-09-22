// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final UserItem? userItem;
  const ProfileState({this.userItem});

  @override
  List<Object> get props => [];

  ProfileState copyWith({UserItem? userItem}) {
    return ProfileState(userItem: userItem ?? this.userItem);
  }
}
