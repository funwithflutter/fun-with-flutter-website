// MIT License
//
// Copyright (c) 2020 Simon Lightfoot
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart' show OneSequenceGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart'
    show PlatformViewController, SystemChannels;

final _widgetRef = <int, HtmlElementWidget>{};

abstract class HtmlElementWidget extends StatefulWidget {
  const HtmlElementWidget({
    Key key,
  }) : super(key: key);

  html.HtmlElement createHtmlElement(BuildContext context);

  @override
  _HtmlElementWidgetState createState() => _HtmlElementWidgetState();
}

class _HtmlElementWidgetState extends State<HtmlElementWidget> {
  static bool _registered = false;

  @override
  void initState() {
    super.initState();
    if (!_registered) {
      registerPlatformView();
      _registered = true;
    }
  }

  void registerPlatformView() {
    if (kIsWeb) {
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        'HtmlElementWidget',
        (int viewId) {
          final widget = _widgetRef[viewId];
          assert(widget != null);
          return widget.createHtmlElement(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      viewType: 'HtmlElementWidget',
      onCreatePlatformView: (PlatformViewCreationParams params) {
        _widgetRef[params.id] = widget;
        final controller = _HtmlElementViewController(params);
        controller._initialize().then((_) {
          params.onPlatformViewCreated(params.id);
        });
        return controller;
      },
      surfaceFactory: (_, PlatformViewController controller) {
        return PlatformViewSurface(
          controller: controller,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
    );
  }
}

class _HtmlElementViewController extends PlatformViewController {
  _HtmlElementViewController(this.params);

  final PlatformViewCreationParams params;

  @override
  int get viewId => params.id;

  bool _initialized = false;

  Future<void> _initialize() async {
    await SystemChannels.platform_views.invokeMethod<void>(
      'create',
      <String, dynamic>{'id': viewId, 'viewType': params.viewType},
    );
    _initialized = true;
  }

  @override
  void clearFocus() {
    // Currently this does nothing on Flutter Web.
    // TODO(het): Implement this. See https://github.com/flutter/flutter/issues/39496
  }

  @override
  void dispatchPointerEvent(PointerEvent event) {
    // We do not dispatch pointer events to HTML views because they may contain
    // cross-origin iframes, which only accept user-generated events.
  }

  @override
  void dispose() {
    if (_initialized) {
      // Asynchronously dispose this view.
      SystemChannels.platform_views.invokeMethod<void>('dispose', viewId);
    }
  }
}
