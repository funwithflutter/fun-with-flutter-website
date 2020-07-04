import 'package:flutter/material.dart';

import '../../../../infrastructure/core/urls.dart' as url;
import '../../../common/accent_button.dart';
import '../../../core/constants.dart';
import '../../../core/utils/url_handler.dart';

class SliverCourseHeader extends StatelessWidget {
  const SliverCourseHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: kMaxBodyWidth),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        ExactAssetImage('assets/images/course_background.png'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: Theme.of(context).colorScheme.surface,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Flutter Animation and Performance Course',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Sart animating in Flutter with ease and then learn to prevent common performance problems.',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      AccentButton(
                        label: 'Start',
                        onPressed: () {
                          launchURL(url.courseAnimationPerf);
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
