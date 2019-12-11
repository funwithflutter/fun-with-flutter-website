import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/themes.dart';
import 'package:fun_with_flutter/ui/pages/home/components/sliver_home_header.dart';
import 'package:fun_with_flutter/ui/widgets/blog_post_card/blog_post_card.dart';
import 'package:fun_with_flutter/ui/widgets/support_the_channel/thank_you.dart';
import 'package:fun_with_flutter/ui/widgets/support_the_channel/the_wall_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _numberOfBlogsToLoad = 0;

  bool _isAuthenticated = false;

  bool _showSupporters = false;
  bool _showWall = true;

  ScrollController _scrollController;
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 0).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset > 0 && _showWall == true) {
      setState(() {
        _showWall = false;
        _controller.forward();
      });
    } else if (_scrollController.offset == 0 && _showWall == false) {
      setState(() {
        _showWall = true;
        _controller.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (BuildContext context, AuthenticationState state) {
            if (state is Authenticated) {
              setState(() {
                _isAuthenticated = true;
              });
            }
            if (state is Unauthenticated) {
              setState(() {
                _isAuthenticated = false;
              });
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
              } else if (width >= 900) {
                crossAxisCount = 2;
                maxWidth = 800;
              } else if (width >= 420) {
                crossAxisCount = 1;
                maxWidth = 400;
              } else {
                maxWidth = width;
              }
              if (state is BlogLoaded)
                _numberOfBlogsToLoad = (state.blog.pages.length >= 5)
                    ? 6
                    : state.blog.pages.length;
              return Center(
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: <Widget>[
                    const SliverIntroductionHeader(),
                    if (_isAuthenticated) const SliverRevealSecret(),
                    if (!_isAuthenticated) const SliverMotivateLogin(),
                    const SliverToBoxAdapter(
                      child: Center(child: HeaderWidget('Recent blog posts')),
                    ),
                    if (state is BlogLoading)
                      const SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator())),
                    if (state is BlogLoaded)
                      SliverPadding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                (MediaQuery.of(context).size.width - maxWidth) /
                                    2,
                          ),
                          sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return BlogPostCard(
                                  key: ValueKey(state.blog.pages[index].title),
                                  post: state.blog.pages[index],
                                );
                              },
                              childCount: _numberOfBlogsToLoad,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    childAspectRatio: 10 / 9),
                          )),
                  ],
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: TheWallButton(
              callback: () {
                setState(() {
                  _showSupporters = true;
                });
              },
            ),
          ),
        ),
        Visibility(
          visible: _showSupporters,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _showSupporters = false;
              });
            },
            child: ModalBarrier(
              color: Colors.black54,
            ),
          ),
        ),
        Visibility(
          visible: _showSupporters,
          child: ThankYou(
            onClosePressed: () {
              setState(() {
                _showSupporters = false;
              });
            },
          ),
        )
      ],
    );
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
