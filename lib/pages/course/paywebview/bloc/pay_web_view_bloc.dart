import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pay_web_view_event.dart';
part 'pay_web_view_state.dart';

class PayWebViewBloc extends Bloc<PayWebViewEvent, PayWebViewState> {
  PayWebViewBloc() : super(PayWebViewState()) {
    on<TriggerWebViewEvent>(triggerWebViewEvent);
  }

  FutureOr<void> triggerWebViewEvent(
    TriggerWebViewEvent event,
    Emitter<PayWebViewState> emit,
  ) {
    emit(state.copyWith(url: event.url));
  }
}
