import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccentButton extends StatelessWidget {
  const AccentButton({
    Key key,
    @required this.onPressed,
    @required this.label,
  })  : assert(onPressed != null),
        assert(label != null),
        super(key: key);

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: GoogleFonts.firaCode(
          textStyle: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
