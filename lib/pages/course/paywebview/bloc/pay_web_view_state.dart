// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pay_web_view_bloc.dart';

class PayWebViewState {
  final String url;
  PayWebViewState({this.url = ""});

  PayWebViewState copyWith({String? url}) {
    return PayWebViewState(url: url ?? this.url);
  }
}
