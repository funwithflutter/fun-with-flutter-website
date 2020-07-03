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
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'html_element_widget.dart';

class IFrameWidget extends HtmlElementWidget {
  const IFrameWidget({
    Key key,
    this.width,
    this.height,
    this.src,
    this.style,
    this.allow,
    this.allowFullscreen,
  }) : super(key: key);

  final double width;
  final double height;
  final String src;
  final String style;
  final String allow;
  final bool allowFullscreen;

  @override
  HtmlElement createHtmlElement(BuildContext context) {
    return IFrameElement()
      ..width = width.toString()
      ..height = height.toString()
      ..src = src
      ..style.cssText = style
      ..allow = allow
      ..allowFullscreen = allowFullscreen;
  }
}
