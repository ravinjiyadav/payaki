import 'package:flutter/material.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/widgets/custom_appbar.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewChatScreen extends StatefulWidget {
  final String? url;

  const WebViewChatScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewChatScreen> createState() => _WebViewChatScreenState();
}

class _WebViewChatScreenState extends State<WebViewChatScreen> {
  late final WebViewController controller;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    logD("Url is ${widget.url}");


    if( widget.url != null && widget.url != "") {
       isLoading = true;

      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {
              setState(() {
                isLoading = false;
              });
            },
            onWebResourceError: (WebResourceError error) {
              setState(() {
                isLoading = false;
              });
              logD(error.toString());
              context.flushBarTopErrorMessage(message: error.toString());
              Navigator.pop(context);
            },
            // onNavigationRequest: (NavigationRequest request) {
            //   if (request.url.startsWith('http://www.youtube.com/')) {
            //     return NavigationDecision.prevent;
            //   }
            //   return NavigationDecision.navigate;
            // },
          ),
        )
        ..loadRequest(Uri.parse(widget.url ?? ""));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.whiteColor,
      appBar: const CustomAppBar(
        title: "Chat",
      ),
      body: SafeArea(
       // bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  widget.url != null && widget.url != ""?
                  WebViewWidget(
                    controller: controller,
                  ):Center(child: Text("Invalid Chat Url"),),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Stack(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
