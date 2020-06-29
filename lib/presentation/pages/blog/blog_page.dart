import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/blog/blog_bloc.dart';
import '../../common/sliver_loading_indicator.dart';
import '../../components/info_bar.dart';
import 'widgets/blog_posts.dart';

class FilteredBlogPage extends StatefulWidget {
  @override
  _FilteredBlogPageState createState() => _FilteredBlogPageState();
}

class _FilteredBlogPageState extends State<FilteredBlogPage> {
  ScrollController _scrollController;

  static const double _kScrollBodyWidth = 900;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (BuildContext context, BlogState state) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _kScrollBodyWidth),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomScrollView(
                  controller: _scrollController,
                  slivers: <Widget>[
                    const _SliverHeader(lable: 'Blog posts'),
                    _displayPosts(state, constraints.maxWidth),
                    const _SliverBottomInfoBar()
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _displayPosts(BlogState state, double maxWidth) {
    return state.map(
      initial: (_) {
        return const SliverLoadingIndicator();
      },
      loading: (_) {
        return const SliverLoadingIndicator();
      },
      error: (_) {
        return const _NoBlogPosts();
      },
      loaded: (state) {
        return BlogPosts(
          state: state,
          width: maxWidth,
        );
      },
    );
  }
}

class _SliverBottomInfoBar extends StatelessWidget {
  const _SliverBottomInfoBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: InfoBar(),
    );
  }
}

class _SliverHeader extends StatelessWidget {
  const _SliverHeader({
    Key key,
    @required this.lable,
  }) : super(key: key);

  final String lable;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
    );
  }
}

class _NoBlogPosts extends StatelessWidget {
  const _NoBlogPosts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text(
          'No blog content to show :(',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// class _LoadingIndicator extends StatelessWidget {
//   const _LoadingIndicator({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const SliverToBoxAdapter(
//       child: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// class FilteredBlogPage extends StatefulWidget {
//   @override
//   FilteredBlogPageState createState() => FilteredBlogPageState();
// }

// class FilteredBlogPageState extends State<FilteredBlogPage>
//     with SingleTickerProviderStateMixin {
//   final Tween<double> _paddingTween = Tween<double>(begin: 32, end: 0);

//   AnimationController _animationController;
//   Animation<double> _paddingAnimation;
//   AnimationStatus _animationStatus;

//   @override
//   void initState() {
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     )..addStatusListener(_animationStatusListener);
//     _paddingAnimation = _paddingTween.animate(CurvedAnimation(
//       curve: Curves.easeOut,
//       parent: _animationController,
//     ));
//     _animationController.forward();

//     super.initState();
//   }

//   void _animationStatusListener(AnimationStatus status) {
//     _animationStatus = status;
//   }

//   void _restartAnimation() {
//     // Only restarts the animation if it is already completed, to avoid jittery behaviour on screen resize
//     if (_animationStatus == AnimationStatus.completed) {
//       _animationController.forward(from: 0);
//     }
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FilterBlogBloc, FilterBlogState>(
//       builder: (BuildContext context, FilterBlogState state) {
//         return state.map(
//           error: (_) {
//             return const CustomError(
//               errorMessage: 'Blog data could not be loaded',
//             );
//           },
//           loading: (_) {
//             return Center(
//               child: Container(
//                   height: double.infinity,
//                   child: const CircularProgressIndicator()),
//             );
//           },
//           loaded: (filterBlog) {
//             _restartAnimation();
//             int crossAxisCount = 1;
//             final width = MediaQuery.of(context).size.width;
//             double maxWidth = 1200;
//             if (width >= 1200) {
//               crossAxisCount = 3;
//               maxWidth = 1200;
//             } else if (width >= 900) {
//               crossAxisCount = 2;
//               maxWidth = 800;
//             } else if (width >= 420) {
//               crossAxisCount = 1;
//               maxWidth = 400;
//             } else {
//               maxWidth = width;
//             }
//             return Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal:
//                       (MediaQuery.of(context).size.width - maxWidth) / 2),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(left: 32, top: 16.0),
//                     child: Text(
//                       TagDisplayNameGenerator.mapTagToDisplayName(
//                           filterBlog.tagFilter),
//                       style: Theme.of(context).textTheme.headline6,
//                     ),
//                   ),
//                   AnimatedBuilder(
//                     animation: _paddingAnimation,
//                     builder: (context, child) {
//                       return Expanded(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                             vertical: _paddingAnimation.value,
//                           ),
//                           child: GridView.builder(
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: crossAxisCount,
//                               childAspectRatio: 10 / 9,
//                             ),
//                             // physics: _bouncingScrollPhysics,
//                             itemCount: filterBlog.filteredBlog.pages.length,
//                             itemBuilder: (context, index) {
//                               return BlogPostCard(
//                                   post: filterBlog.filteredBlog.pages[index]);
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
