import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<SignInEmailEvent>(_emailEvent);
    on<SignInPasswordEvent>(_passwordEvent);
  }

  void _emailEvent(SignInEmailEvent event, Emitter emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(SignInPasswordEvent event, Emitter emit) {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }
}
