// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool _isLargeScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > 960.0;
}

bool _isMediumScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > 640.0;
}

/// See bottomNavigationBarItem or NavigationRailDestination
class AdaptiveScaffoldDestination {
  final String title;
  final IconData icon;

  const AdaptiveScaffoldDestination({
    @required this.title,
    @required this.icon,
  });
}

/// A widget that adapts to the current display size, displaying a [Drawer],
/// [NavigationRail], or [BottomNavigationBar]. Navigation destinations are
/// defined in the [destinations] parameter.
class AdaptiveScaffold extends StatefulWidget {
  final Widget title;
  final List<Widget> actions;
  final Widget body;
  final int currentIndex;
  final List<AdaptiveScaffoldDestination> destinations;
  final ValueChanged<int> onNavigationIndexChange;
  final FloatingActionButton floatingActionButton;
  final Color backgroundColor;

  final VoidCallback homePressed;

  const AdaptiveScaffold({
    Key key,
    this.title,
    this.actions = const [],
    this.body,
    @required this.currentIndex,
    @required this.destinations,
    this.onNavigationIndexChange,
    this.floatingActionButton,
    this.backgroundColor = const Color(0xFFFAFAFA),
    @required this.homePressed,
  }) : super(key: key);

  @override
  _AdaptiveScaffoldState createState() => _AdaptiveScaffoldState();
}

class _AdaptiveScaffoldState extends State<AdaptiveScaffold> {
  @override
  Widget build(BuildContext context) {
    // Show a Drawer
    if (_isLargeScreen(context)) {
      return Row(
        children: [
          Drawer(
            child: Container(
              // color: const Color(0xFFF2F2F2),
              color: Theme.of(context).colorScheme.surface,
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 180),
                        child: InkWell(
                          onTap: widget.homePressed,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 32.0,
                            ),
                            child: Text(
                              'Fun with Flutter',
                              style: GoogleFonts.firaCode(
                                textStyle: const TextStyle(fontSize: 32),
                              ),
                            ),
                          ),
                        ),
                      ),
                      for (var d in widget.destinations)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ListTileTheme(
                            selectedColor: Theme.of(context).accentColor,
                            child: ListTile(
                              leading: Icon(d.icon),
                              title: Text(
                                d.title,
                                style: GoogleFonts.firaCode(
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                              ),
                              selected: widget.destinations.indexOf(d) ==
                                  widget.currentIndex,
                              onTap: () => _destinationTapped(d),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 126,
                title: widget.title,
                actions: widget.actions,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              extendBodyBehindAppBar: true,
              body: widget.body,
              backgroundColor: widget.backgroundColor,
              floatingActionButton: widget.floatingActionButton,
            ),
          ),
        ],
      );
    }

    // Show a navigation rail
    if (_isMediumScreen(context)) {
      return Row(
        children: [
          NavigationRail(
            leading: widget.floatingActionButton,
            destinations: [
              ...widget.destinations.map(
                (d) => NavigationRailDestination(
                  icon: Icon(d.icon),
                  label: Text(d.title),
                ),
              ),
            ],
            selectedIndex: widget.currentIndex,
            onDestinationSelected: widget.onNavigationIndexChange ?? (_) {},
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                title: widget.title,
                actions: widget.actions,
                backgroundColor: Colors.transparent,
              ),
              body: widget.body,
              backgroundColor: widget.backgroundColor,
            ),
          ),
        ],
      );
    }

    // Show a bottom app bar
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        actions: widget.actions,
        backgroundColor: Colors.transparent,
      ),
      body: widget.body,
      backgroundColor: widget.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          ...widget.destinations.map(
            (d) => BottomNavigationBarItem(
              icon: Icon(d.icon),
              title: Text(d.title),
            ),
          ),
        ],
        currentIndex: widget.currentIndex,
        onTap: widget.onNavigationIndexChange,
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }

  void _destinationTapped(AdaptiveScaffoldDestination destination) {
    final idx = widget.destinations.indexOf(destination);
    if (idx != widget.currentIndex) {
      widget.onNavigationIndexChange(idx);
    }
  }
}
