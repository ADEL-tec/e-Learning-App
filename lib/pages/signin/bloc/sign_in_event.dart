part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class SignInEmailEvent extends SignInEvent {
  final String email;
  SignInEmailEvent({required this.email});
}

class SignInPasswordEvent extends SignInEvent {
  final String password;
  SignInPasswordEvent({required this.password});
}
