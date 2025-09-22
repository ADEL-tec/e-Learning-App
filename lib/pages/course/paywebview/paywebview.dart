import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bloc/pay_web_view_bloc.dart';
import 'widgets/pay_web_view_app_bar.dart';

class Paywebview extends StatefulWidget {
  const Paywebview({super.key});

  @override
  State<Paywebview> createState() => _PaywebviewState();
}

class _PaywebviewState extends State<Paywebview> {
  late String _url;
  late WebViewController _webViewController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _url = ModalRoute.of(context)!.settings.arguments as String;

    context.read<PayWebViewBloc>().add(TriggerWebViewEvent(_url));

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'Pay',
        onMessageReceived: (msg) {
          print(msg.message);
          Navigator.of(context).pop(msg.message);
        },
      );
  }

  @override
  void dispose() {
    _webViewController.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PayWebViewAppBar(),
      body: SafeArea(
        child: BlocBuilder<PayWebViewBloc, PayWebViewState>(
          builder: (ctx, state) {
            print(state.url);
            if (state.url == "") {
              return Center(child: CircularProgressIndicator());
            }
            _webViewController.loadRequest(Uri.parse(state.url));
            return WebViewWidget(controller: _webViewController);
          },
        ),
      ),
    );
  }
}
