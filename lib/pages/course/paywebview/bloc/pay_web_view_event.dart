part of 'pay_web_view_bloc.dart';

@immutable
sealed class PayWebViewEvent {}

class TriggerWebViewEvent extends PayWebViewEvent {
  final String url;

  TriggerWebViewEvent(this.url);
}
