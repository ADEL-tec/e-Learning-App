import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/entities/user.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<ProfileNameEvent>(profileNameEvent);
  }

  FutureOr<void> profileNameEvent(
    ProfileNameEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(userItem: event.userItem));
  }
}
