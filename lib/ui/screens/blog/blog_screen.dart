import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/filtered_blog/bloc.dart';
import 'package:fun_with_flutter/ui/widgets/blog_post_card/blog_post_card.dart';
import 'package:fun_with_flutter/ui/widgets/error/error_widget.dart';
import 'package:fun_with_flutter/utils/tag_name_generator.dart';

class FilteredBlogPosts extends StatefulWidget {
  @override
  FilteredBlogPostsState createState() => FilteredBlogPostsState();
}

class FilteredBlogPostsState extends State<FilteredBlogPosts>
    with SingleTickerProviderStateMixin {
  static const _bouncingScrollPhysics = BouncingScrollPhysics();
  final Tween<double> _paddingTween = Tween<double>(begin: 32, end: 0);

  AnimationController _animationController;
  Animation<double> _paddingAnimation;
  AnimationStatus _animationStatus;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
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

  void _restartAnimation() {
    // Only restarts the animation if it is already completed, to avoid jittery behaviour on screen resize
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
    return BlocBuilder(
      bloc: BlocProvider.of<FilteredBlogBloc>(context),
      builder: (BuildContext context, FilteredBlogState state) {
        if (state is FilteredBlogLoading) {
          return Center(
            child: Container(
                height: double.infinity,
                child: const CircularProgressIndicator()),
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
                        childAspectRatio: 3 / 2,
                        padding: const EdgeInsets.all(16),
                        physics: _bouncingScrollPhysics,
                        children: <Widget>[
                          for (var page in state.filteredBlog.pages)
                            BlogPostCard(
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
        return const CustomError(
          errorMessage: 'Blog data could not be loaded',
        );
      },
    );
  }
}
