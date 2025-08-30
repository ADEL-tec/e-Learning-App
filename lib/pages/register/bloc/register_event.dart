part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterUsernameEvent extends RegisterEvent {
  final String username;
  RegisterUsernameEvent({required this.username});
}

class RegisterEmailEvent extends RegisterEvent {
  final String email;
  RegisterEmailEvent({required this.email});
}

class RegisterPasswordEvent extends RegisterEvent {
  final String password;
  RegisterPasswordEvent({required this.password});
}

class RegisterRePasswordEvent extends RegisterEvent {
  final String rePassword;
  RegisterRePasswordEvent({required this.rePassword});
}
