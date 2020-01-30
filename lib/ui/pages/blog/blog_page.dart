import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/filtered_blog/bloc.dart';
import 'package:fun_with_flutter/ui/widgets/blog_post_card/blog_post_card.dart';
import 'package:fun_with_flutter/ui/widgets/error/error_widget.dart';
import 'package:fun_with_flutter/utils/tag_name_generator.dart';

class FilteredBlogPage extends StatefulWidget {
  @override
  FilteredBlogPageState createState() => FilteredBlogPageState();
}

class FilteredBlogPageState extends State<FilteredBlogPage>
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
    return BlocBuilder<FilteredBlogBloc, FilteredBlogState>(
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
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width - maxWidth) / 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 16.0),
                  child: Text(
                    TagDisplayNameGenerator.mapTagToDisplayName(
                        state.tagFilter),
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
                AnimatedBuilder(
                  animation: _paddingAnimation,
                  builder: (context, child) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: _paddingAnimation.value,
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            childAspectRatio: 10 / 9,
                          ),
                          // physics: _bouncingScrollPhysics,
                          itemCount: state.filteredBlog.pages.length,
                          itemBuilder: (context, index) {
                            return BlogPostCard(
                                post: state.filteredBlog.pages[index]);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
        return const CustomError(
          errorMessage: 'Blog data could not be loaded',
        );
      },
    );
  }
}
