import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Website",
                style: TextStyle(
                    fontSize: 20, fontFamily: 'cute', color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text("https://doubleslit.tech/#/task-manager")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Loading...")),
            ),
            Container(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 105,
                child: WebView(
                  initialUrl: 'https://sites.google.com/view/todoapppro/home',
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
