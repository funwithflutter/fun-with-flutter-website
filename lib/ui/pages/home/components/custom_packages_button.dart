import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/page/bloc.dart';
import 'package:fun_with_flutter/themes.dart';

class CustomPackagesButton extends StatefulWidget {
  const CustomPackagesButton({
    Key key,
  }) : super(key: key);

  @override
  _CustomPackagesButtonState createState() => _CustomPackagesButtonState();
}

class _CustomPackagesButtonState extends State<CustomPackagesButton> {
  static const _stationaryColor = AppTheme.accentColor;
  static const _hoverColor = AppTheme.primaryColor;
  Color _color = _stationaryColor;

  void _onPointerEnter(PointerEnterEvent event) {
    _updateColor(_hoverColor);
  }

  void _onPointerExit(PointerExitEvent event) {
    _updateColor(_stationaryColor);
  }

  void _updateColor(Color color) {
    setState(() {
      _color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        onEnter: _onPointerEnter,
        onExit: _onPointerExit,
        child: GestureDetector(
          onTap: () {
            BlocProvider.of<PageBloc>(context).add(
              const UpdatePage(PageState.packages),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: _color,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Custom\nPackages',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.button.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
