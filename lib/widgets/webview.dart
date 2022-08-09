// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class Webview extends StatelessWidget {
//   final String url;
//   Webview(this.url);

//   final Completer<WebViewController> _controller = Completer();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('News')),
//       body: Builder(
//         builder: (context) {
//           return WebView(
//             backgroundColor: Colors.white,
//             initialUrl: url,
//             onWebViewCreated: (WebViewController webViewController) {
//               _controller.complete(webViewController);
//             },
//             onPageFinished: (url) {
//               print('Page Loaded');
//             },
//             onPageStarted: (url) {
//               print('Page Loading');
//             },
//           );
//         },
//       ),
//     );
//   }
// }
