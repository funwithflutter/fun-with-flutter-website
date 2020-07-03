import 'package:flutter/material.dart';

import '../../common/info_bar.dart';
import 'widgets/contact_us_form.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800, minWidth: 300),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Building something in Flutter?',
                              style: Theme.of(context).textTheme.headline4),
                          Text('Contact us',
                              style: Theme.of(context).textTheme.headline5),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const ContactUsForm(),
                  // const IFrameWidget(
                  //   width: 640,
                  //   height: 360,
                  //   src: 'https://www.youtube.com/embed/2zwEdDoPvnc',
                  //   style: 'border: 0;',
                  //   allow:
                  //       'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture',
                  //   allowFullscreen: true,
                  // ),
                  const InfoBar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
