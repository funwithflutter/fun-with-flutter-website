import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/themes.dart';
import 'package:fun_with_flutter/ui/pages/home/components/sliver_home_header.dart';
import 'package:fun_with_flutter/ui/widgets/blog_post_card/blog_post_card.dart';
import 'package:provider/provider.dart';

class LogoAnimationNotifier extends ChangeNotifier {
  LogoAnimationNotifier(bool isAnimating) {
    _animationFinished = isAnimating;
  }
  bool _animationFinished = false;

  void setAnimationFinished() {
    _animationFinished = true;
    notifyListeners();
  }

  bool get isAnimationFinished => _animationFinished;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0;

  int _numberOfBlogsToLoad = 0;

  bool _isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => LogoAnimationNotifier(false),
      child: Stack(
        children: <Widget>[
          Consumer<LogoAnimationNotifier>(
            builder: (context, state, child) {
              if (state.isAnimationFinished) {
                _opacity = 1;
              }
              return Container(
                child: Center(
                  child: AnimatedOpacity(
                    opacity: _opacity,
                    duration: const Duration(milliseconds: 400),
                    child: const Image(
                      image:
                          AssetImage('assets/fun_with_flutter_grey_icon.png'),
                    ),
                  ),
                ),
              );
            },
          ),
          BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (BuildContext context, AuthenticationState state) {
              if (state is Authenticated) {
                _isAuthenticated = true;
              }
              if (state is Unauthenticated) {
                _isAuthenticated = false;
              }
            },
            child: BlocBuilder<BlogBloc, BlogState>(
              builder: (BuildContext context, BlogState state) {
                int crossAxisCount = 1;
                final width = MediaQuery.of(context).size.width;
                double maxWidth = 1200;
                if (width >= 1200) {
                  crossAxisCount = 3;
                  maxWidth = 1200;
                } else if (width >= 800) {
                  crossAxisCount = 2;
                  maxWidth = 800;
                } else {
                  crossAxisCount = 1;
                  maxWidth = 700;
                }
                if (state is BlogLoaded)
                  _numberOfBlogsToLoad = (state.blog.pages.length >= 3)
                      ? 3
                      : state.blog.pages.length;
                return Center(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      const SliverIntroductionHeader(),
                      if (_isAuthenticated)
                        const SliverRevealSecret(),
                      if (!_isAuthenticated)
                        const SliverMotivateLogin(),
                      const SliverToBoxAdapter(
                        child: Center(child: HeaderWidget('Recent blog posts')),
                      ),
                      if (state is BlogLoading)
                        const SliverToBoxAdapter(
                            child: Center(child: CircularProgressIndicator())),
                      if (state is BlogLoaded)
                        SliverToBoxAdapter(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: maxWidth),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: <Widget>[
                                for (var i = 0; i < _numberOfBlogsToLoad; i++)
                                  BlogPostCard(
                                    post: state.blog.pages[i],
                                  )
                              ],
                            ),
                          ),
                        )
                      // SliverGrid.count(
                      //   crossAxisCount: crossAxisCount,
                      //   childAspectRatio: 10/9,
                      //   children: <Widget>[
                      //     for (var i = 0; i < _numberOfBlogsToLoad; i++)
                      //       BlogPostCard(
                      //         post: state.blog.pages[i],
                      //       )
                      //   ],
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
          const LogoLoader(),
        ],
      ),
    );
  }
}

class LogoLoader extends StatefulWidget {
  const LogoLoader({Key key}) : super(key: key);

  @override
  _LogoLoaderState createState() => _LogoLoaderState();
}

class _LogoLoaderState extends State<LogoLoader>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _scaleDownAnimation;
  Animation<double> _opacityDownAnimation;
  Animation<double> _opacityUpAnimation;

  double _scale = 0.7;
  double _opacity = 0;

  bool _animationFinished = false;

  final _flutterImage = Image.asset(
    'assets/fun_with_flutter_icon.png',
  );

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.6, curve: Curves.ease),
      ),
    );
    _scaleDownAnimation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1, curve: Curves.easeInOut),
      ),
    );
    _opacityDownAnimation = Tween<double>(begin: 0, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.8, 1, curve: Curves.easeInOut),
      ),
    );
    _opacityUpAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.5, curve: Curves.ease),
      ),
    );
    _controller.addListener(_animationListener);
    _controller.addStatusListener(_statusListener);

    _flutterImage.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, bool _) {
          _controller
              .forward(); // start the animation on once the image is loaded
        },
      ),
    );
    super.initState();
  }

  void _animationListener() {
    setState(() {
      _scale = _scaleAnimation.value - _scaleDownAnimation.value;
      _opacity = _opacityUpAnimation.value - _opacityDownAnimation.value;
    });
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(
        () {
          _animationFinished = true;
          Provider.of<LogoAnimationNotifier>(context, listen: false)
              .setAnimationFinished();
        },
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_animationFinished)
      return IgnorePointer(
        child: Container(
          child: Opacity(
            opacity: _opacity,
            child: Transform.scale(
              scale: _scale,
              child: Container(
                child: Center(
                  child: _flutterImage,
                ),
              ),
            ),
          ),
        ),
      );
    return Container();
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(text, style: Theme.of(context).textTheme.display1),
    );
  }
}

class SliverRevealSecret extends StatefulWidget {
  const SliverRevealSecret({Key key}) : super(key: key);

  @override
  _SliverRevealSecretState createState() => _SliverRevealSecretState();
}

class _SliverRevealSecretState extends State<SliverRevealSecret> {
  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Legend'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'Thank you for signing up!',
                  style: TextStyle(color: AppTheme.accentColor),
                ),
                Text(
                    'The YouTube channel that has provided me with the best Flutter content is...'),
                Text(
                  'Reso Coder',
                  style: TextStyle(color: AppTheme.secondaryColor),
                ),
                Text(
                    "I'd provide you with a link but I'm too lazy to code it."),
                Text(
                  "Stay on my website instead, why don't you.",
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: FlatButton(
          onPressed: () {
            _neverSatisfied();
          },
          child: const Text(
            'Click me to reveal my secret',
          ),
        ),
      ),
    );
  }
}

class SliverMotivateLogin extends StatelessWidget {
  const SliverMotivateLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
          child: Text(
              'Sign in to reveal which YouTube channel I think currently provides the best Flutter content.')),
    );
  }
}
