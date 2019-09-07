// import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:fun_with_flutter/plugins/url_launcher/url_launcher.dart';

import '../themes.dart';

// TODO(Anyone): Remove if not used
class FunWithAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: AppTheme.secondaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Align(
                child: Text(
                  'Fun with Flutter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Spacer(
                    flex: 14,
                  ),
                  FlatButton(
                    child: const Text(
                      'Github',
                    ),
                    onPressed: () {
                      UrlUtils.open('https://github.com/funwithflutter');
                    },
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  FlatButton(
                    child: Text('YouTube',
                        style: Theme.of(context).textTheme.title),
                    onPressed: () {
                      UrlUtils.open(
                          'https://www.youtube.com/funwithflutter');
                    },
                  ),
                  const Spacer(flex: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
