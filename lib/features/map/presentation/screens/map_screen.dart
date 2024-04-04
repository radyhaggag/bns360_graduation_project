import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../../core/widgets/custom_back_button.dart';
import '../../domain/params/map_params.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, this.mapParams});

  final MapParams? mapParams;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final GlobalKey webViewKey = GlobalKey();
  late InAppWebViewController webViewController;

  InAppWebViewSettings settings = InAppWebViewSettings(
    isInspectable: kDebugMode,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    // iframeAllow: "camera; microphone",
    iframeAllowFullscreen: true,
    javaScriptCanOpenWindowsAutomatically: true,
    geolocationEnabled: true,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    webViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.mapParams?.location ?? ""),
          leading: const CustomBackButton(),
        ),
        body: InAppWebView(
          key: webViewKey,
          initialUrlRequest: URLRequest(
            url: WebUri(initialUrl),
          ),
          initialSettings: settings,
          onWebViewCreated: (controller) {
            webViewController = controller;
            setState(() {});
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            final uri = navigationAction.request.url!;
            if (uri.toString().startsWith("https://www.google.com/maps")) {
              return NavigationActionPolicy.ALLOW;
            } else {
              return NavigationActionPolicy.CANCEL;
            }
          },
          onGeolocationPermissionsShowPrompt:
              (InAppWebViewController controller, String origin) async {
            return GeolocationPermissionShowPromptResponse(
              origin: origin,
              allow: true,
              retain: true,
            );
          },
          onPermissionRequest: (controller, permissionRequest) async {
            return PermissionResponse(
              action: PermissionResponseAction.GRANT,
              resources: permissionRequest.resources,
            );
          },
        ),
      ),
    );
  }

  String get initialUrl {
    final lat = widget.mapParams?.lat;
    final lng = widget.mapParams?.lng;
    final url = "https://www.google.com/maps/search/?api=1&query=$lat,$lng";
    return url;
  }
}
