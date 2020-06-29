import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/blog/blog_bloc.dart';
import '../../common/sliver_loading_indicator.dart';
import '../../components/info_bar.dart';
import '../blog/widgets/blog_posts.dart';
import 'components/sliver_course_header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    const SliverSafeArea(
                      sliver: _SliverHeader(lable: 'Courses'),
                    ),
                    const SliverCourseHeader(),
                    const _SliverHeader(lable: 'Recent blog posts'),
                    _displayPosts(state, constraints.maxWidth),
                    const SliverBottomInfoBar()
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
        return const NoBlogPosts();
      },
      loaded: (state) {
        return BlogPosts(
          state: state,
          width: maxWidth,
          limitNumberOfBlogs: 2,
        );
      },
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
