import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/themes/app_colors.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key key, this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    final filteredBlogBloc = BlocProvider.of<FilteredBlogBloc>(context);
    final pageBloc = BlocProvider.of<PageBloc>(context);
    return Container(
      width: width,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          _menuButton(Icons.widgets, 'Custom Widgets', () {
            filteredBlogBloc.dispatch(ClearFilters());
            pageBloc.dispatch(UpdatePage(PageState.widget));
          }),
          _MenuSection(
            title: 'Tags',
            child: BlocBuilder(
              bloc: filteredBlogBloc,
              builder: (BuildContext context, FilteredBlogState state) {
                if (state is FilteredBlogLoading) {
                  return const Text('Loading data...');
                }
                if (state is FilteredBlogLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      for (final tag in state.filteredBlog.tags)
                        _Tag(
                          tagName: tag.name,
                          currentFilter: state.tagFilter,
                        ),
                    ],
                  );
                }
                return const Text('Something went wrong');
              },
            ),
          ),
          _MenuSection(
            child: _menuButton(Icons.question_answer, 'About', () {
              filteredBlogBloc.dispatch(ClearFilters());
              pageBloc.dispatch(UpdatePage(PageState.about));
            }),
          ),
        ],
      ),
    );
  }
}

Widget _menuButton(IconData iconData, String lable, Function() onPressed) {
  return FlatButton(
    onPressed: onPressed,
    child: _menuLable(iconData, lable),
  );
}

Widget _menuLable(IconData iconData, String lable) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Icon(
        iconData,
        color: fadedBlack,
      ),
      const SizedBox(
        width: 20,
      ),
      Flexible(
        child: Text(
          lable,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: fadedBlack,
          ),
        ),
      ),
    ],
  );
}

class _Tag extends StatelessWidget {
  const _Tag({Key key, this.tagName, this.currentFilter}) : super(key: key);

  final String tagName;
  final String currentFilter;

  @override
  Widget build(BuildContext context) {
    final filteredBlogBloc = BlocProvider.of<FilteredBlogBloc>(context);
    final pageBloc = BlocProvider.of<PageBloc>(context);
    final iconData =
        (tagName == currentFilter) ? Icons.label : Icons.label_outline;
    return _menuButton(iconData, tagName, () {
      pageBloc.dispatch(UpdatePage(PageState.tagsFilter));
      filteredBlogBloc.dispatch(FilterByTag(tagName));
    });
  }
}

class _MenuSection extends StatelessWidget {
  const _MenuSection({Key key, @required this.child, this.title})
      : super(key: key);

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: (title != null)
              ? Text(
                  title?.toUpperCase(),
                )
              : Container(
                  height: 0.1,
                  color: secondaryColor,
                ), // error in Flutter - not showing the divider unless something is rendered beneath it
        ),
        child
      ],
    );
  }
}
