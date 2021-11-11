import 'package:flutter/material.dart';
import 'package:newes/cubit/cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  const WebViewScreen(this.url);
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            NewsCubit.get(context).isloding = true;
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: this.widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {});
              NewsCubit.get(context).isloding = false;
            },
          ),
          NewsCubit.get(context).isloding
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
