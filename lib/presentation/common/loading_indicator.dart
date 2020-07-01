import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SliverLoadingIndicator extends StatelessWidget {
  const SliverLoadingIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: LoadingIndicator(),
    );
  }
}
