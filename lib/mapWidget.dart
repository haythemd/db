import 'package:flutter/cupertino.dart';
import 'dart:ui_web' as ui;
import 'dart:html' as html;
import 'package:flutter/material.dart';

class MapEmbed extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String label;

  const MapEmbed({
    Key? key,
    required this.latitude,
    required this.longitude,
    this.label = 'Location',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String viewType = 'map-${latitude}-${longitude}';
    final String mapUrl =
        'https://maps.google.com/maps?q=$latitude,$longitude&z=15&output=embed';

    // Register the iframe only once
    ui.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
      final html.IFrameElement element = html.IFrameElement()
        ..width = '600'
        ..height = '400'
        ..src = mapUrl
        ..style.border = '0';

      return element;
    });

    return SizedBox(
      width: 400,
      height: 400,
      child: HtmlElementView(viewType: viewType),
    );
  }
}