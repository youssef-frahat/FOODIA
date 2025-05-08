import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPaymentPage extends StatefulWidget {
  final String url;

  const WebViewPaymentPage({super.key, required this.url});

  @override
  _WebViewPaymentPageState createState() => _WebViewPaymentPageState();
}

class _WebViewPaymentPageState extends State<WebViewPaymentPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
  if (url.contains("success") || url.contains("confirmed")) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, true);
    });
  }
},
onPageStarted: (url) {
  if (url.contains("cancel") || url.contains("failed")) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, false);
    });
  }
},

        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("إتمام عملية الدفع", style: TextStyle(fontFamily: 'Changa', fontSize: 25,color: Colors.orange)),centerTitle: true,),
      body: WebViewWidget(controller: _controller),
    );
  }
}
