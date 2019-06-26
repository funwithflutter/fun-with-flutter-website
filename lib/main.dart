import 'package:bloc/bloc.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/repository/blog_repository.dart';

import 'package:fun_with_flutter/themes/styles.dart';
import 'package:fun_with_flutter/logic/route_generator.dart';

import 'blocs/bloc.dart';
import 'blocs/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final BlogBloc blogBloc = BlogBloc(blogRepository: BlogRepository());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) {
        return blogBloc..dispatch(Fetch());
      }, //Load the Blog data
      child: BlocProviderTree(
        blocProviders: [
          BlocProvider<FilteredBlogBloc>(
            builder: (context) {
              return FilteredBlogBloc(blogBloc: blogBloc);
            },
          ),
          BlocProvider<PageBloc>(
            builder: (context) {
              return PageBloc();
            },
          )
        ],
        child: MaterialApp(
          title: 'Fun with Flutter',
          theme: theme,
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'dart:html';

// import 'package:flutter_web_ui/ui.dart' as ui;

// import 'package:flutter_web/material.dart';

// void main() {
//   // ui.platformViewRegistry.registerViewFactory(
//   //     'hello-world-html', (int viewId) => DivElement()..text = 'Hello, World');
//   ui.platformViewRegistry.registerViewFactory(
//       'hello-world-html', (int viewId) => IFrameElement()..src = 'https://github.com/flutter/flutter_web/blob/master/examples/html_platform_view/pubspec.yaml');
//   // ui.platformViewRegistry.registerViewFactory(
//   //     'hello-world-name-html', (int viewId) => VideoElement( )..src = 'https://www.youtube.com/watch?v=r25IWquxe9s'
//   //     ..autoplay = true
//   //     ..videoHeight  = 200,
//   //     );



//   runApp(Directionality(
//     textDirection: TextDirection.ltr,
//     child: HtmlView(viewType: 'hello-world-html'),
//   ));
// }
