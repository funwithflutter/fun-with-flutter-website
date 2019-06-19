import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/themes/app_colors.dart';
import 'dart:html' as html;

//TODO Remove if not used
class FunWithAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: secondaryColor,
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
                  Spacer(
                    flex: 14,
                  ),
                  FlatButton(
                    child: Text('Github',
                        style: Theme.of(context).textTheme.title),
                    onPressed: () {
                      html.window.open(
                          'https://github.com/funwithflutter', 'Github');
                    },
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  FlatButton(
                      child: Text('YouTube',
                          style: Theme.of(context).textTheme.title),
                          onPressed: () {
                            html.window.open(
                          'https://www.youtube.com/funwithflutter', 'YouTube');
                          },),
                  Spacer(flex: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
