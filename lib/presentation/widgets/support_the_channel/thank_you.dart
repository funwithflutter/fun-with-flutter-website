import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

import '../../../infrastructure/core/urls.dart' as url;
import '../../themes.dart';
import 'randomly_positioned.dart';

class ThankYou extends StatefulWidget {
  const ThankYou({Key key, @required this.onClosePressed}) : super(key: key);

  final VoidCallback onClosePressed;

  @override
  _ThankYouState createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> {
  final ConfettiController _confettiController = ConfettiController(
    duration: const Duration(seconds: 10),
  );

  @override
  void initState() {
    _confettiController.play();
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        heightFactor: 0.9,
        widthFactor: 0.9,
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ConfettiWidget(
                    confettiController: _confettiController,
                    emissionFrequency: 0.1,
                    numberOfParticles: 3,
                    blastDirection: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          widget.onClosePressed();
                        },
                      ),
                    ),
                  ),
                  if (MediaQuery.of(context).size.width > 1200)
                    ConfettiWidget(
                      confettiController: _confettiController,
                      blastDirection: pi / 2,
                      numberOfParticles: 20,
                    ),
                  ConfettiWidget(
                    confettiController: _confettiController,
                    emissionFrequency: 0.1,
                    numberOfParticles: 3,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'The wall of supporters',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Support the channel on Patreon and find extra goodies',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: AppTheme.accentColor,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    html.window.open(url.funWithPatreon, null);
                  },
                  child: Text(
                    'Click here to explore',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    RandomlyPositionedWidget(
                      child: Text(
                        'LEON',
                        style: Theme.of(context).textTheme.headline6 ,
                      ),
                    ),
                    RandomlyPositionedWidget(
                      child: Text(
                        'GH',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
