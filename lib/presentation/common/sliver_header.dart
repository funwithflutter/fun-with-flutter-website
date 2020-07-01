import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constants.dart';

class SliverHeader extends StatelessWidget {
  const SliverHeader({
    Key key,
    @required this.lable,
  }) : super(key: key);

  final String lable;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: kMaxBodyWidth),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                lable,
                style: GoogleFonts.firaCode(fontSize: 32),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
