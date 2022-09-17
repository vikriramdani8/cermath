import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../service/network.dart';

class PreviewPdf extends StatefulWidget {
  const PreviewPdf({Key? key}) : super(key: key);

  @override
  State<PreviewPdf> createState() => _PreviewPdfState();
}

class _PreviewPdfState extends State<PreviewPdf> {
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    createFileOfPdfUrl('c146b45b-611a-4b87-b6ec-d9551dccf1c8');
  }

  Future<void> createFileOfPdfUrl(sublessonId) async {
    var responses = await Network().getPdf(sublessonId);
    var resultBody = json.decode(responses.body);
    print(resultBody['data']['document']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: "https://www.youtube.com",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
