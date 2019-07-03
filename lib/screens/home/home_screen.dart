import 'dart:html' as html;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/blocs/blog/blog_bloc.dart';
import 'package:fun_with_flutter/blocs/blog/blog_state.dart';
import 'package:fun_with_flutter/blocs/filtered_blog/filtered_blog.dart';
import 'package:fun_with_flutter/blocs/page/page.dart';
import 'package:fun_with_flutter/components/menu_drawer.dart';
import 'package:fun_with_flutter/logic/tag_name_generator.dart';
import 'package:fun_with_flutter/screens/about/about_screen.dart';
import 'package:fun_with_flutter/screens/custom_widgets/custom_widgets.dart';
import 'package:fun_with_flutter/themes/app_colors.dart';
import 'package:fun_with_flutter/components/post_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  static const double menuSize = 300;

  final Duration animationDuration = Duration(milliseconds: 150);
  AnimationController _controller;
  Animation<double> menuAnimation;
  Tween<double> tween = Tween<double>()
    ..begin = 0
    ..end = menuSize;

  bool menuIsVisible = false;
  bool isSmallScreen = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: animationDuration);
    menuAnimation = tween
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.addStatusListener(_setMenuVisibleOnAnimationStatusChange);

    super.initState();
  }

  void _setMenuVisibleOnAnimationStatusChange(status) {
    if (status == AnimationStatus.forward) {
      menuIsVisible = true;
    } else if (status == AnimationStatus.dismissed) {
      menuIsVisible = false;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setScreenSize(Size screenSize) {
    if (screenSize.width < 750) {
      setState(() {
        isSmallScreen = true;
      });
    } else if (isSmallScreen == true) {
      setState(() {
        isSmallScreen = false;
      });
    } // TODO(Anyone): Need to refine this entire process.
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    _setScreenSize(screenSize);
    final pageBloc = BlocProvider.of<PageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            pageBloc.dispatch(UpdatePage(PageState.home));
          },
          child: Text(
            'Fun with Flutter',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            if (menuIsVisible) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: menuAnimation,
            color: fadedBlack,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Github', style: Theme.of(context).textTheme.title),
            onPressed: () {
              html.window.open('https://github.com/funwithflutter', 'Github');
            },
          ),
          FlatButton(
            child: Text('YouTube', style: Theme.of(context).textTheme.title),
            onPressed: () {
              html.window.open('https://youtube.com/funwithflutter', 'YouTube');
            },
          ),
        ],
        elevation: 1,
      ),
      body: AnimatedBuilder(
        animation: menuAnimation,
        builder: (context, widget) {
          return Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  if (!isSmallScreen)
                    SizedBox(
                        width: menuAnimation
                            .value), // this will push all the widgets to the right as the menu opens
                  BlocBuilder(
                    bloc: BlocProvider.of<PageBloc>(context),
                    builder: (BuildContext context, PageState state) {
                      if (state == PageState.home) {
                        return Expanded(child: _Home());
                      } else if (state == PageState.tagsFilter) {
                        return Expanded(
                          child: _FilteredPosts(),
                        );
                      } else if (state == PageState.widget) {
                        return CustomWidgets();
                      } else if (state == PageState.about) {
                        return AboutScreen();
                      } else {
                        return const Expanded(
                          child: Text(
                              "Whoops you found something that's not yet implemented."),
                        );
                      }
                    },
                  ),
                ],
              ),
              if (menuIsVisible)
                Transform.translate(
                  offset: Offset(-menuSize + menuAnimation.value, 0),
                  child: Container(
                    decoration: isSmallScreen
                        ? BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(5.0, 10.0),
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                              )
                            ],
                          )
                        : null,
                    child: const MenuDrawer(
                      width: menuSize,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _RecentBlogs(),
      ],
    );
  }
}

class _RecentBlogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blogBloc = BlocProvider.of<BlogBloc>(context);
    return BlocBuilder(
      bloc: blogBloc,
      builder: (BuildContext context, BlogState state) {
        if (state is BlogLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is BlogLoaded) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: GridView.extent(
                maxCrossAxisExtent: 750,
                childAspectRatio: 3/2,
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  for (var page in state.blog.pages)
                    PostCard(
                      post: page,
                    )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class _FilteredPosts extends StatefulWidget {
  @override
  _FilteredPostsState createState() => _FilteredPostsState();
}

class _FilteredPostsState extends State<_FilteredPosts>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  final Tween<double> _paddingTween = Tween<double>(begin: 32, end: 0);
  Animation<double> _paddingAnimation;
  AnimationStatus _animationStatus;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..addStatusListener(_animationStatusListener);
    _paddingAnimation = _paddingTween.animate(CurvedAnimation(
      curve: Curves.easeOut,
      parent: _animationController,
    ));
    _animationController.forward();

    super.initState();
  }

  void _animationStatusListener(AnimationStatus status) {
    _animationStatus = status;
  }

  // Only restarts the animation if it is already completed, to avoid jittery behaviour on screen resize
  void _restartAnimation() {
    if (_animationStatus == AnimationStatus.completed) {
      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bouncingScrollPhysics = BouncingScrollPhysics();
    return BlocBuilder(
      bloc: BlocProvider.of<FilteredBlogBloc>(context),
      builder: (BuildContext context, FilteredBlogState state) {
        if (state is FilteredBlogLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FilteredBlogLoaded) {
          _restartAnimation();
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 16.0),
                child: Text(
                  TagDisplayNameGenerator.mapTagToDisplayName(state.tagFilter),
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              AnimatedBuilder(
                animation: _paddingAnimation,
                builder: (context, child) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: _paddingAnimation.value),
                      child: GridView.extent(
                        maxCrossAxisExtent: 1200,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3/2,
                        padding: const EdgeInsets.all(16),
                        physics: bouncingScrollPhysics,
                        children: <Widget>[
                          for (var page in state.filteredBlog.pages)
                            PostCard(
                              post: page,
                            )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        }
        return const Text('Something went wrong');
      },
    );
  }
}
