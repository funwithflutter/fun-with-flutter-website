import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

class OverlayPannel extends StatelessWidget {
  const OverlayPannel({
    Key key,
    @required this.onClosedPressed,
    @required this.child,
    this.sizeRatio = 0.75,
    this.maxWidth = 500,
    this.minWidth = 300,
    this.maxHeight = 500,
    this.minHeight = 300,
  })  : assert(onClosedPressed != null),
        assert(child != null),
        assert(sizeRatio != null),
        assert(maxWidth != null &&
            minWidth != null &&
            maxHeight != null &&
            minHeight != null),
        super(key: key);

  final VoidCallback onClosedPressed;
  final Widget child;
  final double sizeRatio;
  final double maxWidth;
  final double minWidth;
  final double maxHeight;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    return _Pannel(
      overlaySize: MediaQuery.of(context).size,
      onClosedPressed: onClosedPressed,
      child: child,
      sizeRatio: sizeRatio,
      maxWidth: maxWidth,
      minWidth: minWidth,
      maxHeight: maxHeight,
      minHeight: minHeight,
    );
  }
}

class _Pannel extends StatefulWidget {
  const _Pannel({
    Key key,
    @required this.onClosedPressed,
    @required this.child,
    @required this.overlaySize,
    @required this.sizeRatio,
    @required this.maxWidth,
    @required this.minWidth,
    @required this.maxHeight,
    @required this.minHeight,
  })  : assert(onClosedPressed != null),
        assert(child != null),
        assert(overlaySize != null && sizeRatio != null),
        assert(maxWidth != null &&
            minWidth != null &&
            maxHeight != null &&
            minHeight != null),
        super(key: key);

  final VoidCallback onClosedPressed;
  final Widget child;
  final Size overlaySize;
  final double sizeRatio;
  final double maxWidth;
  final double minWidth;
  final double maxHeight;
  final double minHeight;

  @override
  __PannelState createState() => __PannelState();
}

class __PannelState extends State<_Pannel> with AfterLayoutMixin<_Pannel> {
  Offset _pannelEndPosition;
  Offset _pannelBeginPosition;
  Offset _animatedPosition = const Offset(0, 0);
  Size _pannelSize;

  // static const sizeRatio = 0.75;

  Size get _overlaySize => widget.overlaySize;
  double get _sizeRatio => widget.sizeRatio;
  double get _maxWidth => widget.maxWidth;
  double get _minWidth => widget.minWidth;
  double get _maxHeight => widget.maxHeight;
  double get _minHeight => widget.minHeight;

  @override
  void initState() {
    _setSizeAndPosition();
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _popUpModal();
  }

  void _popUpModal() {
    setState(() {
      _animatedPosition = _pannelEndPosition;
    });
  }

  void _setSizeAndPosition() {
    var width = _overlaySize.width * _sizeRatio;
    if (width > _maxWidth) {
      width = _maxWidth;
    } else if (width < _minWidth) {
      width = _minWidth;
    }
    var height = _overlaySize.height * _sizeRatio;
    if (height > _maxHeight) {
      height = _maxHeight;
    } else if (height < _minHeight) {
      height = _minHeight;
    }
    _pannelSize = Size(width, height);
    _pannelEndPosition = Offset(
        _overlaySize.width - _overlaySize.width / 2 - _pannelSize.width / 2,
        _overlaySize.height / 2 - _pannelSize.height / 2);
    _pannelBeginPosition = Offset(_pannelEndPosition.dx, _overlaySize.height);
    _animatedPosition = _pannelBeginPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: GestureDetector(
            onTap: widget.onClosedPressed,
            child: ModalBarrier(
              color: Colors.black54,
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
          top: _animatedPosition.dy,
          left: _animatedPosition.dx,
          width: _pannelSize.width,
          height: _pannelSize.height,
          child: Container(
            child: Card(
              color: Colors.white,
              elevation: 4.0,
              child: Stack(
                children: <Widget>[
                  widget.child,
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: widget.onClosedPressed,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
