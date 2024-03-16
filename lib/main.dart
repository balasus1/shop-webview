import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop using Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State <MyHomePage> {
  WebViewController? _webViewController;

  @override
  void initState() {
    _webViewController = WebViewController()
      ..loadFlutterAsset("assets/index.html");
    _webViewController?.setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  Widget buildWebView() {
    return WebViewWidget(
      controller: _webViewController!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: buildWebView(),
    );
  }
}

void main() {
  runApp(MyApp());
}