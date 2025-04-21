
import 'package:flutter/cupertino.dart';
import 'dart:ui_web' as ui;
import 'dart:html' as html;

class YouTubeEmbed extends StatelessWidget {
  final String videoId;

  const YouTubeEmbed({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Unique viewType for each video
    final String viewType = 'youtube-$videoId';

    // Register view factory only once
    ui.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
      final html.IFrameElement iframeElement = html.IFrameElement()
        ..width = '450'
        ..height = '300'
        ..src = 'https://www.youtube.com/embed/$videoId'
        ..style.border = 'none'
        ..allowFullscreen = true;

      return iframeElement;
    });

    return HtmlElementView(viewType: viewType);
  }
}
