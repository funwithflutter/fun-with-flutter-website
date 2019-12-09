import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/app_state/bloc.dart';

class OverlayPannel extends StatefulWidget {
  const OverlayPannel({
    Key key,
    @required this.child,
    this.sizeRatio = 0.75,
  })  : assert(child != null),
        assert(sizeRatio != null),
        super(key: key);

  final Widget child;
  final double sizeRatio;

  @override
  _OverlayPannelState createState() => _OverlayPannelState();
}

class _OverlayPannelState extends State<OverlayPannel>
    with SingleTickerProviderStateMixin {
  double get _sizeRatio => widget.sizeRatio;

  AnimationController _controller;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(curve: Curves.ease, parent: _controller));
    _controller.forward(from: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            BlocProvider.of<AppStateBloc>(context)
                .add(UpdateState(AppState.normal));
          },
          child: ModalBarrier(
            color: Colors.black54,
          ),
        ),
        Positioned.fill(
          child: SlideTransition(
            position: _slideAnimation,
            child: FractionallySizedBox(
              widthFactor: _sizeRatio,
              heightFactor: _sizeRatio,
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
                        onPressed: () {
                          BlocProvider.of<AppStateBloc>(context)
                              .add(UpdateState(AppState.normal));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
