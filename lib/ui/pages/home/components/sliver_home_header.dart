import 'package:flutter/material.dart';
import 'package:fun_with_flutter/ui/components/icon_bar.dart';
import 'package:fun_with_flutter/ui/pages/home/components/custom_packages_button.dart';

class SliverIntroductionHeader extends StatelessWidget {
  const SliverIntroductionHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome',
                style: Theme.of(context).textTheme.display2,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('This website is made entirely in Flutter!', textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 800),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "It's still under active development, beware the bugs. However, feel free to sign up for an account. Early birds will get discounts and rewards on future projects available through FunWith."),
                ),
              ),
            ),
          ),
          const IconBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CustomPackagesButton(),
            ],
          ),
        ],
      ),
    );
  }
}


