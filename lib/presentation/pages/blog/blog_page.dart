import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/filtered_blog/filtered_blog_bloc.dart';
import '../../../domain/blog/tag.dart';
import '../../common/header.dart';
import '../../common/info_bar.dart';
import '../../common/loading_indicator.dart';
import '../../core/constants.dart';
import 'widgets/blog_posts.dart';
import 'widgets/tag_widgets.dart';

class FilteredBlogPage extends StatelessWidget {
  const FilteredBlogPage();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBlogBloc, FilterBlogState>(
      builder: (BuildContext context, FilterBlogState state) {
        return Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Scrollbar(
                child: CustomScrollView(
                  slivers: <Widget>[
                    const SliverSafeArea(
                      sliver: SliverHeader(label: 'Blog Posts'),
                    ),
                    _displayTags(state),
                    _displayPosts(
                      context,
                      state,
                      constraints.maxWidth > kMaxBodyWidth
                          ? kMaxBodyWidth
                          : constraints.maxWidth,
                      constraints.maxWidth,
                    ),
                    const SliverBottomInfoBar()
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _displayTags(
    FilterBlogState state,
  ) {
    return state.map(
      error: (_) => const SliverToBoxAdapter(),
      loading: (_) => const SliverToBoxAdapter(),
      loaded: (s) => SliverToBoxAdapter(
        child: TagsSelection(
          tags: s.filteredBlog.tags,
          currentTag: s.tagFilter,
        ),
      ),
    );
  }

  Widget _displayPosts(BuildContext context, FilterBlogState state,
      double width, double maxWidth) {
    return state.map(
      loading: (_) {
        return const SliverLoadingIndicator();
      },
      error: (_) {
        return const NoBlogPosts();
      },
      loaded: (state) {
        return BlogPosts(
          blog: state.filteredBlog,
          width: width,
          maxWidth: maxWidth,
          onTagTap: (tag) {
            context.bloc<FilterBlogBloc>().add(
                  FilterBlogEvent.filterByTag(tag),
                );
          },
        );
      },
    );
  }
}

class TagsSelection extends StatelessWidget {
  const TagsSelection({
    Key key,
    @required this.tags,
    @required this.currentTag,
  }) : super(key: key);

  final List<Tag> tags;
  final String currentTag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              ...tags?.map(
                (tag) {
                  TagConfiguartion tagConfig;
                  if (tag.name == currentTag) {
                    tagConfig =
                        TagConfiguartion.bigTag(tag.name, isSelected: true);
                  } else {
                    tagConfig = TagConfiguartion.bigTag(tag.name);
                  }
                  return TagWidget(
                    tagConfig: tagConfig,
                    onTap: (tag) {
                      BlocProvider.of<FilterBlogBloc>(context).add(
                        FilterBlogEvent.filterByTag(tagConfig.tag),
                      );
                    },
                  );
                },
              )?.toList()
            ],
          ),
        ],
      ),
    );
  }
}
