import 'package:flutter/material.dart';

class SliverLoadingIndicator extends StatelessWidget {
  const SliverLoadingIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
